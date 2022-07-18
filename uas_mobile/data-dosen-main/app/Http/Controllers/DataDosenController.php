<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\DataDosen;
use Illuminate\Support\Facades\Validator;
use Symfony\Component\HttpFoundation\Response;

class DataDosenController extends Controller
{
    public function index() {
        $datadosen = DataDosen::orderBy('id', 'desc')->get();

        $response = [
            'message' => "List Data Dosen",
            'data' => $datadosen,
        ];

        return response()->json($response, Response::HTTP_OK);
    }

    public function store(Request $request) {
        $validator = Validator::make($request->all(), [
            'dosenid'    => ['required', 'numeric', 'max:80'],
            'nama'       => ['required', 'string', 'max:80'],
            'fakultas'   => ['required', 'string', 'max:80'],
            'prodi'      => ['required', 'string', 'max:80'],
            'email'      => ['required', 'email'],
            'nomor'      => ['required', 'numeric'],
            'lahir'      => ['required', 'string'],
        ]);

        if($validator->fails()) {
            return response()->json($validator->errors(), Response::HTTP_UNPROCESSABLE_ENTITY);
        }

        try {
            $datadosen = DataDosen::create($request->all());

            $response = [
                'message' => "Sukses",
                'data' => $datadosen,
            ];

            return response()->json($response, Response::HTTP_CREATED);
        } catch (QueryException $e) {
            return response()->json([
                'message' => 'Gagal, ' . $e->errorinfo,
            ]);
        }
    }

    public function show($id) {
        $datadosen = DataDosen::findOrFail($id);

        try {
            $response = [
                'message' => "Data Dosen",
                'data' => $datadosen,
            ];

            return response()->json($response, Response::HTTP_OK);
        } catch (QueryException $e) {
            return response()->json([
                'message' => 'Data Tidak Ada, ' . $e->errorinfo,
            ]);
        }
    }

    public function update(Request $request, $id) {
        $datadosen = DataDosen::findOrFail($id);

        $validator = Validator::make($request->all(), [
            'dosenid'    => ['required', 'numeric', 'max:80'],
            'nama'       => ['required', 'string', 'max:80'],
            'fakultas'   => ['required', 'string', 'max:80'],
            'prodi'      => ['required', 'string', 'max:80'],
            'email'      => ['required', 'email'],
            'nomor'      => ['required', 'numeric'],
            'lahir'      => ['required', 'string'],
        ]);

        if($validator->fails()) {
            return response()->json($validator->errors(), Response::HTTP_UNPROCESSABLE_ENTITY);
        }

        try {
            $datadosen->update($request->all());

            $response = [
                'message' => "Sukses",
                'data' => $datadosen,
            ];

            return response()->json($response, Response::HTTP_OK);
        } catch (QueryException $e) {
            return response()->json([
                'message' => 'Gagal, ' . $e->errorinfo,
            ]);
        }
    }

    public function destroy($id) {
        $datadosen = DataDosen::findOrFail($id);

        try {
            $datadosen->delete();

            $response = [
                'message' => "Sukses",
            ];

            return response()->json($response, Response::HTTP_OK);
        } catch (QueryException $e) {
            return response()->json([
                'message' => 'Gagal, ' . $e->errorinfo,
            ]);
        }
    }
}
