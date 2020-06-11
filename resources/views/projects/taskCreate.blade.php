
<script type="text/javascript">
$(function() {
 $('#form-milestone').submit(function(e){
    $.ajax({
        type: 'POST',
        url: $(this).attr('action'),
        data: $(this).serialize(),
        success: function(data) {
            $("#milestone_id").append("<option value='"+data.id+"'>"+data.title+"</option>");
            $("#result").fadeIn(2000, function() {
                $("#result").fadeOut(2000);
            });
            $("#div-milestone").slideUp();
            $("#show-form-milestone").show();
            console.log(data);
    }})
    e.preventDefault();
 });
});
$("#show-form-milestone").click(function(){
    $("#div-milestone").slideDown();
    $("#show-form-milestone").hide();
});

$("#close-form-milestone").click(function(){
    $("#div-milestone").slideUp();
    $("#show-form-milestone").show();
});
</script>

{{ Form::open(array('route' => array('project.milestone.store.json',$project->id), 'id' => 'form-milestone', 'method' => 'post')) }}
<div id="div-milestone" class="row" style="display:none">
    <div class="col-md-12 text-primary"><p>Form Milestone</p></div>
    <div class="form-group  col-md-6">
        {{ Form::label('title', __('Title')) }}
        {{ Form::text('title', '', array('class' => 'form-control','required'=>'required')) }}
        @error('title')
        <span class="invalid-title" role="alert">
        <strong class="text-danger">{{ $message }}</strong>
    </span>
        @enderror
    </div>
    <div class="form-group  col-md-6">
        {{ Form::label('status', __('Status')) }}
        {!! Form::select('status', $status, null,array('class' => 'form-control','required'=>'required')) !!}
        @error('client')
        <span class="invalid-client" role="alert">
                <strong class="text-danger">{{ $message }}</strong>
            </span>
        @enderror
    </div>
    <div class="form-group  col-md-12">
        {{ Form::label('cost', __('Cost')) }}
        {{ Form::number('cost', '', array('class' => 'form-control','required'=>'required')) }}
        @error('cost')
        <span class="invalid-cost" role="alert">
        <strong class="text-danger">{{ $message }}</strong>
    </span>
        @enderror
    </div>
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
        <button id="close-form-milestone" type="button" class="btn btn-secondary">{{__('Cancel')}}</button>
        {{Form::submit(__('Create'),array('class'=>'btn btn-primary'))}}
    </div>
</div>
{{ Form::close() }}


{{ Form::open(array('route' => array('task.store',$project->id))) }}
<div class="row">
    <div class="form-group  col-md-6">
        {{ Form::label('title', __('Title')) }}
        {{ Form::text('title', '', array('class' => 'form-control','required'=>'required')) }}
        @error('title')
        <span class="invalid-title" role="alert">
        <strong class="text-danger">{{ $message }}</strong>
    </span>
        @enderror
    </div>

    <div class="form-group  col-md-6">
        {{ Form::label('milestone_id', __('Milestone')) }}
        <span id="show-form-milestone" class="text-primary mr-2" style="float:right;cursor:pointer;"><i class="fa fa-plus"> </i> &nbsp;</span>
        {!! Form::select('milestone_id', $milestones, null,array('class' => 'form-control')) !!}
        @error('milestone')
        <span class="invalid-milestone" role="alert">
                <strong class="text-danger">{{ $message }}</strong>
            </span>
        @enderror
    </div>

    <div class="form-group  col-md-6">
        {{ Form::label('start_date', __('Start Date')) }}
        {{ Form::text('start_date', '', array('class' => 'form-control datepicker','required'=>'required')) }}
        @error('start_date')
        <span class="invalid-start_date" role="alert">
        <strong class="text-danger">{{ $message }}</strong>
    </span>
        @enderror
    </div>
    <div class="form-group  col-md-6">
        {{ Form::label('due_date', __('Due Date')) }}
        {{ Form::text('due_date', '', array('class' => 'form-control datepicker','required'=>'required')) }}
        @error('due_date')
        <span class="invalid-due_date" role="alert">
        <strong class="text-danger">{{ $message }}</strong>
    </span>
        @enderror
    </div>
    @if(\Auth::user()->type == 'company')
    <div class="form-group  col-md-6">
        {{ Form::label('assign_to', __('Assign To')) }}
        {!! Form::select('assign_to', $users, null,array('class' => 'form-control selectric','required'=>'required')) !!}
        @error('assign_to')
        <span class="invalid-assign_to" role="alert">
                <strong class="text-danger">{{ $message }}</strong>
            </span>
        @enderror
    </div>
    @endif
    
    <div class="form-group  col-md-6">
        {{ Form::label('priority', __('Priority')) }}
        {!! Form::select('priority', $priority, null,array('class' => 'form-control selectric','required'=>'required')) !!}
        @error('priority')
        <span class="invalid-priority" role="alert">
                <strong class="text-danger">{{ $message }}</strong>
            </span>
        @enderror
    </div>

</div>
<div class="row">
    <div class="form-group  col-md-12">
        {{ Form::label('description', __('Description')) }}
        {!! Form::textarea('description', null, ['class'=>'form-control ','rows'=>'2']) !!}
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
