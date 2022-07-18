<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDataDosensTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('data_dosens', function (Blueprint $table) {
            $table->id();

            $table->string('dosenid');
            $table->string('nama');
            $table->string('fakultas');
            $table->string('prodi');
            $table->string('email');
            $table->string('nomor');
            $table->string('lahir');
            

            $table->timestamps();
        });

        Artisan::call('db:seed', array('--class' => 'DataDosenSeeder'));
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('data_dosens');
    }
}
