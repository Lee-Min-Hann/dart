<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Helpers\ResponseHelper;
use Illuminate\Http\Request;
use App\Models\Category;

class CategoryController extends Controller
{
    //index
    public function index(Request $request)
    {
        $categories = Category::all();
        return ResponseHelper::success('List kategori', $categories);
    }

    // Store category
    public function store(Request $request)
    {
        $request->validate(['name' => 'required|string|max:255']);

        $category = Category::create(['name' => $request->name]);

        return ResponseHelper::success('Kategori berhasil ditambahkan', $category, 201);
    }

    // Show single category
    public function show($id)
    {
        $category = Category::find($id);

        if (!$category) {
            return ResponseHelper::error('Kategori tidak ditemukan', 404);
        }

        return ResponseHelper::success('Detail kategori', $category);
    }

    // Update category
    public function update(Request $request, $id)
    {
        $category = Category::find($id);

        if (!$category) {
            return ResponseHelper::error('Kategori tidak ditemukan', 404);
        }

        $request->validate(['name' => 'required|string|max:255']);
        $category->update(['name' => $request->name]);

        return ResponseHelper::success('Kategori berhasil diperbarui', $category);
    }

    // Delete category
    public function destroy($id)
    {
        $category = Category::find($id);

        if (!$category) {
            return ResponseHelper::error('Kategori tidak ditemukan', 404);
        }

        $category->delete();

        return ResponseHelper::success('Kategori berhasil dihapus');
    }
}
