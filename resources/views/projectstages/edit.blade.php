{{ Form::model($leadstages, array('route' => array('projectstages.update', $leadstages->id), 'method' => 'PUT')) }}
<div class="form-group">
    {{ Form::label('name', __('Lead Stage Name')) }}
    {{ Form::text('name', null, array('class' => 'form-control font-style','required'=>'required')) }}
    @error('name')
    <span class="invalid-name" role="alert">
        <strong class="text-danger">{{ $message }}</strong>
    </span>
    @enderror
</div>
<div class="form-group">
    {{ Form::label('color', __('Color')) }}
    <input class="jscolor form-control font-style" value="{{ $leadstages->color }}" name="color" id="color" required>
    <small class="small">{{ __('For chart representation') }}</small>
</div>
<div class="form-group text-right">
    <button type="button" class="btn btn-secondary" data-dismiss="modal">{{__('Cancel')}}</button>
    {{Form::submit(__('Update'),array('class'=>'btn btn-primary'))}}
</div>

{{ Form::close() }}

