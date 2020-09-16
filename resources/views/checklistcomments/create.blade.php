
<div class="col-lg-12">
   <div class="card-body" style="height:auto !important">
      <form method="post" class="form" id="form-add-comments" enctype="multipart/form-data"
         data-url="{{ route('checklistcomment.store',[$checkList->id]) }}">
         @csrf
         <label>Voice Note</label>
         <span class="invalid-feedback" id="file-error" role="alert">
         <strong></strong>
         </span>
         <div class="text-center" style="border:0.6px solid #ddd;padding:10px;">
            <div class="col-lg-12">
               <div class="row">
                  <div class="col-lg-3">
                     <a class="btn btn-primary form-control disabled" style="color:#fff;"
                        id="recordButton" ><em class="fa fa-play"></em> Record</a>
                  </div>
                  <div class="col-lg-3">
                     <a class="btn btn-info form-control disabled" style="color:#fff;"
                        id="pauseButton" ><em class="fa fa-pause"></em>
                     Pause</a>
                  </div>
                  <div class="col-lg-3">
                     <a class="btn btn-danger form-control disabled" id="stopButton">
                     <em class="fa fa-stop"></em>
                     Stop</a>
                  </div>
                  <div class="col-lg-3">
                     <a class="btn btn-warning form-control disabled" id="clearButton" onclick='removeRecording()'>
                     <em class="fa fa-trash"></em>
                     Clear</a>
                  </div>
               </div>
            </div>
            
            <div class="container m-2">
               <audio class="d-none disabled" width="auto" height="50" id="voicenote" preload="metadata" 
                    controlsList="nodownload" name="voicenote" type="audio/wav" controls >
               </audio>
            </div>
         </div>
         <label>Comment</label>
         <textarea class="form-control" name="comment" placeholder="{{ __('Write message')}}" id="comment" rows="3"></textarea>
         <label>File</label>
         <input type="file" class="form-control-file mb-2" name="files" id="files">
         <span class="invalid-feedback" id="file-error" role="alert">
         <strong></strong>
         </span>
         <div class="text-right mt-10">
            <div class="btn-group mb-2 ml-2 d-none d-sm-inline-block">
               <button id="cancel-comment" type="button" class="btn btn-warning">{{ __('Cancel')}}</button>
               <button type="submit" class="btn btn-primary">{{ __('Submit')}}</button>
            </div>
         </div>
      </form>
   </div>
</div>

<!-- import library for voice record -->
<script src="{{asset('assets/modules/voicenote/voicenote.js')}}"></script>

<script type="text/javascript">
    // initiate for voice record
    URL = window.URL || window.webkitURL;
    var gumStream;
    var rec;
    var input;
    var AudioContext = window.AudioContext || window.webkitAudioContext;
    var audioContext;
    var voicenote;

    $(document).ready(function(e){
        $("#recordButton").removeClass("disabled");
    });

    // audio record start
    $('#recordButton').on('click', function(e) {
        e.preventDefault();
        var constraints = {
            audio: true,
            video: false
        }
        
        navigator.mediaDevices.getUserMedia(constraints).then(function(stream) {
            audioContext = new AudioContext();
            gumStream = stream;
            input = audioContext.createMediaStreamSource(stream);
            rec = new Recorder(input, {
                numChannels: 1
            })
            rec.record()
            console.log("Recording started");
            // enable button stop and pause
            $("#stopButton").removeClass("disabled");
            $("#pauseButton").removeClass("disabled");
        }).catch(function(err) {
            console.log(err);
            $("#recordButton").addClass("disabled");
            $("#stopButton").addClass("disabled");
            $("#pauseButton").addClass("disabled");
            $("#clearButton").addClass("disabled");
        });
    });

    // audio record stop
    $('#stopButton').on('click', function(e) {
        e.preventDefault();
        $("#recordButton").removeClass("disabled");
        $("#stopButton").addClass("disabled");
        $("#pauseButton").addClass("disabled");
        $("#clearButton").removeClass("disabled");
        $("#pauseButton").html("Pause");
        rec.stop();
        gumStream.getAudioTracks()[0].stop();
        rec.exportWAV(createDownloadLink);
    });

    // audio record pause
    $('#pauseButton').on('click', function(e) {
        e.preventDefault();
        if (rec.recording) {
            //pause
            rec.stop();
            $("#pauseButton").html("Resume");
        }else {
            //resume
            rec.record()
            $("#pauseButton").html("Pause");
        }
    });

    function removeRecording(){
        $('#voicenote').empty();
        voicenote = null;
        $("#voicenote").addClass("d-none disabled");
        $("#clearButton").addClass("disabled");
    }

    function createDownloadLink(blob) {
        rec && rec.exportWAV(function(blob) {
            $('#voicenote').empty();
            $("#voicenote").removeClass("d-none disabled");
            $('#voicenote').prop("src", URL.createObjectURL(blob));
            voicenote = new Blob([blob], { type: "audio/wav" });
        });
    }
    
    // form add comments submit
    $('#form-add-comments').on("submit", function(e) {
        e.preventDefault();
        var fd = new FormData(this);
        fd.append("voicenote", voicenote);
        $.ajax({
            type: "POST",
            url: $("#form-add-comments").data('url'),
            enctype: 'multipart/form-data',
            contentType: false,
            cache: false,
            processData: false,
            data: fd,
            success: function(data, status) {
                $('#content-checklist').slideDown();
                $('#content-comment').slideUp();
                $('#content-comment-list').slideUp();
                voicenote = null;
                toastrs('Success', '{{ __("Comment Added Successfully!")}}', 'success');
            },
            error: function(data) {
                data = data.responseJSON;
                if (data) {
                    toastrs('Error', data, 'error');
                } else {
                    toastrs('Error', data, 'error');
                }
            }
        });
        return false;
    });

    // cancel add comments
    $(document).on('click', '#cancel-comment', function(e) {
        $('#content-comment').slideUp();
        $('#content-checklist').slideDown();
        $('#content-comment-list').slideUp();
    });
</script>