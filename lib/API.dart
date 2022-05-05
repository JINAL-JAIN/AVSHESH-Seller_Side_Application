import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'constants.dart';
import 'register.dart';

class APIservice{
  Future<String> FarmerLogin() async {
    Map homeMap = {
      "Phone_no": Phone_no,
      "Password": Password,
    };
    var response = await http.post(
      ngrok + '/loginvalidation',
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode(homeMap),
    );
    if (response.statusCode == 200) {
      var mapResponse = json.decode(response.body);
      print(mapResponse);
      ValidCredential = mapResponse["success"];
      if(ValidCredential == "True") {
        Farmer_id = mapResponse["data"][0];
        Name = mapResponse["data"][1];
        Email = mapResponse["data"][2];
        Phone_no = mapResponse["data"][3];
        Password = mapResponse["data"][4];
        Address = mapResponse["data"][5];
      }
      print(Farmer_id);
      print(ValidCredential);
    }
  }

  Future<String> getProductList() async {
    Map homeMap = {
      "Farmer_id": Farmer_id,
    };
    var response = await http.post(
      ngrok + '/product',
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode(homeMap),
    );
    if (response.statusCode == 200) {
      var mapResponse = json.decode(response.body);
      print(mapResponse);
      Productlist = mapResponse["data"];
      print(Productlist);
    }
  }

  Future<String> registerFarmer() async {
    Map registerMap = {
      "Name": Name,
      "Email_id": Email,
      "Phone_no": Phone_no,
      "Password": Password,
      "Location": Address,
    };
    print(registerMap);
    var response = await http.post(
      ngrok + '/farmerregister',
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode(registerMap),
    );
    if (response.statusCode == 200) {
      var mapResponse = json.decode(response.body);
      print(mapResponse);
      Farmer_id = mapResponse["data"];
      print(Farmer_id);
    }

  }
  Future<String> getNGOList() async {
    var response = await http.post(
      ngrok + '/displayngo',
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      var mapResponse = json.decode(response.body);
      print(mapResponse);
      NGOlist = mapResponse["data"];
      print(NGOlist);
    }

  }

  Future<String> getDealerList() async {
    var response = await http.post(
      ngrok + '/adddealer',
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      var mapResponse = json.decode(response.body);
      print(mapResponse);
      Dealerlist = mapResponse["data"];
      print(Dealerlist);
    }

  }

  Future<String> addProduct() async {
    Map productMap = {
      "Farmer_id": Farmer_id,
      "Type": Type,
      "Quantity": Quantity,
      "Price": Price,
      "Prod_Address": Prod_Address,
    };
    print(productMap);
    var response = await http.post(
      ngrok + '/addproduct',
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode(productMap),
    );

  }

  Future<String> DeleteProduct() async {
    Map delproductMap = {
      "Product_id": Product_id,

    };
    var response = await http.post(
      ngrok + '/delete',
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode(delproductMap),
    );

  }
  Future<String> editPost() async {
    Map registerMap = {
      "Product_id": Edit_Product_id,
      "Quantity": Edit_Quantity,
      "Price": Edit_Price,
    };
    print(registerMap);
    var response = await http.post(
      ngrok + '/edit_product',
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode(registerMap),

    );

  }

  Future<String> editProfile() async {
    Map registerMap = {
      "Farmer_id": Farmer_id,
      "Name": Name,
      "Email_id": Email,
      "Phone_no": Phone_no,
      //"Password": New_Password,

    };
    print(registerMap);
    var response = await http.post(
      ngrok + '/edit_profile',
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode(registerMap),

    );

  }


}

