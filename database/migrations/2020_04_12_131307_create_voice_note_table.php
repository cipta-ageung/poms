<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVoiceNoteTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('voicenotes', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->text('voicenote');
            $table->text('filename');
            $table->integer('checklist_id')->default('0');
            $table->integer('task_id')->default('0');
            $table->string('user_type', 100);
            $table->integer('created_by')->default('0');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('voicenote');
    }
}