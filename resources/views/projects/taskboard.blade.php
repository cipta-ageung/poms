@extends('layouts.admin')
@php
$profile=asset(Storage::url('avatar/'));
@endphp
@push('script-page')
<script src="{{asset('assets/modules/voicenote/voicenote.js')}}"></script>
<script src="{{asset('assets/js/dragula.min.js')}}"></script>

<script>
@can('move task')
@if(\Auth::user() -> type != 'client' || (\Auth::user() -> type == 'client' && in_array('move task', $perArr)))

    ! function(a) {
        "use strict";
        var t = function() {
            this.$body = a("body")
        };
        t.prototype.init = function() {
            a('[data-plugin="dragula"]').each(function() {
                var t = a(this).data("containers"),
                    n = [];
                if (t)
                    for (var i = 0; i < t.length; i++) n.push(a("#" + t[i])[0]);
                else n = [a(this)[0]];
                var r = a(this).data("handleclass");
                r ? dragula(n, {
                    moves: function(a, t, n) {
                        return n.classList.contains(r)
                    }
                }) : dragula(n).on('drop', function(el, target, source, sibling) {

                    var order = [];
                    $("#" + target.id + " > div").each(function() {
                        order[$(this).index()] = $(this).attr('data-id');
                    });

                    var id = $(el).attr('data-id');
                    var stage_id = $(target).attr('data-id');

                    $("#" + source.id).parent().find('.count').text($("#" + source.id + " > div")
                        .length);
                    $("#" + target.id).parent().find('.count').text($("#" + target.id + " > div")
                        .length);

                    $.ajax({
                        url: '{{route('taskboard.order')}}',
                        type: 'POST',
                        data: {
                            task_id: id,
                            stage_id: stage_id,
                            order: order,
                            "_token": $('meta[name="csrf-token"]').attr('content')
                        },
                        success: function(data) {
                            toastrs('Success', 'task successfully updated', 'success');
                        },
                        error: function(data) {
                            data = data.responseJSON;
                            toastrs('Error', data.error, 'error')
                        }
                    });
                });
            })
        }, a.Dragula = new t, a.Dragula.Constructor = t
    }(window.jQuery),
    function(a) {
        "use strict";

        a.Dragula.init()

    }(window.jQuery);
@endif
@endcan
</script>
<script>
URL = window.URL || window.webkitURL;

var gumStream; //stream from getUserMedia()
var rec; //Recorder.js object
var input; //MediaStreamAudioSourceNode we'll be recording

// shim for AudioContext when it's not avb.
var AudioContext = window.AudioContext || window.webkitAudioContext;
var audioContext //audio context to help us record


$(document).on('click', '#recordButton', function() {
    console.log("recordButton clickeds");
    // e.preventDefault();

    /*
    	Simple constraints object, for more advanced audio features see
    	https://addpipe.com/blog/audio-constraints-getusermedia/
    */

    var constraints = {
        audio: true,
        video: false
    }

    /*
    	Disable the record button until we get a success or fail from getUserMedia()
	*/

    $("#recordButton").prop("disabled", true);

    $("#stopButton").prop("disabled", false);

    $("#pauseButton").prop("disabled", false);


    /*
    	We're using the standard promise based getUserMedia()
    	https://developer.mozilla.org/en-US/docs/Web/API/MediaDevices/getUserMedia
	*/

    navigator.mediaDevices.getUserMedia(constraints).then(function(stream) {
        console.log("getUserMedia() success, stream created, initializing Recorder.js ...");

        /*
        	create an audio context after getUserMedia is called
        	sampleRate might change after getUserMedia is called, like it does on macOS when recording through AirPods
        	the sampleRate defaults to the one set in your OS for your playback device

        */
        audioContext = new AudioContext();

        //update the format

        /*  assign to gumStream for later use  */
        gumStream = stream;

        /* use the stream */
        input = audioContext.createMediaStreamSource(stream);

        /*
        	Create the Recorder object and configure to record mono sound (1 channel)
        	Recording 2 channels  will double the file size
        */
        rec = new Recorder(input, {
            numChannels: 1
        })

        //start the recording process
        rec.record()

        console.log("Recording started");

    }).catch(function(err) {
        //enable the record button if getUserMedia() fails
        $("#recordButton").prop("disabled", false);

        $("#stopButton").prop("disabled", true);

        $("#pauseButton").prop("disabled", true);
    });
});


$(document).on('click', '#stopButton', function() {
    console.log("stopButton clicked");
    // e.preventDefault();

    //disable the stop button, enable the record too allow for new recordings
    $("#recordButton").prop("disabled", false);

    $("#stopButton").prop("disabled", true);

    $("#pauseButton").prop("disabled", true);

    //reset button just in case the recording is stopped while paused

    $("#pauseButton").html("Pause");

    //tell the recorder to stop the recording
    rec.stop();

    //stop microphone access
    gumStream.getAudioTracks()[0].stop();

    //create the wav blob and pass it on to createDownloadLink
    rec.exportWAV(createDownloadLink);
});
$(document).on('click', '#pauseButton', function() {
    console.log("pauseButton clicked rec.recording=", rec.recording);
    if (rec.recording) {
        //pause
        rec.stop();
        $("#pauseButton").html("Resume");
    } else {
        //resume
        rec.record()
        $("#pauseButton").html("Pause");

    }
});
$.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
});

function createDownloadLink(blob) {

    var url = URL.createObjectURL(blob);
    var au = document.createElement('audio');
    var li = document.createElement('li');
    var link = document.createElement('a');
    var file = document.createElement('input');
    // var id=$(".recordingsList").data('id');
    //var recordingsList = document.getElementById('recordingsList');

    //name of .wav file to use during upload and download (without extendion)
    var filename = new Date().toISOString();

    //add controls to the <audio> element
    au.controls = true;
    au.src = url;
    li.appendChild(au);

    $('#recordingsList').empty();

    //save to disk link
    link.href = url;
    link.download = filename + ".wav"; //download forces the browser to donwload the file using the  filename
    $("#filenamevn").val(filename + ".wav");
    var fileObject = new File([blob], filename, {
        type: 'audio/wav'
    });
    console.log(fileObject);
    var upload = document.createElement('a');
    upload.href = "#";
    upload.innerHTML = "Upload";

    //$("#vnote").val(fileObject);
    //localStorage.setItem('vn', blob);
    //localStorage.setItem('fn', filename + ".wav");

    //add the new audio element to li


    //add the filename to the li
    li.appendChild(document.createTextNode(filename + ".wav "))

    //add the save to disk link to li


    //upload link
    var upload = document.createElement('a');
    upload.href = "#";
    upload.innerHTML = "Upload";

    // upload.addEventListener("click", function(event){
    var taskid = localStorage.getItem('taskid');
    var cid = localStorage.getItem('cid');
    var fd = new FormData();

    //console.log(tes);
    fd.append("voicenote", blob);
    fd.append("taskid", taskid);
    fd.append("cid", cid);
    fd.append("filename", filename);
    $("#form-file").data('url')

    console.log($("#form-voice").data('url'));

    $.ajax({
        url: $("#form-voice").data('url'),
        type: 'POST',
        data: fd,
        dataType: 'JSON',
        processData: false,
        contentType: false,
        enctype: 'multipart/form-data',


        success: function(data) {
            // data = JSON.parse(data);
            alert(data.filename);
            localStorage.setItem('file_vn', data.filename);
            console.log(data.filename);
            // recordingsList.appendChild(li);
        },
        error: function(data) {
            console.log(data);
            // toastrs('Error', '{{ __("Some Thing Is Wrong!")}}', 'error');
        }
    });


}

function myFunction(taskid, cid) {
    console.log(cid);
    $('.inputcom').collapse('hide');
    // localStorage.setItem('taskidlist', taskid);
    // localStorage.setItem('cidlist', cid);
    var formData = new FormData();
    formData.append('taskid', taskid);
    formData.append('cid', cid);
    for (var pair of formData.entries()) {
        console.log(pair[0] + ', ' + pair[1]);
    }
    $.ajax({
        url: "{{route('task.checklist.read')}}",
        type: 'POST',
        data: formData,
        dataType: 'JSON',
        contentType: false,
        cache: false,
        processData: false,
        success: function(data) {
            // toastrs('Success', '{{ __("Checklist Added Successfully!")}}', 'success');
            // console.log(data.list);
            document.getElementById("listcomment").innerHTML =
                '<ul class="list-unstyled list-unstyled-border activity-wrap">' + data.list + '</ul>';
            //console.log(document.getElementById("listcomment"));
            // $("#check-list").prepend(html);
            // $("#form-checklist input[name=name]").val('');
            // $("#form-checklist").collapse('toggle');
        },
        error: function(data) {
            // data = data.responseJSON;
            toastrs('Error', data, 'error')
        }
    });

}

function myFunction1(taskid, cid) {
    console.log(cid);
    $('.listcom').collapse('hide');
    localStorage.setItem('taskid', taskid);
    localStorage.setItem('cid', cid);
}
$(document).on('click', '#form-comment button', function(e) {
    var comment = $.trim($("#form-comment textarea[name='comment']").val());
    var name = '{{\Auth::user()->name}}';
    if (comment != '') {
        $.ajax({
            url: $("#form-comment").data('action'),
            data: {
                comment: comment,
                "_token": $('meta[name="csrf-token"]').attr('content')
            },
            type: 'POST',
            success: function(data) {
                data = JSON.parse(data);

                var html = "<li class='media mb-20'>" +
                    "                    <div class='media-body'>" +
                    "                        <h5 class='mt-0'>" + name + "</h5>" +
                    "                        " + data.comment +
                    "                           <div class='comment-trash' style=\"float: right\">" +
                    "                               <a href='#' class='btn btn-outline btn-sm red text-muted  delete-comment' data-url='" +
                    data.deleteUrl + "' >" +
                    "                                   <i class='far fa-trash-alt'></i>" +
                    "                               </a>" +

                    "                           </div>" +
                    "                    </div>" +
                    "                </li>";


                $("#comments").prepend(html);
                $("#form-comment textarea[name='comment']").val('');
                toastrs('Success', '{{ __("Comment Added Successfully!")}}', 'success');
            },
            error: function(data) {
                toastrs('Error', '{{ __("Some Thing Is Wrong!")}}', 'error');
            }
        });
    } else {
        toastrs('Error', '{{ __("Please write comment!")}}', 'error');
    }
});

$(document).on("click", ".delete-comment", function() {
    if (confirm('Are You Sure ?')) {
        var btn = $(this);
        $.ajax({
            url: $(this).attr('data-url'),
            type: 'DELETE',
            data: {
                _token: $('meta[name="csrf-token"]').attr('content')
            },
            dataType: 'JSON',
            success: function(data) {
                toastrs('Success', '{{ __("Comment Deleted Successfully!")}}', 'success');
                btn.closest('.media').remove();
            },
            error: function(data) {
                data = data.responseJSON;
                if (data.message) {
                    toastrs('Error', data.message, 'error');
                } else {
                    toastrs('Error', '{{ __("Some Thing Is Wrong!")}}', 'error');
                }
            }
        });
    }
});

$(document).on('submit', '#form-file', function(e) {
    e.preventDefault();

    var vn = localStorage.getItem('file_vn');
    var taskid = localStorage.getItem('taskid');
    var cid = localStorage.getItem('cid');
    //console.log(vn);
    //$("#vnote").val($("#file_task").val());
    var formData = new FormData(this);
    formData.append('filename_vn', vn);
    formData.append('taskid', taskid);
    formData.append('cid', cid);
    for (var pair of formData.entries()) {
        console.log(pair[0] + ', ' + pair[1]);
    }
    //console.log(vn);

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    $.ajax({
        url: $("#form-file").data('url'),
        type: 'POST',
        data: formData,
        dataType: 'JSON',
        processData: false,
        contentType: false,
        enctype: 'multipart/form-data',
        success: function(data) {
            toastrs('Success', '{{ __("Comment Added Successfully!")}}', 'success');
            $('#example-textarea').val('');
            $('#file_task').val('');

        },
        error: function(data) {
            console.log(data);
            data = data.responseJSON;
            if (data) {
                // var xhr = new XMLHttpRequest();
                // xhr.open('POST', $("#form-voice").data('url')+'/'+$("#id"), true); //my url had the ID of the item that the blob corresponded to
                // xhr.responseType = 'Blob';
                // xhr.setRequestHeader("x-csrf-token",$('meta[name="csrf-token"]').attr('content')); //if you are doing CSRF stuff
                // xhr.onload = function(e) { /*irrelevant code*/ };
                // xhr.send(vn);
                //console.log(xhr);
                toastrs('Error', data.message, 'error');
                //$('#file-error').text(data.errors.file[0]).show();
            } else {
                toastrs('Error', '{{ __("Some Thing Is Wrong!")}}', 'error');
            }
        }
    });
});

$(document).on("click", ".delete-comment-file", function() {

    if (confirm('Are You Sure ?')) {
        var btn = $(this);
        $.ajax({
            url: $(this).attr('data-url'),
            type: 'DELETE',
            data: {
                _token: $('meta[name="csrf-token"]').attr('content')
            },
            dataType: 'JSON',
            success: function(data) {
                toastrs('Success', '{{ __("File Deleted Successfully!")}}', 'success');
                btn.closest('.media').remove();
            },
            error: function(data) {
                data = data.responseJSON;
                if (data.message) {
                    toastrs('Error', data.message, 'error');
                } else {
                    toastrs('Error', '{{ __("Some Thing Is Wrong!")}}', 'error');
                }
            }
        });
    }
});

$(document).on('submit', '#form-checklist', function(e) {
    e.preventDefault();

    $.ajax({
        url: $("#form-checklist").data('action'),
        type: 'POST',
        data: new FormData(this),
        dataType: 'JSON',
        contentType: false,
        cache: false,
        processData: false,
        success: function(data) {
            toastrs('Success', '{{ __("Checklist Added Successfully!")}}', 'success');

            var html = '<li class="media">' +
                '<div class="media-body">' +
                '<h5 class="mt-0 mb-1 font-weight-bold"> </h5> ' +
                '<div class=" custom-control custom-checkbox checklist-checkbox"> ' +
                '<input type="checkbox" id="checklist-' + data.id +
                '" class="custom-control-input"  data-url="' + data.updateUrl + '">' +
                '<label for="checklist-' + data.id + '" class="custom-control-label"></label> ' +
                '' + data.name + ' </div>' +
                '<div class="comment-trash" style="float: right"> ' +
                '<a href="#" class="btn btn-outline btn-sm red text-muted delete-checklist" data-url="' +
                data.deleteUrl + '">\n' +
                '                                                            <i class="far fa-trash-alt"></i>' +
                '</a>' +
                '</div>' +
                '</div>' +
                ' </li>';


            $("#check-list").prepend(html);
            $("#form-checklist input[name=name]").val('');
            $("#form-checklist").collapse('toggle');
        },
    });
});

$(document).on("click", ".delete-checklist", function() {
    if (confirm('Are You Sure ?')) {
        var btn = $(this);
        $.ajax({
            url: $(this).attr('data-url'),
            type: 'DELETE',
            data: {
                _token: $('meta[name="csrf-token"]').attr('content')
            },
            dataType: 'JSON',
            success: function(data) {
                toastrs('Success', '{{ __("Checklist Deleted Successfully!")}}', 'success');
                btn.closest('.media').remove();
            },
            error: function(data) {
                data = data.responseJSON;
                if (data.message) {
                    toastrs('Error', data.message, 'error');
                } else {
                    toastrs('Error', '{{ __("Some Thing Is Wrong!")}}', 'error');
                }
            }
        });
    }
});

var checked = 0;
var count = 0;
var percentage = 0;

$(document).on("change", "#check-list input[type=checkbox]", function() {
    $.ajax({
        url: $(this).attr('data-url'),
        type: 'PUT',
        data: {
            _token: $('meta[name="csrf-token"]').attr('content')
        },
        // dataType: 'JSON',
        success: function(data) {
            toastrs('Success', '{{ __("Checklist Updated Successfully!")}}', 'success');
            // console.log(data);
        },
        error: function(data) {
            data = data.responseJSON;
            toastrs('Error', '{{ __("Some Thing Is Wrong!")}}', 'error');
        }
    });
    taskCheckbox();
});
</script>
@endpush

@section('page-title')
{{__('Task')}}
@endsection
@section('content')
<section class="section">
    <div class="section-header">
        <h1>{{__('Task')}}</h1>
        <div class="section-header-breadcrumb">
            <div class="breadcrumb-item active"><a href="{{route('dashboard')}}">{{__('Dashboard')}}</a></div>
            <div class="breadcrumb-item active"><a href="{{route('projects.index')}}">{{__('Project')}}</a></div>
            <div class="breadcrumb-item active font-style"><a
                    href="{{ route('projects.show',$project->id) }}">{{$project->name}}</a></div>
            <div class="breadcrumb-item">{{__('Task')}}</div>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <div class="d-flex justify-content-between w-100">
                        <h4>{{__('Manage Task')}}</h4>
                        @can('create task')
                        <span class="create-btn">
                            <a href="#" data-url="{{ route('task.create',$project->id) }}" data-ajax-popup="true"
                                data-title="{{__('Add New Task')}}" class="btn btn-sm btn-warning">
                                <i class="fa fa-plus"></i> &nbsp;&nbsp; {{__('Create')}}
                            </a>
                        </span>
                        @endcan
                    </div>
                </div>
                @php
                $json = [];
                foreach ($stages as $stage){
                $json[] = 'lead-list-'.$stage->id;
                }
                @endphp

                <div class="board" data-plugin="dragula" data-containers='{!! json_encode($json) !!}'>
                    <div class="card-body">
                        <div class="lead-wrap">
                            <div class="row">
                                <div class="custom-scroll-horizontal">
                                    @foreach($stages as $stage)
                                    @if(\Auth::user()->type =='client' || \Auth::user()->type =='company')
                                    @php $tasks =$stage->tasks($project->id) @endphp
                                    @else
                                    @php $tasks =$stage->tasks($project->id) @endphp
                                    @endif
                                    <div class="col-lg-4 col-md-4 col-sm-6">
                                        <div class="lead-grp">
                                            <div class="lead-grp-title font-style">{{$stage->name}}
                                                ({{ count($tasks) }})</div>

                                            <div id="lead-list-{{$stage->id}}" data-id="{{$stage->id}}"
                                                class="custom-scroll">
                                                @foreach($tasks as $task)
                                                <div class="lead lead-grid-view" data-id="{{$task->id}}">

                                                    @if(Gate::check('edit task') || Gate::check('delete task'))

                                                    <div class="more-action">
                                                        <div class="dropdown">
                                                            <a href="" class="btn dropdown-toggle"
                                                                data-toggle="dropdown">
                                                                <svg width="18" height="4" viewBox="0 0 18 4"
                                                                    fill="none" xmlns="http://www.w3.org/2000/svg">
                                                                    <path
                                                                        d="M1.13672 0.804688C1.42318 0.518229 1.7526 0.375 2.125 0.375C2.4974 0.375 2.8125 0.518229 3.07031 0.804688C3.35677 1.0625 3.5 1.3776 3.5 1.75C3.5 2.1224 3.35677 2.45182 3.07031 2.73828C2.8125 2.99609 2.4974 3.125 2.125 3.125C1.7526 3.125 1.42318 2.99609 1.13672 2.73828C0.878906 2.45182 0.75 2.1224 0.75 1.75C0.75 1.3776 0.878906 1.0625 1.13672 0.804688ZM8.01172 0.804688C8.29818 0.518229 8.6276 0.375 9 0.375C9.3724 0.375 9.6875 0.518229 9.94531 0.804688C10.2318 1.0625 10.375 1.3776 10.375 1.75C10.375 2.1224 10.2318 2.45182 9.94531 2.73828C9.6875 2.99609 9.3724 3.125 9 3.125C8.6276 3.125 8.29818 2.99609 8.01172 2.73828C7.75391 2.45182 7.625 2.1224 7.625 1.75C7.625 1.3776 7.75391 1.0625 8.01172 0.804688ZM14.8867 0.804688C15.1732 0.518229 15.5026 0.375 15.875 0.375C16.2474 0.375 16.5625 0.518229 16.8203 0.804688C17.1068 1.0625 17.25 1.3776 17.25 1.75C17.25 2.1224 17.1068 2.45182 16.8203 2.73828C16.5625 2.99609 16.2474 3.125 15.875 3.125C15.5026 3.125 15.1732 2.99609 14.8867 2.73828C14.6289 2.45182 14.5 2.1224 14.5 1.75C14.5 1.3776 14.6289 1.0625 14.8867 0.804688Z"
                                                                        fill="#778CA2"></path>
                                                                </svg>
                                                            </a>

                                                            <div class="dropdown-menu">
                                                                @can('edit task')
                                                                <a href="#"
                                                                    data-url="{{ route('task.edit',$task->id) }}"
                                                                    data-ajax-popup="true"
                                                                    data-title="{{__('Edit Task')}}"
                                                                    data-original-title="{{__('Edit')}}"
                                                                    class="dropdown-item">
                                                                    {{__('Edit')}}
                                                                </a>
                                                                @endcan

                                                                @can('delete task')
                                                                <a class="dropdown-item" href="#"
                                                                    data-original-title="{{__('Delete')}}"
                                                                    data-confirm="Are You Sure?|This action can not be undone. Do you want to continue?"
                                                                    data-confirm-yes="document.getElementById('delete-form-{{$task->id}}').submit();">{{__('Delete')}}</a>
                                                                {!! Form::open(['method' => 'DELETE', 'route' =>
                                                                ['task.destroy',
                                                                $task->id],'id'=>'delete-form-'.$task->id]) !!}
                                                                {!! Form::close() !!}
                                                                @endcan
                                                            </div>
                                                        </div>
                                                    </div>
                                                    @endif

                                                    <div class="title mb-1">
                                                        <a href="#" data-url="{{ route('task.show',$task->id) }}"
                                                            data-ajax-popup="true" data-title="{{__('Task Board')}}"
                                                            class="dropdown-item p-0 task-inner-title font-style">{{$task->title}}</a>
                                                        <span class="task-status low">
                                                            @if($task->priority =='low')
                                                            <div class="label label-soft-success"> {{ $task->priority }}
                                                            </div>
                                                            @elseif($task->priority =='medium')
                                                            <div class="label label-soft-warning"> {{ $task->priority }}
                                                            </div>
                                                            @elseif($task->priority =='high')
                                                            <div class="label label-soft-danger"> {{ $task->priority }}
                                                            </div>
                                                            @endif
                                                        </span>
                                                    </div>
                                                    <div class="meta-info mb-1">
                                                        <p> {{$task->description}}
                                                        </p>
                                                        <div
                                                            class="task-progress @if($task->taskCompleteCheckListCount()==$task->taskTotalCheckListCount() && $task->taskCompleteCheckListCount()!=0) label-soft-success @else label-soft-warning @endif ">
                                                            <span class="">
                                                                {{$task->taskCompleteCheckListCount()}}/{{$task->taskTotalCheckListCount()}}</span>
                                                        </div>
                                                    </div>
                                                    <div class="footer-wrap">
                                                        <div class="date">
                                                            <i class="far fa-clock"></i>
                                                            <span
                                                                class="pl-1">{{ \Auth::user()->dateFormat($task->start_date) }}</span>
                                                        </div>

                                                        <div class="avatar">
                                                            <a href="#" class="avatar avatar-xs" data-toggle="tooltip"
                                                                title=""
                                                                data-original-title="{{(!empty($task->task_user)?$task->task_user->name:'')}}">
                                                                <img src="{{(!empty($task->task_user->avatar)?$profile.'/'.$task->task_user->avatar:$profile.'/avatar.png')}}"
                                                                    class="avatar-img rounded-circle">
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                                @endforeach
                                            </div>
                                        </div>
                                    </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="section-body">
    </div>
</section>
@endsection
