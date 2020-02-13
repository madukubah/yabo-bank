<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSellingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        return;
        Schema::create('sellings', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('factory_name');
            $table->string('container_number');
            $table->string('car_number');
            $table->date('send_date');
            $table->date('unloading_date');
            $table->double('gross');
            $table->double('cut_off');
            $table->double('selling_price');
            // $table->double('nominal');
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
        Schema::dropIfExists('sellings');
    }
}
