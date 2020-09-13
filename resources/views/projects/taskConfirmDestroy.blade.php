<div class="p-2">
    
    {{ Form::model($project, array('route' => array('project.taskboard.all.destroy', $project->id), 'method' => 'DELETE')) }}
        <div class="row">
            <div class="form-group col-md-12">
                <label>Confirmation delete all milestones project, please write below as <span class="text-warning">{{ $project->name }}</span></label>
                <input type="hidden" id="project_id" name="project_id" class="form-control" value="{{ $project->name }}" />
                <input type="text" id="project_name" class="form-control" placeholder="project name" required />
            </div>
            <div class="col-md-12 text-right">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">{{__('Cancel')}}</button>
                {{Form::submit(__('Delete'),array('class'=>'btn btn-danger'))}}
            </div>
        </div>
    {{ Form::close() }}

</div>
<script>
$(document).ready(function() { 
    $("form").submit(function() { 
        if($('#project_name').val() != '<?php echo $project->name;?>'){
            $('#project_name').css("border", "1px solid red");
            return false;
        }
    }); 
});
</script>