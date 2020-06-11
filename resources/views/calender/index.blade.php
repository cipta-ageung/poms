@extends('layouts.admin')
@push('css-page')
<link rel="stylesheet" href="assets/modules/fullcalendar/fullcalendar.min.css">
@endpush
@push('script-page')
<script src="{{asset('assets/modules/voicenote/voicenote.js')}}"></script>
<script src="{{asset('assets/modules/fullcalendar/fullcalendar.min.js')}}"></script>
<script>
var tasks = {!! ($calenderData) !!};
//webkitURL is deprecated but nevertheless
URL = window.URL || window.webkitURL;

var gumStream; //stream from getUserMedia()
var rec; //Recorder.js object
var input; //MediaStreamAudioSourceNode we'll be recording

// shim for AudioContext when it's not avb.
var AudioContext = window.AudioContext || window.webkitAudioContext;
var audioContext //audio context to help us record
// window.onload=function(){
var recordButton = document.getElementById("recordButton");
var stopButton = document.getElementById("stopButton");
var pauseButton = document.getElementById("pauseButton");
// }
// //add events to those 2 buttons
// recordButton.addEventListener("click", startRecording,false);
// stopButton.addEventListener("click", stopRecording,false);
// pauseButton.addEventListener("click", pauseRecording,false);
$("#recordButton").prop("disabled", false);

$("#stopButton").prop("disabled", true);

$("#pauseButton").prop("disabled", true);

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
        console.log('asd');
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
        console.log(err);
        $("#recordButton").prop("disabled", false);

        $("#stopButton").prop("disabled", true);

        $("#pauseButton").prop("disabled", true);
    });
});


$(document).on('click', '#stopButton', function() {
    console.log("stopButtons clicked");
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

function callbacks(blob) {
    return blob;
}

function createDownloadLink(blob) {

    var url = URL.createObjectURL(blob);
    var au = document.createElement('audio');
    var li = document.createElement('li');
    var link = document.createElement('a');
    var file = document.createElement('input');
    // var id=$(".recordingsList").data('id');
    //var recordingsList = document.getElementById('recordingsList');
    var d = new Date();
    //name of .wav file to use during upload and download (without extendion)
    var filename =  ("0" + d.getDate()).slice(-2) + "-" + ("0"+(d.getMonth()+1)).slice(-2) + "-" +
    d.getFullYear() + "-" + ("0" + d.getHours()).slice(-2) + "-" + ("0" + d.getMinutes()).slice(-2)+ "-" + ("0" + d.getSeconds()).slice(-2);


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
$('.listcom').on('shown.bs.collapse', function () {
    $('.inputcom').collapse('hide');
});

$('.inputcom').on('hidden.bs.collapse', function () {
    $('.listcom').collapse('hide');
});

function myFunction(taskid, cid) {
    console.log(cid);

    // localStorage.setItem('taskidlist', taskid);
    // localStorage.setItem('cidlist', cid);
    var formData = new FormData();
    formData.append('taskid', taskid);
    formData.append('cid', cid);
    for (var pair of formData.entries()) {
        console.log(pair[0] + ', ' + pair[1]);
    }
    $('#tabchecklist-' + cid).collapse('hide');
    $('.listcom').collapse('hide');
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
            console.log(data);

            $('#tabchecklist_list-' + cid).collapse('show');
            document.getElementById("listcomment-"+cid).innerHTML =
                '<ul class="list-unstyled list-unstyled-border activity-wrap" style="height:auto !important">' + data.list + '</ul>';
            console.log(document.getElementById("listcomment-"+cid));
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
    // $('.listcom').collapse('hide');
    $('.inputcom').collapse('hide');
    
    $('#tabchecklist_list-' + cid).collapse('hide');
    $('#tabchecklist-' + cid).collapse('show');
    
    localStorage.setItem('taskid', taskid);
    localStorage.setItem('cid', cid);
}

$(document).on('click', '.fc-day-grid-event', function(e) {
    if (!$(this).hasClass('deal')) {
        e.preventDefault();
        var event = $(this);
        var title = $(this).find('.fc-content .fc-title').html();
        var size = 'md';
        var url = $(this).attr('href');
        var parts = url.split("/");
        var last_part = parts[parts.length - 2];

        if (last_part == 'invoices') {
            window.location.href = url;
        } else {
            $("#commonModal .modal-title").html(title);
            $("#commonModal .modal-dialog").addClass('modal-' + size);
            $.ajax({
                url: url,
                success: function(data) {
                    $('#commonModal .modal-body').html(data);
                    $("#commonModal").modal('show');
                },
                error: function(data) {
                    data = data.responseJSON;
                    //toastr('Error', data.error, 'error')
                }
            });
        }

    }
});

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
// $(document).on('shown.bs.collapse', '.listcom', function(e) {
//     console.log("Opened");



//     $.ajax({
//         url: $("#listtab").data('url'),
//         type: 'POST',
//         data: new FormData(this),
//         dataType: 'JSON',
//         contentType: false,
//         cache: false,
//         processData: false,
//         success: function(data) {
//             // toastrs('Success', '{{ __("Checklist Added Successfully!")}}', 'success');



//             // $("#check-list").prepend(html);
//             // $("#form-checklist input[name=name]").val('');
//             // $("#form-checklist").collapse('toggle');
//         }
//     });

// });
// $(document).on('shown.bs.collapse', '.inputcom', function(e) {

// });


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
                '<label for="checklist-' + data.id +
                '" class="custom-control-label"></label> ' +
                '' + data.name + ' </div>' +
                '<div class="comment-trash" style="float: right"> ' +
                '                       <span type="button" class="fa fa-comment" ' +
                '                           onclick="myFunction1(' + data.task_id + ',' + data.id + ')">' +
                '                     </span>&nbsp;&nbsp;' +
                '                       <span type="button"  id="valuechecklist-'+data.id+'}" class="fa fa-list"' +
                '                            onclick="myFunction(' + data.task_id + ',' + data.id + ')">' +
                '                       </span>&nbsp;' +
                '                       <a href="#" class="btn btn-outline btn-sm red text-muted delete-checklist"' +
                '                           data-url="' + data.deleteUrl + '">' +
                '                           <i class="fa fa-trash"></i>' +
                '                       </a>' +
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
var local_lang = '{{App::getLocale()}}';
</script>
<script src="{{asset('assets/js/page/modules-calendar.js')}}"></script>
@endpush
@php
$profile=asset(Storage::url('avatar/'));
@endphp
@section('page-title')
{{__('Calender')}}
@endsection
@section('content')
<section class="section">
    <div class="section-header">
        <h1>{{__('Calender')}}</h1>
        <div class="section-header-breadcrumb">
            <div class="breadcrumb-item active"><a href="{{route('dashboard')}}">{{__('Dashboard')}}</a></div>
            <div class="breadcrumb-item">{{__('Calendar')}}</div>
        </div>
    </div>

    <div class="section-body">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4>{{__('Calendar')}}</h4>
                    </div>
                    <div class="card-body">
                        <div class="fc-overflow">
                            <div id="myEvent"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
