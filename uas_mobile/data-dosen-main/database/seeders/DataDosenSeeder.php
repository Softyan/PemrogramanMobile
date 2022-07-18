<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

use App\Models\DataDosen;

class DataDosenSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DataDosen::truncate();

        $data = [
            [
                'dosenid'   => '123',
                'nama'      => 'Dosen 1',
                'fakultas'  => 'Ilmu Komputer',
                'prodi'     => 'Teknik Informatika',
                'email'     => 'dosen1@gmail.com',
                'nomor'     => '62',
                'lahir'     => 'Jakarta',
                'created_at' => date('Y-m-d h:i:s', time()),
                'updated_at' => date('Y-m-d h:i:s', time()),
            ],
            [
                'dosenid'   => '124',
                'nama'      => 'Dosen 2',
                'fakultas'  => 'Ilmu Komputer',
                'prodi'     => 'Teknik Informatika',
                'email'     => 'dosen2@gmail.com',
                'nomor'     => '62',
                'lahir'     => 'Jakarta',
                'created_at' => date('Y-m-d h:i:s', time()),
                'updated_at' => date('Y-m-d h:i:s', time()),
            ],
        ];

        DataDosen::insert($data);
    }
}
