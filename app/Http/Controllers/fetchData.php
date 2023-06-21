<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
class fetchData extends Controller
{
    function show(Request $req)
    {
        $name = $req->input('uname');
        $pass = $req->input('pwd');
        /*return view('display', ['uname'=> $name, 'pwd'=>$pass]);*/

        $data=['name'=>$name, 'password'=>$pass];
        DB::table('login_credentials')->insert($data);
        return view('display');
    }
    function saveProd(Request $req)
    {
        $grain = $req->input('grain');
        $available = $req->input('qavail');
        $tax = $req->input('taxnm');
        $price = $req->input('price');

       /* echo $grain;*/

        $data=['grain'=>$grain,
        'available'=>$available,
        'taxname'=>$tax,
        'price'=>$price];

            /*print_r($data);*/
        DB::table('homedata')->insert($data);
        /*echo "Data inserted";*/
        $products = DB::select('select * from homedata');
       /* print_r($products);*/
        return view('stock_update', ['product'=>$products]);

    }
    function displayProd()
    {
        $products = DB::select('select * from homedata');
        /*echo $products;*/
        return view('stock_update', ['products'=>$products]);
    }
    function displayProducts()
    {
        $products = DB::select('select * from homedata');
        /*echo $products;*/
        return view('orders', ['products'=>$products]);
    }
    function editProducts()
    {
        $products = DB::select('select * from homedata');
        /*echo $products;*/
        /*$name = $request->input('stud_name');*/
        /*DB::update('update homedata set gname = ? where id = ?',[$name,$id]);
        echo "Record updated successfully.<br/>";
*/        return view('edit_data', ['products'=>$products]);
    }
    function deleteProd()
    {
        $products = DB::select('select * from homedata');
        /*echo $products;*/
        return view('delete', ['products'=>$products]);
    }
    function edit($id){
        
     $products = DB::select("select * from homedata where id=$id");
    /* echo "$id";
*/

     return view('edit', ['products'=>$products]);  
    }
    function edit_show(Request $request, $id)
    {
        $gr = $request->input('grain');
        $id = $request->input('id');
        $orkg = $request->input('orderkg');
        $tn = $request->input('taxname');
        $pr = $request->input('price'); 


        // DB::update('update homedata set grain=?, available=?, taxname=?, price=?, where id=?',[$gr, $orkg, $tn, $pr, $id]);
        DB::update('UPDATE homedata SET grain=?, available=?, taxname=?, price=? WHERE id=? ', [$gr, $orkg, $tn, $pr,$id]);

        // return redirect("orders");
        
        

        $products = DB::select('select * from homedata');
        
        return view('edit_data', ['products'=>$products]);

    }
    function delProd($id)
    {
        DB::table('homedata')->delete($id);
        $products = DB::select("select * from homedata where id=$id");
        // print_r($id);
        /*echo $products;*/
        return redirect("/del");
    }
    public function userD(Request $req){
        $users = DB::table('user_data')->get();
        // echo "{$users}";
        return view('Userdetail', ['ud'=>$users]);

    }

}
