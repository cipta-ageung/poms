<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTaskFilesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('task_files', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('file');
            $table->string('name');
            $table->string('extension');
            $table->string('file_size');
            $table->integer('checklist_id')->default('0');
            $table->integer('task_id');
            $table->String('user_type');
            $table->integer('created_by');
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
        Schema::dropIfExists('task_files');
    }
}