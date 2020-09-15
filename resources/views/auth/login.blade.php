@extends('layouts.auth')
@section('content')
<link rel="stylesheet" href="{{ asset('assets/css/login.css')}}">
<script>
   window.console = window.console || function(t) {};
   if (document.location.search.match(/type=embed/gi)) {
     window.parent.postMessage("resize", "*");
   }
</script>
<div class="wrapper">
   <div class="container">
      <div class="row">
         <div class="col-md-6 offset-md-3">
            <div class="card" style="background:rgba(255,255,255, 0.1)">
               <div class="card-header border-0">
                  <img class="img-fluid rounded" src="{{ asset(Storage::url('logo/logo.png')) }}" alt="image" width="110" style="margin:0px auto;">
               </div>
               <div class="card-body" >
                  <span class="text-light">Login Form POMS App</span>
                  {{Form::open(array('route'=>'login','method'=>'post','id'=>'loginForm','class'=> 'login-form' ))}}
                  <div class="form-group">
                     {{Form::text('email',null,array('class'=>'form-control','placeholder'=>__('Enter Your Email')))}}
                     @error('email')
                     <span class="invalid-email text-danger" role="alert">
                     <strong>{{ $message }}</strong>
                     </span>
                     @enderror
                  </div>
                  <div class="form-group">
                     {{Form::password('password',array('class'=>'form-control','placeholder'=>__('Enter Your Password')))}}
                     @error('password')
                     <span class="invalid-password text-danger" role="alert">
                     <strong>{{ $message }}</strong>
                     </span>
                     @enderror
                  </div>
                  <div class="form-group">
                     <div class="custom-control custom-checkbox">
                        <input class="custom-control-input" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }} />
                        <label class="custom-control-label" for="remember">{{__('Remember Me')}}</label>
                     </div>
                  </div>
                  <div class="form-group">
                     {{Form::submit(__('Login'),array('class'=>'','id'=>'saveBtn'))}}
                  </div>
                  <div class="text-center mt-4 mb-3">
                     @if (Route::has('password.request'))
                     <a href="{{ route('password.request') }}">
                     {{ __('Forgot Your Password?') }}
                     </a>
                     @endif
                  </div>
                  {{Form::close()}}
               </div>
            </div>
            <div class="simple-footer text-info">
               {{__('Copyright')}} &copy; {{ (Utility::getValByName('footer_text')) ? Utility::getValByName('footer_text') :config('app.name', 'Workgo') }} {{date('Y')}}
            </div>
         </div>
      </div>
   </div>
   <ul class="bg-bubbles">
      <li></li>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
   </ul>
</div>
@endsection