<div class="row">
    <div class="col-12 col-md-6 col-lg-6">
        <div class="form-group">
            <label>{{ __('Title')}} :</label>
            <p class="m-0 p-0">{{$task->title}}</p>
        </div>
    </div>
    <div class="col-12 col-md-6 col-lg-6">
        <div class="form-group">
            <label>{{ __('Priority')}} :</label>
            <p class="m-0 p-0">{{$task->priority}}</p>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-12">
        <div class="form-group">
            <label>{{ __('Description')}} :</label>
            <p class="m-0 p-0">{{$task->description}}</p>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-12 col-md-4 col-lg-4">
        <div class="form-group">
            <label>{{ __('Start Date')}} :</label>
            <p class="m-0 p-0">{{$task->start_date}}</p>
        </div>
    </div>
    <div class="col-12 col-md-4 col-lg-4">
        <div class="form-group">
            <label>{{ __('Due Date')}} :</label>
            <p class="m-0 p-0">{{$task->due_date}}</p>
        </div>
    </div>
    <div class="col-12 col-md-4 col-lg-4">
        <div class="form-group">
            <label>{{ __('Milestone')}} :</label>
            <p class="m-0 p-0">{{!empty($task->milestone)?$task->milestone->title:''}}</p>
        </div>
    </div>
</div>
<!-- <hr> -->
<div class="task-inner-tab">
    <hr>
    <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
            <div class="progress-wrap">
                @can('create checklist')
                @if(\Auth::user()->type!='client' || (\Auth::user()->type=='client' && in_array('show
                checklist',$perArr)))
                <div class="tab-pane fad active" id="tab_1_3">
                    <div class="row">
                        @if(\Auth::user()->type!='client' || (\Auth::user()->type=='client' && in_array('create
                        checklist',$perArr)))
                        <div class="col-md-11">
                            <div class="row mb-10">
                                <div class="col-md-6">
                                    <b>{{__('Progress')}}</b>
                                </div>
                                <div class="col-md-6 text-right">
                                    <b>
                                        <span class="progressbar-label custom-label"
                                            style="margin-top: -9px !important;margin-left: .7rem">
                                            0%
                                        </span>
                                    </b>
                                </div>
                            </div>
                            <div class="text-left">
                                <div class="custom-widget__item flex-fill">
                                    <div class="custom-widget__progress d-flex  align-items-center">
                                        <div class="progress" style="height: 5px;width: 100%;">
                                            <div class="progress-bar" role="progressbar" aria-valuenow="100"
                                                aria-valuemin="0" aria-valuemax="100" id="taskProgress"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-1">
                            <div class="text-right mb-1">
                                <a href="#" class="btn btn-sm btn-primary" data-toggle="collapse"
                                    data-target="#form-checklist"><em class="fa fa-plus"></em></a>
                            </div>
                        </div>
                        @endif
                        @if($maxPercentage>0)
                        <form method="POST" id="form-checklist" class="collapse col-md-12"
                            data-action="{{ route('task.checklist.store',[$task->id]) }}">
                            @csrf
                            <div class="form-group">
                                <label>{{__('Name')}}</label>
                                <input type="text" name="name" class="form-control" required
                                    placeholder="{{__('Checklist Name')}}" />
                            </div>
                            <div class="form-group">
                                <label>Percentage</label>
                                <input type="number" name="percentage" class="form-control" required
                                    placeholder="percentage" min="0" max="{{$maxPercentage}}" step="any" />
                            </div>
                            <div class="text-right">
                                <div class="btn-group mb-2 ml-2 d-none d-sm-inline-block">
                                    <button type="submit" class="btn btn-primary">{{ __('Create')}}</button>
                                </div>
                            </div>
                            <br>
                        </form>
                        @else
                        <br /><br />
                        <div class="col-lg-12 text-warning">Current percentage total all checklist task is 100% .</div>
                        @endif
                    </div>
                    <hr>
                    <div class="row" id="content-checklist">
                        <ul class="col-md-12" id="check-list">
                            @foreach($task->taskCheckList as $checkList)
                            <li class="media">
                                <div class="media-body">
                                    <h5 class="mt-0 mb-1 font-weight-bold"></h5>
                                    <div class=" custom-control custom-checkbox checklist-checkbox" style="float: left;">
                                        @can('create checklist')
                                        @if(\Auth::user()->type!='client' || (\Auth::user()->type=='client' &&
                                        in_array('edit checklist',$perArr)))
                                        <input type="checkbox" id="checklist-{{$checkList->id}}"
                                            class="custom-control-input taskCheck" 
                                            data-percentage="{{$checkList->percentage}}" value="{{$checkList->id}}"
                                            data-url="{{route('task.checklist.update',[$checkList->task_id,$checkList->id])}}" 
                                            {{($checkList->status==1)?'checked':''}}  />
                                        <label for="checklist-{{$checkList->id}}" class="custom-control-label"></label>
                                        @endif
                                        @endcan
                                        {{$checkList->name}}
                                    </div>
                                    <div class="comment-trash" style="float: right;">
                                        @if(\Auth::user()->type!='client' || (\Auth::user()->type=='client' &&
                                        in_array('delete checklist',$perArr)))
                                        <span type="button"  id="add-comment" data-url="{{ route('checklistcomment.create',$checkList->id) }}" data-checklist="{{$checkList->id}}">
                                            <em class="fa fa-comment text-primary"></em>
                                        </span>&nbsp;&nbsp;
                                        <span type="button" class="fa fa-list" id="id-{{$checkList->id}}"
                                            value="{{$checkList->id}}" data-url="{{ route('checklistcomment.index',$checkList->id) }}"></span>&nbsp;&nbsp;
                                            
                                        <span href="#" id="delete-checklist" type="button" class="text-muted delete-checklist"
                                            data-url="{{route('task.checklist.destroy',[$checkList->task_id,$checkList->id])}}">
                                            <em class="fa fa-trash text-danger"></em>
                                        </span>
                                        @endif
                                    </div>
                                </div>
                                <hr>
                            </li>
                            @endforeach
                        </ul>
                    </div>

                    <div class="row" id="content-comment" style="display:none">
                    </div>
                    <div class="row" id="content-comment-list" style="display:none">
                    </div>
                </div>
                @endif
                @endcan
            </div>
        </div>
    </div>
</div>
</div>
<script>
    $(document).on('click','#add-comment', function(e) {
        $.ajax({
            type: "GET",
            url: $(this).attr('data-url'),
            data: {
                _token: $('meta[name="csrf-token"]').attr('content'),
            },
            success: function(result){
                $('#content-comment').html(result);
                $('#content-checklist').slideUp();
                $('#content-comment').slideDown();
                $('#content-comment-list').slideUp();
            }
        });
    });
    
    $(document).on('click', 'span[id^=id]', function(e) {
        
        $.ajax({
            type: "GET",
            url: $(this).attr('data-url'),
            data: {
                _token: $('meta[name="csrf-token"]').attr('content'),
            },
            success: function(result){
                $('#content-comment-list').html(result);
                $('#content-comment').slideUp();
                $('#content-checklist').slideUp();
                $('#content-comment-list').slideDown();
            }
        });
    });
</script>