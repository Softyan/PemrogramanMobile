<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DataDosen extends Model
{
    use HasFactory;

    protected $fillable = [
        'dosenid',
        'nama',
        'fakultas',
        'prodi',
        'email',
        'nomor',
        'lahir',
    ];
}
