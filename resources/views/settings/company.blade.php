@extends('layouts.admin')
@php
    $profile=asset(Storage::url('avatar/'));
    $logo=asset(Storage::url('logo/'));
@endphp
@section('page-title')
    {{__('Settings')}}
@endsection
@push('css-page')
    <link href="{{ asset('assets/modules/bootstrap-fileinput/bootstrap-fileinput.css') }}" rel="stylesheet" type="text/css"/>
@endpush
@push('script-page')
    <script src="{{ asset('assets/modules/bootstrap-fileinput/bootstrap-fileinput.js') }}" type="text/javascript"></script>
@endpush
@section('content')
    <section class="section">
        <div class="section-header">
            <h1>{{__('Settings')}}</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="{{route('dashboard')}}">{{__('Dashboard')}}</a></div>
                <div class="breadcrumb-item">{{__('Settings')}}</div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <div class="d-flex justify-content-between w-100">
                            <h4>{{__('Settings')}}</h4>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="setting-tab">
                            <ul class="nav nav-pills mb-3" id="myTab3" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="contact-tab4" data-toggle="tab" href="#site-setting" role="tab" aria-controls="" aria-selected="false">{{__('Site Setting')}}</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab3" data-toggle="tab" href="#company-setting" role="tab" aria-controls="" aria-selected="false">{{__('Company Setting')}}</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab3" data-toggle="tab" href="#email-setting" role="tab" aria-controls="" aria-selected="false">{{__('Email Setting')}}</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="contact-tab4" data-toggle="tab" href="#system-setting" role="tab" aria-controls="" aria-selected="false">{{__('System Setting')}}</a>
                                </li>
                            </ul>
                            <div class="tab-content" id="myTabContent2">
                                <div class="tab-pane fade fade show active" id="site-setting" role="tabpanel" aria-labelledby="profile-tab3">
                                    <div class="company-setting-wrap">
                                        {{Form::open(array('url'=>'systems','method'=>'POST','enctype' => "multipart/form-data"))}}
                                        <div class="card-body">
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="col-lg-4">
                                                        <p class="font-weight-bold"> {{__('Favicon')}} </p>
                                                        <div class="fileinput fileinput-new" data-provides="fileinput">
                                                            <div class="fileinput-new thumbnail">
                                                                <img src="{{ asset(Storage::url('logo/favicon.png')) }}" alt=""></div>
                                                            <div class="fileinput-preview fileinput-exists thumbnail fpreview"></div>
                                                            <div>
                                                            <span class="btn btn-primary btn-file">
                                                                <span class="fileinput-new"> {{__('Select image')}} </span>
                                                                <span class="fileinput-exists"> {{__('Change')}} </span>
                                                                <input type="hidden">
                                                                <input type="file" name="favicon" id="favicon">
                                                            </span>
                                                                <a href="javascript:;" class="btn btn-danger fileinput-exists" data-dismiss="fileinput"> {{__('Remove')}} </a>
                                                            </div>
                                                            @error('favicon')
                                                            <span class="invalid-favicon" role="alert">
                                                                    <strong class="text-danger">{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <p class="font-weight-bold"> {{__('Small Logo')}} </p>
                                                        <div class="fileinput fileinput-new" data-provides="fileinput">
                                                            <div class="fileinput-new thumbnail">
                                                                <img src="{{ asset(Storage::url('logo/small-logo.png')) }}" alt=""></div>
                                                            <div class="fileinput-preview fileinput-exists thumbnail fpreview"></div>
                                                            <div>
                                                                <span class="btn btn-primary btn-file">
                                                                    <span class="fileinput-new"> {{__('Select image')}} </span>
                                                                    <span class="fileinput-exists"> {{__('Change')}} </span>
                                                                    <input type="hidden">
                                                                    <input type="file" name="small_logo" id="small_logo">
                                                                </span>
                                                                <a href="javascript:;" class="btn btn-danger fileinput-exists" data-dismiss="fileinput"> {{__('Remove')}} </a>
                                                            </div>
                                                            @error('small_logo')
                                                            <span class="invalid-small_logo" role="alert">
                                                                    <strong class="text-danger">{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <p class="font-weight-bold"> {{__('Logo')}} </p>
                                                        <div class="fileinput fileinput-new" data-provides="fileinput">
                                                            <div class="fileinput-new thumbnail">
                                                                <img src="{{ asset(Storage::url('logo/logo.png')) }}" alt=""></div>
                                                            <div class="fileinput-preview fileinput-exists thumbnail fpreview"></div>
                                                            <div>
                                                            <span class="btn btn-primary btn-file">
                                                                <span class="fileinput-new"> {{__('Select image')}} </span>
                                                                <span class="fileinput-exists"> {{__('Change')}} </span>
                                                                <input type="hidden">
                                                                <input type="file" name="logo" id="logo">
                                                            </span>
                                                                <a href="javascript:;" class="btn btn-danger fileinput-exists" data-dismiss="fileinput"> {{__('Remove')}} </a>
                                                            </div>
                                                            @error('logo')
                                                            <span class="invalid-logo" role="alert">
                                                                    <strong class="text-danger">{{ $message }}</strong>
                                                                </span>
                                                            @enderror
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row pt-5">
                                                    <div class="form-group col-md-6">
                                                        {{Form::label('header_text',__('Title Text')) }}
                                                        {{Form::text('header_text',Utility::getValByName('header_text'),array('class'=>'form-control','placeholder'=>__('Enter Header Title Text')))}}
                                                        @error('header_text')
                                                        <span class="invalid-header_text" role="alert">
                                                            <strong class="text-danger">{{ $message }}</strong>
                                                        </span>
                                                        @enderror
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        {{Form::label('footer_text',__('Footer Text')) }}
                                                        {{Form::text('footer_text',Utility::getValByName('footer_text'),array('class'=>'form-control','placeholder'=>__('Enter Footer Text')))}}
                                                        @error('footer_text')
                                                        <span class="invalid-footer_text" role="alert">
                                                            <strong class="text-danger">{{ $message }}</strong>
                                                        </span>
                                                        @enderror
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-footer text-right">
                                            {{Form::submit(__('Save Change'),array('class'=>'btn btn-primary'))}}
                                        </div>
                                        {{Form::close()}}
                                    </div>
                                </div>
                                <div class="tab-pane fade fade" id="system-setting" role="tabpanel" aria-labelledby="profile-tab3">
                                    <div class="company-setting-wrap">
                                        {{Form::model($settings,array('route'=>'system.settings','method'=>'post'))}}
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    {{Form::label('site_currency',__('Currency *')) }}
                                                    {{Form::text('site_currency',null,array('class'=>'form-control font-style'))}}
                                                    @error('site_currency')
                                                    <span class="invalid-site_currency" role="alert">
                                                            <strong class="text-danger">{{ $message }}</strong>
                                                        </span>
                                                    @enderror
                                                </div>
                                                <div class="form-group col-md-6">
                                                    {{Form::label('site_currency_symbol',__('Currency Symbol *')) }}
                                                    {{Form::text('site_currency_symbol',null,array('class'=>'form-control'))}}
                                                    @error('site_currency_symbol')
                                                    <span class="invalid-site_currency_symbol" role="alert">
                                                            <strong class="text-danger">{{ $message }}</strong>
                                                        </span>
                                                    @enderror
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="form-control-label" for="example3cols3Input">{{__('Currency Symbol Position')}}</label>
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="custom-control custom-radio mb-3">

                                                                    <input type="radio" id="customRadio5" name="site_currency_symbol_position" value="pre" class="custom-control-input" @if(@$settings['site_currency_symbol_position'] == 'pre') checked @endif>
                                                                    <label class="custom-control-label" for="customRadio5">{{__('Pre')}}</label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="custom-control custom-radio mb-3">
                                                                    <input type="radio" id="customRadio6" name="site_currency_symbol_position" value="post" class="custom-control-input" @if(@$settings['site_currency_symbol_position'] == 'post') checked @endif>
                                                                    <label class="custom-control-label" for="customRadio6">{{__('Post')}}</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="site_date_format" class="form-control-label">{{__('Date Format')}}</label>
                                                    <select type="text" name="site_date_format" class="form-control" id="site_date_format">
                                                        <option value="M j, Y" @if(@$settings['site_date_format'] == 'M j, Y') selected="selected" @endif>Jan 1,2015</option>
                                                        <option value="d-m-Y" @if(@$settings['site_date_format'] == 'd-m-Y') selected="selected" @endif>d-m-y</option>
                                                        <option value="m-d-Y" @if(@$settings['site_date_format'] == 'm-d-Y') selected="selected" @endif>m-d-y</option>
                                                        <option value="Y-m-d" @if(@$settings['site_date_format'] == 'Y-m-d') selected="selected" @endif>y-m-d</option>
                                                    </select>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="site_time_format" class="form-control-label">{{__('Time Format')}}</label>
                                                    <select type="text" name="site_time_format" class="form-control" id="site_time_format">
                                                        <option value="g:i A" @if(@$settings['site_time_format'] == 'g:i A') selected="selected" @endif>10:30 PM</option>
                                                        <option value="g:i a" @if(@$settings['site_time_format'] == 'g:i a') selected="selected" @endif>10:30 pm</option>
                                                        <option value="H:i" @if(@$settings['site_time_format'] == 'H:i') selected="selected" @endif>22:30</option>
                                                    </select>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    {{Form::label('invoice_prefix',__('Invoice Prefix')) }}
                                                    {{Form::text('invoice_prefix',null,array('class'=>'form-control'))}}
                                                    @error('invoice_prefix')
                                                    <span class="invalid-invoice_prefix" role="alert">
                                                            <strong class="text-danger">{{ $message }}</strong>
                                                        </span>
                                                    @enderror
                                                </div>
                                                <div class="form-group col-md-6">
                                                    {{Form::label('bug_prefix',__('Bug Prefix')) }}
                                                    {{Form::text('bug_prefix',null,array('class'=>'form-control'))}}
                                                    @error('bug_prefix')
                                                    <span class="invalid-bug_prefix" role="alert">
                                                            <strong class="text-danger">{{ $message }}</strong>
                                                        </span>
                                                    @enderror
                                                </div>
                                                <div class="form-group col-md-6">
                                                    {{Form::label('invoice_title',__('Invoice Footer Title')) }}
                                                    {{Form::text('invoice_title',null,array('class'=>'form-control'))}}
                                                    @error('invoice_title')
                                                    <span class="invalid-bug_prefix" role="alert">
                                                            <strong class="text-danger">{{ $message }}</strong>
                                                        </span>
                                                    @enderror
                                                </div>
                                                <div class="form-group col-md-6">
                                                    {{Form::label('invoice_text',__('Invoice Footer Text')) }}
                                                    {{Form::text('invoice_text',null,array('class'=>'form-control'))}}
                                                    @error('invoice_text')
                                                    <span class="invalid-bug_prefix" role="alert">
                                                            <strong class="text-danger">{{ $message }}</strong>
                                                        </span>
                                                    @enderror
                                                </div>
                                                <div class="form-group col-md-6">
                                                    {{Form::label('invoice_color',__('Invoice Prefix Color')) }}
                                                    <input class="jscolor form-control" value="{{ $settings['invoice_color'] }}" name="invoice_color" id="invoice_color">
                                                    @error('invoice_color')
                                                    <span class="invalid-bug_prefix" role="alert">
                                                            <strong class="text-danger">{{ $message }}</strong>
                                                        </span>
                                                    @enderror
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-footer text-right">
                                            {{Form::submit(__('Save Change'),array('class'=>'btn btn-primary'))}}
                                        </div>
                                        {{Form::close()}}
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="company-setting" role="tabpanel" aria-labelledby="contact-tab4">
                                    <div class="email-setting-wrap">
                                        <div class="row">
                                            {{Form::model($settings,array('route'=>'company.settings','method'=>'post'))}}
                                            <div class="card-body">
                                                <div class="row">
                                                    <div class="form-group col-md-6">
                                                        {{Form::label('company_name *',__('Company Name *')) }}
                                                        {{Form::text('company_name',null,array('class'=>'form-control font-style'))}}
                                                        @error('company_name')
                                                        <span class="invalid-company_name" role="alert">
                                                            <strong class="text-danger">{{ $message }}</strong>
                                                        </span>
                                                        @enderror
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        {{Form::label('company_address',__('Address')) }}
                                                        {{Form::text('company_address',null,array('class'=>'form-control font-style'))}}
                                                        @error('company_address')
                                                        <span class="invalid-company_address" role="alert">
                                                            <strong class="text-danger">{{ $message }}</strong>
                                                        </span>
                                                        @enderror
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        {{Form::label('company_city',__('City')) }}
                                                        {{Form::text('company_city',null,array('class'=>'form-control font-style'))}}
                                                        @error('company_city')
                                                        <span class="invalid-company_city" role="alert">
                                                                    <strong class="text-danger">{{ $message }}</strong>
                                                                </span>
                                                        @enderror
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        {{Form::label('company_state',__('State')) }}
                                                        {{Form::text('company_state',null,array('class'=>'form-control font-style'))}}
                                                        @error('company_state')
                                                        <span class="invalid-company_state" role="alert">
                                                            <strong class="text-danger">{{ $message }}</strong>
                                                        </span>
                                                        @enderror
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        {{Form::label('company_zipcode',__('Zip/Post Code')) }}
                                                        {{Form::text('company_zipcode',null,array('class'=>'form-control'))}}
                                                        @error('company_zipcode')
                                                        <span class="invalid-company_zipcode" role="alert">
                                                            <strong class="text-danger">{{ $message }}</strong>
                                                        </span>
                                                        @enderror
                                                    </div>
                                                    <div class="form-group  col-md-6">
                                                        {{Form::label('company_country',__('Country')) }}
                                                        {{Form::text('company_country',null,array('class'=>'form-control font-style'))}}
                                                        @error('company_country')
                                                        <span class="invalid-company_country" role="alert">
                                                            <strong class="text-danger">{{ $message }}</strong>
                                                        </span>
                                                        @enderror
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        {{Form::label('company_telephone',__('Telephone')) }}
                                                        {{Form::text('company_telephone',null,array('class'=>'form-control'))}}
                                                        @error('company_telephone')
                                                        <span class="invalid-company_telephone" role="alert">
                                                            <strong class="text-danger">{{ $message }}</strong>
                                                        </span>
                                                        @enderror
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        {{Form::label('company_email',__('System Email *')) }}
                                                        {{Form::text('company_email',null,array('class'=>'form-control'))}}
                                                        @error('company_email')
                                                        <span class="invalid-company_email" role="alert">
                                                            <strong class="text-danger">{{ $message }}</strong>
                                                        </span>
                                                        @enderror
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                        {{Form::label('company_email_from_name',__('Email (From Name) *')) }}
                                                        {{Form::text('company_email_from_name',null,array('class'=>'form-control font-style'))}}
                                                        @error('company_email_from_name')
                                                        <span class="invalid-company_email_from_name" role="alert">
                                                            <strong class="text-danger">{{ $message }}</strong>
                                                        </span>
                                                        @enderror
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-footer text-right">
                                                {{Form::submit(__('Save Change'),array('class'=>'btn btn-primary'))}}
                                            </div>
                                            {{Form::close()}}
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="email-setting" role="tabpanel" aria-labelledby="contact-tab4">
                                    <div class="email-setting-wrap">
                                        {{Form::open(array('route'=>'email.settings','method'=>'post'))}}
                                        <div class="row">
                                            <div class="form-group col-md-4">
                                                {{Form::label('mail_driver',__('Mail Driver')) }}
                                                {{Form::text('mail_driver',env('MAIL_DRIVER'),array('class'=>'form-control','placeholder'=>__('Enter Mail Driver')))}}
                                                @error('mail_driver')
                                                <span class="invalid-mail_driver" role="alert">
                                                 <strong class="text-danger">{{ $message }}</strong>
                                                 </span>
                                                @enderror
                                            </div>
                                            <div class="form-group col-md-4">
                                                {{Form::label('mail_host',__('Mail Host')) }}
                                                {{Form::text('mail_host',env('MAIL_HOST'),array('class'=>'form-control ','placeholder'=>__('Enter Mail Driver')))}}
                                                @error('mail_host')
                                                <span class="invalid-mail_driver" role="alert">
                                                 <strong class="text-danger">{{ $message }}</strong>
                                                 </span>
                                                @enderror
                                            </div>
                                            <div class="form-group col-md-4">
                                                {{Form::label('mail_port',__('Mail Port')) }}
                                                {{Form::text('mail_port',env('MAIL_PORT'),array('class'=>'form-control','placeholder'=>__('Enter Mail Port')))}}
                                                @error('mail_port')
                                                <span class="invalid-mail_port" role="alert">
                                                    <strong class="text-danger">{{ $message }}</strong>
                                                </span>
                                                @enderror
                                            </div>
                                            <div class="form-group col-md-4">
                                                {{Form::label('mail_username',__('Mail Username')) }}
                                                {{Form::text('mail_username',env('MAIL_USERNAME'),array('class'=>'form-control','placeholder'=>__('Enter Mail Username')))}}
                                                @error('mail_username')
                                                <span class="invalid-mail_username" role="alert">
                                                 <strong class="text-danger">{{ $message }}</strong>
                                                 </span>
                                                @enderror
                                            </div>
                                            <div class="form-group col-md-4">
                                                {{Form::label('mail_password',__('Mail Password')) }}
                                                {{Form::text('mail_password',env('MAIL_PASSWORD'),array('class'=>'form-control','placeholder'=>__('Enter Mail Password')))}}
                                                @error('mail_password')
                                                <span class="invalid-mail_password" role="alert">
                                                 <strong class="text-danger">{{ $message }}</strong>
                                                 </span>
                                                @enderror
                                            </div>
                                            <div class="form-group col-md-4">
                                                {{Form::label('mail_encryption',__('Mail Encryption')) }}
                                                {{Form::text('mail_encryption',env('MAIL_ENCRYPTION'),array('class'=>'form-control','placeholder'=>__('Enter Mail Encryption')))}}
                                                @error('mail_encryption')
                                                <span class="invalid-mail_encryption" role="alert">
                                                 <strong class="text-danger">{{ $message }}</strong>
                                                 </span>
                                                @enderror
                                            </div>
                                            <div class="form-group col-md-4">
                                                {{Form::label('mail_from_address',__('Mail From Address')) }}
                                                {{Form::text('mail_from_address',env('MAIL_FROM_ADDRESS'),array('class'=>'form-control','placeholder'=>__('Enter Mail From Address')))}}
                                                @error('mail_from_address')
                                                <span class="invalid-mail_from_address" role="alert">
                                                 <strong class="text-danger">{{ $message }}</strong>
                                                 </span>
                                                @enderror
                                            </div>
                                            <div class="form-group col-md-4">
                                                {{Form::label('mail_from_name',__('Mail From Name')) }}
                                                {{Form::text('mail_from_name',env('MAIL_FROM_NAME'),array('class'=>'form-control','placeholder'=>__('Enter From Name')))}}
                                                @error('mail_from_name')
                                                <span class="invalid-mail_from_name" role="alert">
                                                 <strong class="text-danger">{{ $message }}</strong>
                                                 </span>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="card-footer text-right">
                                            {{Form::submit(__('Save Change'),array('class'=>'btn btn-primary'))}}
                                        </div>
                                        {{Form::close()}}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
