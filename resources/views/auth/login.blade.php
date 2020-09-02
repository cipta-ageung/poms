@extends('layouts.auth')
@section('content')
    <section class="section" style="background: #005AA7;  /* fallback for old browsers */
background: -webkit-linear-gradient(to top, #FFFDE4, #005AA7);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to top, #FFFDE4, #005AA7); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 pt-4">
                    <div class="changeLanguage float-right mr-1 position-relative">
                        <select name="language" id="language" class="form-control w-25 position-absolute selectric" onchange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                            @foreach(Utility::languages() as $language)
                                <option @if($lang == $language) selected @endif value="{{ route('login',$language) }}">{{Str::upper($language)}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <div class="container mt-5">
            <div class="row">
                <div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
                    <div class="login-brand">
                        <img class="img-fluid rounded" src="{{ asset(Storage::url('logo/logo.png')) }}" alt="image" width="">
                    </div>

                    <div class="card card-primary">
                        <div class="card-header"><h4>{{__('Login')}}</h4></div>

                        <div class="card-body">
                            {{Form::open(array('route'=>'login','method'=>'post','id'=>'loginForm','class'=> 'login-form' ))}}
                            <div class="form-group">
                                {{Form::label('email','Email')}}
                                {{Form::text('email',null,array('class'=>'form-control','placeholder'=>__('Enter Your Email')))}}
                                @error('email')
                                <span class="invalid-email text-danger" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>

                            <div class="form-group">
                                <div class="d-block">
                                    {{Form::label('password','Password')}}
                                    {{Form::password('password',array('class'=>'form-control','placeholder'=>__('Enter Your Password')))}}
                                    @error('password')
                                    <span class="invalid-password text-danger" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="custom-control custom-checkbox">
                                    <input class="custom-control-input" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>
                                    <label class="custom-control-label" for="remember">{{__('Remember Me')}}</label>
                                </div>
                            </div>

                            <div class="form-group">
                                {{Form::submit(__('Login'),array('class'=>'btn btn-primary btn-lg btn-block','id'=>'saveBtn'))}}
                            </div>
                            {{Form::close()}}
                            <div class="text-center mt-4 mb-3">
                                @if (Route::has('password.request'))
                                    <a href="{{ route('password.request') }}">
                                        {{ __('Forgot Your Password?') }}
                                    </a>
                                @endif
                            </div>
                        </div>
                    </div>
                    <div class="simple-footer">
                        {{__('Copyright')}} &copy; {{ (Utility::getValByName('footer_text')) ? Utility::getValByName('footer_text') :config('app.name', 'Workgo') }} {{date('Y')}}
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
