<div class="col-lg-12">
    <h4>List Comment <button id="close-list-comment" class="badge badge-warning float-right text-sm-right">
        <small>close</small></button>
    </h4>
    <div>
    @foreach($comments as $comment)
    <span class="text-primary badge-secondary p-1 text-white text-capitalize">
        {{$data[$comment->id]}} 
        <small class="font-italic text-info text-sm-right">
            <{{$comment->created_at}}>
        </small>
    </span>
    
    <div class="col-lg-12 bg-light p-1">
        <span class="text-primary text-capitalize font-weight-bold">{{$comment->comment}}</span>
        <span href="#" id="delete-checklist-comment-{{$comment->id}}" type="button" class="text-muted delete-checklist-comment"
            data-url="{{route('checklistcomment.destroy', $comment->id)}}" style="float: right;">
                <em class="fa fa-trash text-dark"></em>
        </span>
        <br>
        @if(!empty(trim($comment->checklist_files)))
        <img src="{{ asset('assets/img/files.png')}}" alt="" width="20" />
        <a href="#" download="{{ asset(Storage::url('checklist_files/'.$comment->checklist_files)) }}" target="_blank" class="text-primary font-weight-bold">
            {{$comment->checklist_files}}
        </a>&nbsp;&nbsp;
        
        @endif
        @if(!empty(trim($comment->voice_notes)))
        <img src="{{ asset('assets/img/voice_notes.png')}}" alt="" width="20" />
        <a href="#" download="{{ asset(Storage::url('audio/'.$comment->voice_notes)) }}" target="_blank" class="text-primary font-weight-bold">
            {{$comment->voice_notes}}
        </a>
        @endif
    </div>
    @endforeach
    </div>
</div>
<script>
    $(document).on('click','#close-list-comment', function(e) {
        $('#content-comment').slideUp();
        $('#content-checklist').slideDown();
        $('#content-comment-list').slideUp();
    });

    $('.delete-checklist-comment').on("click", function(e) {
    e.preventDefault();
    if (confirm('Are You Sure ?')) {
        $.ajax({
            url: $(this).attr('data-url'),
            type: 'DELETE',
            data: {
                _token: $('meta[name="csrf-token"]').attr('content')
            },
            dataType: 'JSON',
            cache: false,
            success: function(data) {
                console.log(data);
                toastrs('Success', 'Checklist Comment Deleted Successfully!', 'success');
                $('#content-comment').slideUp();
                $('#content-checklist').slideDown();
                $('#content-comment-list').slideUp();
                $('span#id-'+data.checklist_id).trigger('click');
            },
            error: function(data) {
                data = data.responseJSON;
                if (data.message) {
                    toastrs('Error', data.message, 'error');
                } else {
                    toastrs('Error', 'Some Thing Is Wrong!', 'error');
                }
            }
        });
    }
});
</script>