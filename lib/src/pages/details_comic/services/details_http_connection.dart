import 'dart:convert';
import 'dart:io';
import 'package:comic_book_app/src/global/config/env.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DetailsHttpConnection{

  final _dio = Dio();

  Future<Response?> getComicsDetails({required String urlDetail}) async {
    String url = Enviroment.urlBase;
    Response? response;
    try {
      response = await _dio.get('$urlDetail?api_key=${Enviroment.apiKey}&format=json');
    }catch (e) {
      debugPrint(e.toString());
    }
    return response;
  }
}