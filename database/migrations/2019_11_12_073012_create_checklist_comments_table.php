<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateChecklistCommentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('checklist_comments', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('checklist_id')->default('0');
            $table->text('comment');
            $table->string('voice_notes');
            $table->string('checklist_files');
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
        Schema::dropIfExists('_checklist_comments');
    }
}