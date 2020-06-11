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
                                    data-target="#form-checklist"><i class="fa fa-plus"></i></a>
                            </div>
                        </div>

                        @endif

                        <form method="POST" id="form-checklist" class="collapse col-md-12"
                            data-action="{{ route('task.checklist.store',[$task->id]) }}">
                            @csrf
                            <div class="form-group">
                                <label>{{__('Name')}}</label>
                                <input type="text" name="name" class="form-control" required
                                    placeholder="{{__('Checklist Name')}}">
                            </div>
                            <div class="text-right">
                                <div class="btn-group mb-2 ml-2 d-none d-sm-inline-block">
                                    <button type="submit" class="btn btn-primary">{{ __('Create')}}</button>
                                </div>
                            </div>
                            <br>

                        </form>
                    </div>
                    <hr>
                    <div class="row">
                        <ul class="col-md-12" id="check-list">
                            @foreach($task->taskCheckList as $checkList)
                            <li class="media">
                                <div class="media-body">
                                    <h5 class="mt-0 mb-1 font-weight-bold"></h5>
                                    <div class=" custom-control custom-checkbox checklist-checkbox">
                                        @can('create checklist')
                                        @if(\Auth::user()->type!='client' || (\Auth::user()->type=='client' &&
                                        in_array('edit checklist',$perArr)))
                                        <input type="checkbox" id="checklist-{{$checkList->id}}"
                                            class="custom-control-input taskCheck"
                                            {{($checkList->status==1)?'checked':''}} value="{{$checkList->id}}"
                                            data-url="{{route('task.checklist.update',[$checkList->task_id,$checkList->id])}}">
                                        <label for="checklist-{{$checkList->id}}" class="custom-control-label"></label>
                                        @endif
                                        @endcan
                                        {{$checkList->name}}
                                    </div>
                                    <div class="comment-trash" style="float: right;">
                                        @if(\Auth::user()->type!='client' || (\Auth::user()->type=='client' &&
                                        in_array('delete checklist',$perArr)))
                                        <span onclick="myFunction1({{$checkList->task_id}},{{$checkList->id}})"
                                            class="fa fa-comment"  type="button"  id="intab"
                                            value="{{$checkList->id}}">
                                            <!-- <i class=""></i> -->
                                        </span>&nbsp;&nbsp;

                                        <span onclick="myFunction({{$checkList->task_id}},{{$checkList->id}})"
                                            type="button" class="fa fa-list" id="valuechecklist-{{$checkList->id}}"
                                            value="{{$checkList->id}}"></span>&nbsp;
                                        <!-- <i class="fa fa-list"></i> -->
                                        <!-- </a> -->
                                        <a href="#" class="btn btn-outline btn-sm red text-muted delete-checklist"
                                            data-url="{{route('task.checklist.destroy',[$checkList->task_id,$checkList->id])}}">
                                            <i class="fa fa-trash"></i>
                                        </a>
                                        @endif

                                    </div>
                                </div>
                                <hr>
                            </li>
                            <div class="card collapse listcom" id="tabchecklist_list-{{$checkList->id}}"
                                style="padding:10px;background:#f3f3f3" role="tabchecklist_list">
                                <div class="card-body" style="height:auto !important">
                                    <h5>Comment List</h5><hr>
                                    <div id="listcomment-{{$checkList->id}}"></div>
                                </div>
                            </div>
                            <div class="card collapse inputcom" id="tabchecklist-{{$checkList->id}}"
                                style="padding:10px;background:#f3f3f3"
                                role="tabchecklist">
                                <div class="card-body">
                                    <!-- <span>{{$checkList->id}}</span> -->
                                    <form method="post" id="form-voice" enctype="multipart/form-data"
                                        data-url="{{ route('comment.voicenote.store') }}">
                                        @csrf
                                        <label>Voice Note</label>
                                        <span class="invalid-feedback" id="file-error" role="alert">
                                            <strong></strong>
                                        </span>
                                        <div class="text-center" style="border:0.6px solid #ddd;padding:10px;">

                                            <div class="col-lg-12">
                                                <div class="row">
                                                    <div class="col-lg-4">
                                                        <a class="btn btn-primary form-control" style="color:#fff;"
                                                            id="recordButton"><i class="fa fa-play"></i> Record</a>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <a class="btn btn-info form-control" style="color:#fff;"
                                                            id="pauseButton" disabled><i class="fa fa-pause"></i>
                                                            Pause</a>
                                                    </div>
                                                    <div class="col-lg-4">
                                                        <bubtton class="btn btn-danger form-control" id="stopButton"
                                                            disabled><i class="fa fa-stop"></i>
                                                            Stop</button>
                                                    </div>
                                                </div>
                                            </div><br>
                                            <div class="col-lg-12">
                                                <ul style="list-style-type:none;text-align:left;margin:0px;padding:0px;"
                                                    id="recordingsList">
                                                </ul>
                                            </div>
                                        </div>
                                    </form>
                                    <form method="post" id="form-file" enctype="multipart/form-data"
                                        data-url="{{ route('comment.file.store',[$checkList->task_id,$checkList->id]) }}">
                                        @csrf

                                        <label>Comment</label>
                                        <textarea class="form-control" name="comment"
                                            placeholder="{{ __('Write message')}}" id="example-textarea" rows="3"
                                            ></textarea>


                                        <!--form comment-->
                                        <label>File</label>
                                        <input type="file" class="form-control mb-2" name="file_task" id="file_task">
                                        <span class="invalid-feedback" id="file-error" role="alert">
                                            <strong></strong>
                                        </span>
                                        <div class="text-right mt-10">
                                            <div class="btn-group mb-2 ml-2 d-none d-sm-inline-block">
                                                <button type="submit" class="btn btn-primary">{{ __('Submit')}}</button>
                                            </div>
                                        </div>
                                        <!-- <input name="filenamevn" type="hidden" id="filenamevn"></input> -->
                                    </form>

                                    <!--form file-->

                                    <!--form vn-->

                                </div>

                            </div>
                            @endforeach
                        </ul>
                    </div>
                </div>
                @endif
                @endcan
            </div>
        </div>

    </div>
</div>
</div>