library frode_retrofit;

import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
abstract class IHttp{
  Dio _dio = Dio();
  ///设置Http/Https代理（用于抓包,请勿用于线上环境）
  String proxy()=>'';
  ///设置域名地址
  String baseUrl()=>'';
  ///设置超时时间
  int timeout()=>10*1000;
  ///设置请求拦截器
  List<InterceptorsWrapper> interceptors()=>null;
  ///设置转换器
  DefaultTransformer transformer()=>DefaultTransformer();
  ///创建一个Dio
  Dio create(){
    _dio.options.baseUrl=baseUrl();
    _dio.options.connectTimeout = timeout();
    interceptors()?.forEach((element) {
      _dio.interceptors.add(element);
    });
    _dio.transformer=transformer();
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate=(client){
      ///设置代理
      client.findProxy = (uri) {
        String ip=proxy();
        if(ip!=null&&ip.isNotEmpty)
          return 'PROXY '+ip;
        ///不设置代理
        return 'DIRECT';
      };
      ///忽略证书
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };
    return _dio;
  }
}
