<?php

namespace App\Http\Controllers;

use App\ChecklistComments;
use App\CheckList;
use App\User;
use App\ActivityLog;
use Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Storage;

class ChecklistCommentsController extends Controller
{
    public function index($checklist_id)
    {
        $comments = ChecklistComments::where('checklist_id', $checklist_id)->get();
        $data = [];
        foreach ($comments as $comment) {
            $user = User::find($comment->created_by);
            $data[$comment->id] = $user->name;
        }
        
        return view('checklistcomments.index', compact('comments', 'data'));
    }

    public function create($checklist_id)
    {
        $checkList = CheckList::find($checklist_id);
        return view('checklistcomments.create', compact('checkList'));
    }

    public function store(Request $request, $checklist_id)
    {
        $comments = new ChecklistComments();
        $comments->checklist_id = $checklist_id;
        $comments->comment = $request->comment;
        $comments->voice_notes = '';
        $comments->created_by = \Auth::user()->authId();
        $comments->checklist_files = '';
        if($request->hasFile('files')){
            $file = $request->file('files');
            $fileName = $request->taskid . time() . "_" . $file->getClientOriginalName();
            Storage::disk('public')->put('checklist_files/' . $fileName, file_get_contents($file));
            $comments->checklist_files = $fileName;
        }

        if($request->hasFile('voicenote')){
            $blobInput = $request->file('voicenote');
            $comments->voice_notes = $checklist_id . "_" . $comments->created_by . "_" . time() . "_voicenote.wav";
            Storage::disk('public')->put('audio/' . $comments->voice_notes, file_get_contents($blobInput));
        }
        // save or insert comment
        $comments->save();

        return redirect()->back()->with('success', 'Comment saved');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\ChecklistComments  $checklistComments
     * @return \Illuminate\Http\Response
     */
    public function show(ChecklistComments $checklistComments)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\ChecklistComments  $checklistComments
     * @return \Illuminate\Http\Response
     */
    public function edit(ChecklistComments $checklistComments)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\ChecklistComments  $checklistComments
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ChecklistComments $checklistComments)
    {
        //
    }

    public function destroy(Request $request, $id)
    {
        $comments = ChecklistComments::find($id);
        if (Storage::disk('public')->exists('audio/'. $comments->voice_notes)) {
            Storage::disk('public')->delete('audio/'.$comments->voice_notes);
        }

        if (Storage::disk('public')->exists('checklist_files/' . $comments->checklist_file)) {
            Storage::disk('public')->delete('checklist_files/' . $comments->checklist_files);
        }

        $comments->delete();

        return $comments;
    }

    public function destroyByChecklistId(Request $request, $checklist_id)
    {
        try {
            $comments = ChecklistComments::where('checklist_id', $checklist_id)->get();
            foreach($comments as $comment) {
                $this->destroy($request, $comment->id);
            }
            return true;
        } catch(\Exception $exception){
            return false;
        }
    }
}
