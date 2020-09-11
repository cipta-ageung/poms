<script type="text/javascript">
$(function() {
 $('#form-tax-rate').submit(function(e){
    $.ajax({
        type: 'POST',
        url: $(this).attr('action'),
        data: $(this).serialize(),
        success: function(data) {
            $("#tax_id").append("<option value='"+data.id+"'>"+data.name+"</option>");
            $("#result").fadeIn(2000, function() {
                $("#result").fadeOut(2000);
            });
            $("#div-tax-rate").slideUp();
            $("#show-form-taxes").show();
    }})
    e.preventDefault();
 });
});
$("#show-form-taxes").click(function(){
    $("#div-tax-rate").slideDown();
    $("#show-form-taxes").hide();
});

$("#close-form-taxes").click(function(){
    $("#div-tax-rate").slideUp();
    $("#show-form-taxes").show();
});
</script>

<div class="bg-success text-white" id="result" style="display:none">save data tax rate success!</div>
{{ Form::open(array('url' => 'taxes/storeJson', 'id' => 'form-tax-rate', 'method' => 'post')) }}
<div id="div-tax-rate" class="row" style="display:none">
    <div class="form-group col-md-6">
        {{ Form::label('name', __('Tax Rate Name')) }}
        {{ Form::text('name', '', array('class' => 'form-control','required'=>'required')) }}
        @error('name')
            <span class="invalid-name" role="alert">
                <strong class="text-danger">{{ $message }}</strong>
            </span>
        @enderror
    </div>
    <div class="form-group col-md-6">
        {{ Form::label('rate', __('Tax Rate %')) }}
        {{ Form::number('rate', '', array('class' => 'form-control','required'=>'required','step'=>'0.01')) }}
        @error('rate')
            <span class="invalid-rate" role="alert">
                <strong class="text-danger">{{ $message }}</strong>
            </span>
        @enderror
    </div>
    <div class="col-md-12 text-right">
        <button id="close-form-taxes" type="button" class="btn btn-secondary">{{__('Cancel')}}</button>
        {{Form::submit(__('Create'),array('class'=>'btn btn-primary'))}}
    </div>
</div>
{{ Form::close() }}

{{ Form::open(array('url' => 'invoices', 'id' => 'form-invoice-rate')) }}
<div class="row">
    <div class="form-group  col-md-6">
        {{ Form::label('project_id', __('Project')) }}
        {{ Form::select('project_id', $projects,null, array('class' => 'form-control font-style','required'=>'required')) }}
        @error('project_id')
        <span class="invalid-project_id" role="alert">
            <strong class="text-danger">{{ $message }}</strong>
        </span>
        @enderror
    </div>
    
    <div class="form-group col-md-6">
        {{ Form::label('tax_id', __('Tax %')) }}
        <span id="show-form-taxes" class="text-primary mr-2" style="float:right;cursor:pointer;"><i class="fa fa-plus"> </i> &nbsp;</span> 
        {{ Form::select('tax_id', $taxes,null, array('id' => 'tax_id', 'class' => 'form-control font-style')) }}
        @error('tax_id')
            <span class="invalid-tax_id" role="alert">
                <strong class="text-danger">{{ $message }}</strong>
            </span>
        @enderror
    </div>

    <div class="form-group  col-md-6">
        {{ Form::label('issue_date', __('Issue Date')) }}
        {{ Form::text('issue_date', '', array('class' => 'form-control datepicker','required'=>'required')) }}
        @error('issue_date')
            <span class="invalid-issue_date" role="alert">
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

    <div class="form-group  col-md-12">
        {{ Form::label('terms', __('Terms')) }}
        {!! Form::textarea('terms', null, ['class'=>'form-control','rows'=>'2']) !!}
        @error('terms')
            <span class="invalid-terms" role="alert">
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