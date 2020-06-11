{{ Form::open(array('url' => 'projects')) }}
<div class="row">
    <div class="form-group col-md-6">
        {{ Form::label('name', __('Project Name')) }}
        {{ Form::text('name', '', array('class' => 'form-control','required'=>'required')) }}
        @error('name')
        <span class="invalid-name" role="alert">
        <strong class="text-danger">{{ $message }}</strong>
    </span>
        @enderror
    </div>
    <div class="form-group col-md-6">
        {{ Form::label('price', __('Project Price')) }}
        {{ Form::number('price', '', array('class' => 'form-control','required'=>'required')) }}
        @error('price')
        <span class="invalid-price" role="alert">
        <strong class="text-danger">{{ $message }}</strong>
    </span>
        @enderror
    </div>
    <div class="form-group col-md-6">
        {{ Form::label('date', __('Start Date')) }}
        {{ Form::text('start_date', '', array('class' => 'form-control datepicker','required'=>'required')) }}
        @error('start_date')
        <span class="invalid-start_date" role="alert">
        <strong class="text-danger">{{ $message }}</strong>
    </span>
        @enderror
    </div>
    <div class="form-group col-md-6">
        {{ Form::label('due_date', __('Due Date')) }}
        {{ Form::text('due_date', '', array('class' => 'form-control datepicker','required'=>'required')) }}
        @error('due_date')
        <span class="invalid-due_date" role="alert">
        <strong class="text-danger">{{ $message }}</strong>
    </span>
        @enderror
    </div>
    <div class="form-group col-md-6">
        {{ Form::label('client', __('Client')) }}
        {!! Form::select('client', $clients, null,array('class' => 'form-control font-style selectric','required'=>'required')) !!}
        @error('client')
        <span class="invalid-client" role="alert">
            <strong class="text-danger">{{ $message }}</strong>
        </span>
        @enderror
    </div>
    <div class="form-group col-md-6">
        {{ Form::label('user', __('User')) }}
        {!! Form::select('user[]', $users, null,array('class' => 'form-control font-style selectric','data-toggle'=>'select','required'=>'required')) !!}
        @error('user')
        <span class="invalid-user" role="alert">
            <strong class="text-danger">{{ $message }}</strong>
        </span>
        @enderror
    </div>
    <div class="form-group col-md-12">
        {{ Form::label('lead', __('Lead')) }}
        {!! Form::select('lead', $leads, null,array('class' => 'form-control font-style selectric','required'=>'required')) !!}
        @error('lead')
        <span class="invalid-lead" role="alert">
            <strong class="text-danger">{{ $message }}</strong>
        </span>
        @enderror
    </div>
{{--    <div class="col-12">--}}
{{--        <div class="form-group">--}}
{{--            {{ Form::label('label', __('Label'),array('class'=>'form-control-label')) }}--}}
{{--            <div class="row gutters-xs">--}}
{{--                @foreach($labels as $k=>$label)--}}
{{--                <div class="col-auto">--}}
{{--                    <label class="colorinput">--}}
{{--                        <input name="color" type="checkbox" value="primary" class="colorinput-input" />--}}
{{--                        <span class="colorinput-color bg-primary"></span>--}}
{{--                    </label>--}}
{{--                </div>--}}
{{--                @endforeach--}}
{{--            </div>--}}
{{--        </div>--}}
{{--    </div>--}}
    <div class="form-group  col-md-12">
        {{ Form::label('label', __('Label'),array('class'=>'form-control-label')) }}
        <div class="bg-color-label">
            @foreach($labels as $k=>$label)
                <div class="custom-control custom-radio {{$label->color}} mb-3">
                    <input class="custom-control-input" name="label" id="customCheck_{{$k}}" type="radio" value="{{$label->id}}" }>
                    <label class="custom-control-label" for="customCheck_{{$k}}"></label>
                </div>
            @endforeach
        </div>
    </div>
</div>
<div class="row">
    <div class="form-group  col-md-12">
        {{ Form::label('description', __('Description')) }}
        {!! Form::textarea('description', null, ['class'=>'form-control','rows'=>'2']) !!}
        @error('description')
        <span class="invalid-description" role="alert">
        <strong class="text-danger">{{ $message }}</strong>
    </span>
        @enderror
    </div>
    <div class="col-md-12 text-right">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">{{__('Cancel')}}</button>
        {{Form::submit(__('Create'),array('class'=>'btn btn-primary'))}}
    </div>
</div>

{{ Form::close() }}

