<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Models\User;
use App\Models\Page;
use App\Models\Follower;
use App\Models\FollowPage;
use App\Models\UserPost;
use App\Models\PagePost;


use Validator;
use Illuminate\Support\Facades\Auth;
use Hash;

class ApiController extends Controller
{
    function registration(Request $request)
    {
        if($request->isMethod('post')){
            $data = $request->all();

            $rules = [
                'first_name' => 'required',
    			'last_name' => 'required',
                'email' =>'required|email|unique:users',
                'password' =>'required',
            ];
            $customMessage = [
                'first_name.required' => 'last name is required',
    			'last_name.required' => 'first name is required',
                'email.required' => 'Email is required',
                'email.email' => 'Valid email is required',
                'password.required' => 'Password is required',
            ];
            $validator = Validator::make($data,$rules,$customMessage);
            if($validator->fails()){
                return response()->json($validator->errors(),422);
            }

            $registerUser = new User();
            $registerUser->first_name = $data['first_name'];
            $registerUser->last_name = $data['last_name'];
            $registerUser->email = $data['email'];
            $registerUser->password = Hash::make($data['password']);
            $registerUser->save();

            $user = User::where('email',$data['email'])->first();
            $api_token = $user->createToken($data['email'])->accessToken;            
            User::where('email',$data['email'])->update(['access_token'=>$api_token]);
            $message = 'User Successfully Registerd';
            return response()->json([
                'message'=>$message,
                'user'=>$user,
                'access_token'=>$api_token],201);

                       
        }
    }


    function login(Request $request){
        if($request->isMethod('post')){
            $data = $request->all();           
            
            $rules = [
                'email' =>'required|email|exists:users',
                'password' =>'required',
    		];
    		$customMessage = [
    			'email.required' => 'Email is required',
    			'email.email' => 'Valid email is required',
    			'email.exists' => 'Email does not exists',
    			'password.required' => 'Password is required',
    		];
    		$validator = Validator::make($data,$rules,$customMessage);
            if($validator->fails()){
                return response()->json($validator->errors(),422);
            }
          
            $userDetails = User::where('email',$data['email'])->first();
          
            if(password_verify($data['password'], $userDetails->password)){
                $api_token = Str::random('50');
                User::where('email',$data['email'])->update(['access_token'=>$api_token]);
                $message = 'User Successfully Login!';
                return response()->json([
                    'message'=>$message,
                    'user'=>$userDetails,
                    'access_token'=>$api_token
                ],201);
            }else{
                return response()->json(['message'=>'Password is incorrect'],422);
            }
        }
    }


    function createPage(Request $request)
    {
        
        if($request->isMethod('post')){
            $data = $request->all();
            $header = $request->header('Authorization');
            if(empty($header)){
             return response()->json(['message'=>'Authorization is missing'],422);
            }else{
                if($header == 'dYpI1ChOB0uawMCZty21KiFjBdXH3wSRmyp0u81b0gUjps9wck'){
                 
                    $user = User::where('access_token', $header)->first();

                    $page = new Page;
                    $page->page_name = $data['page_name'];
                    $page->creator_id = $user->id;
                    $page->save();

                    $message = 'Page Successfully Created!';
                    return response()->json([
                        'page'=>$page,
                        'page_creator'=>$user
                        
                        
                        ]);                 
                }else{
                 return response()->json(['message'=>'Authorization is incorrect'],422); 
                }
            }
        }
    }

    function followUser(Request $request,$personId)
    {
        
        if($request->isMethod('post')){
            $data = $request->all();
            $header = $request->header('Authorization');
            if(empty($header)){
             return response()->json(['message'=>'Authorization is missing'],422);
            }else{
                if($header == 'dYpI1ChOB0uawMCZty21KiFjBdXH3wSRmyp0u81b0gUjps9wck'){
                    
                    $user = User::where('access_token', $header)->first();
                    $followID = User::where('id',$personId)->first();

                    if(isset($followID))
                    {
                        $CheckIfAlreadyFollowing = Follower::where('follow_to', $followID->id)->where('follow_by', $user->id)->count();
                        if($personId == $user->id)
                        {
                            return response()->json(['message'=>'Cannot follow yourself']);
                        }
                        else if($CheckIfAlreadyFollowing >= 1)
                        {
                            return response()->json(['message'=>'Already following to this user']);
                        }
                        else{

                            $follower = new Follower;
                            $follower->follow_to = $followID->id;
                            $follower->follow_by = $user->id;
                            $follower->save();
                            $message = 'User Successfully Followed!';
                            return response()->json(['message'=>$message]); 
                        }                     

                    }
                    else{
                        return response()->json([
                            'message'=>'No user found!'
                        ],404); 
                    }                
                }else{
                 return response()->json(['message'=>'Authorization is incorrect'],422); 
                }
            }
        }
    }


    function followPage(Request $request,$pageId)
    {
        
        if($request->isMethod('post')){
            
            $header = $request->header('Authorization');
            if(empty($header)){
             return response()->json(['message'=>'Authorization is missing'],422);
            }else{
                if($header == 'dYpI1ChOB0uawMCZty21KiFjBdXH3wSRmyp0u81b0gUjps9wck'){
                    
                    $user = User::where('access_token', $header)->first();
                    $page = Page::where('id', $pageId)->first();

                    if(isset($page))
                    {
                        $CheckIfAlreadyFollowing = FollowPage::where('page_id', $pageId)->where('user_id', $user->id)->count();
                        if($CheckIfAlreadyFollowing >= 1)
                        {
                            return response()->json(['message'=>'Already following this page']);
                        }
                        else{

                            $follower = new FollowPage;
                            $follower->page_id = $page->id;
                            $follower->user_id = $user->id;
                            $follower->save();
                            $message = 'User Started Following the Page!';
                            return response()->json(['message'=>$message]); 
                        }                     

                    }
                    else{
                        return response()->json([
                            'message'=>'No page found!'
                        ],404); 
                    }

                           
                }else{
                 return response()->json(['message'=>'Authorization is incorrect'],422); 
                }
            }
        }
    }



    function AddUserPost(Request $request)
    {
        if($request->isMethod('post'))
        {
            $data= $request->all();
            $header = $request->header('Authorization');
            if(empty($header)){
             return response()->json(['message'=>'Authorization is missing'],422);
            }else{
                if($header == 'dYpI1ChOB0uawMCZty21KiFjBdXH3wSRmyp0u81b0gUjps9wck'){
                    
                    $rules = [
                        'post_content' => 'required'
                    ];
                    $customMessage = [
                        'post_content.required' => 'post content is required',
                    ];
                    $validator = Validator::make($data,$rules,$customMessage);
                    if($validator->fails()){
                        return response()->json($validator->errors(),422);
                    }

                    $user = User::where('access_token', $header)->first();
                   
                    $post = new UserPost;
                    $post->post_content = $data['post_content'];
                    $post->user_id = $user->id;
                    $post->save();
                    $message = 'Post Successfully Created!';
                    return response()->json(['message'=>$message]);
                           
                }else{
                 return response()->json(['message'=>'Authorization is incorrect'],422); 
                }
            }
        }
    }


    function AddPagePost(Request $request, $pageId)
    {
        if($request->isMethod('post'))
        {
            $data= $request->all();
            $header = $request->header('Authorization');
            if(empty($header)){
             return response()->json(['message'=>'Authorization is missing'],422);
            }else{
                if($header == 'dYpI1ChOB0uawMCZty21KiFjBdXH3wSRmyp0u81b0gUjps9wck'){
                    
                    $rules = [
                        'post_content' => 'required'                        
                    ];
                    $customMessage = [
                        'post_content.required' => 'post content is required',
                    ];
                    $validator = Validator::make($data,$rules,$customMessage);
                    if($validator->fails()){
                        return response()->json($validator->errors(),422);
                    }

                    $user = User::where('access_token', $header)->first();
                    $page = Page::where('id', $pageId)->first();

                    if(isset($page))
                    {                         
                        if($page->creator_id == $user->id)
                        {
                            $post = new PagePost;
                            $post->post_content = $data['post_content'];
                            $post->page_id = $pageId;
                            $post->user_id = $user->id;
                            $post->save();
                            $message = 'Post Successfully Created!';
                            return response()->json(['message'=>$message]);
                        }
                        else{
                            return response()->json(['message'=>'You are not the creator of this page!']);
                        }
                    }
                    else{
                        return response()->json([
                            'message'=>'Page not found!'
                        ],404); 
                    }
                }else{
                 return response()->json(['message'=>'Authorization is incorrect'],422); 
                }
            }
        }
    }

    function GetFeed(Request $request)
    {
        if($request->isMethod('get')){
           
            $header = $request->header('Authorization');
            if(empty($header)){
             return response()->json(['message'=>'Authorization is missing'],422);
            }else{
                if($header == 'dYpI1ChOB0uawMCZty21KiFjBdXH3wSRmyp0u81b0gUjps9wck'){
                 
                    $userPosts = UserPost::orderBy('created_at','desc')->simplePaginate(3);;
                    $pagePosts = PagePost::orderBy('created_at','desc')->simplePaginate(3);;

                    $message = 'Page Successfully Created!';
                    return response()->json([
                        'UserPosts'=>$userPosts,
                        'PagePosts'=>$pagePosts
                        ]);                 
                }else{
                 return response()->json(['message'=>'Authorization is incorrect'],422); 
                }
            }
        }
    }
}
