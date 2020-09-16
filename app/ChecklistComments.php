<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ChecklistComments extends Model
{
    protected $fillable = [
        'comment', 'voice_notes', 'checklist_files', 'checklist_id', 'created_by',
    ];

    protected $hidden = [

    ];

    public function comment_user()
    {
        return User::where('id', '=', $this->created_by)->first();
    }
    public function user()
    {
        return $this->hasOne('App\User', 'id', 'created_by');
    }
}
