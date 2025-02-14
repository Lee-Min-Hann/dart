<?php

namespace App\Http\Controllers\Api;

use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Auth;

class OrderController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:sanctum'); // Proteksi dengan token
    }

    public function index()
    {
        $orders = Order::where('cashier_id', Auth::id())->get();
        return response()->json($orders, 200);
    }

    public function store(Request $request)
    {
        $request->validate([
            'transaction_time' => 'required|date',
            'total_price' => 'required|integer',
            'total_item' => 'required|integer',
            'payment_amount' => 'required|integer',
            'payment_method' => 'required|string',
        ]);

        $order = Order::create([
            'transaction_time' => $request->transaction_time,
            'total_price' => $request->total_price,
            'total_item' => $request->total_item,
            'payment_amount' => $request->payment_amount,
            'cashier_id' => Auth::id(),
            'cashier_name' => Auth::user()->name,
            'payment_method' => $request->payment_method,
        ]);

        return response()->json($order, 201);
    }

    public function show($id)
    {
        $order = Order::where('id', $id)->where('cashier_id', Auth::id())->first();

        if (!$order) {
            return response()->json(['message' => 'Order not found'], 404);
        }

        return response()->json($order, 200);
    }

    public function update(Request $request, $id)
    {
        $order = Order::where('id', $id)->where('cashier_id', Auth::id())->first();

        if (!$order) {
            return response()->json(['message' => 'Order not found'], 404);
        }

        $request->validate([
            'transaction_time' => 'date',
            'total_price' => 'integer',
            'total_item' => 'integer',
            'payment_amount' => 'integer',
            'payment_method' => 'string',
        ]);

        $order->update($request->only([
            'transaction_time', 'total_price', 'total_item', 'payment_amount', 'payment_method'
        ]));

        return response()->json($order, 200);
    }

    public function destroy($id)
    {
        $order = Order::where('id', $id)->where('cashier_id', Auth::id())->first();

        if (!$order) {
            return response()->json(['message' => 'Order not found'], 404);
        }

        $order->delete();
        return response()->json(['message' => 'Order deleted successfully'], 200);
    }
}
