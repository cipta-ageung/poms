<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Voicenote extends Model
{
    protected $fillable = [
        'voicenote', 'task_id', 'checklist_id', 'filename', 'created_by', 'user_type',
    ];

    protected $hidden = [

    ];

    public function voicenote_user()
    {
        return User::where('id', '=', $this->created_by)->first();
    }
    public function user()
    {
        return $this->hasOne('App\User', 'id', 'created_by');
    }

}