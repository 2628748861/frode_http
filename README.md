# frode_http

flutter基于retrofit+dio实现网络请求.

## Getting Started

注意该插件已依赖retrofit,dio.

```
retrofit: ^1.3.4+1
dio: ^3.0.4
```


[github项目主页地址](https://github.com/2628748861/frode_http.git)

安装依赖:

```
dependencies:
  frode_http: xx
  json_annotation: xx (可选)

dev_dependencies:
  build_runner: xx
  retrofit_generator: xx
  json_serializable: xx (可选)
```

使用方法:


1.创建dio继承IHttp

```
class DefaultHttp extends IHttp{

  @override
  String baseUrl() {
    return 'xxx';
  }

  @override
  String proxy() =>'xx';

  @override
  List<InterceptorsWrapper> interceptors() =>[...];

}
```

2.使用retrofit自动生成的方式生成具体请求接口类

```
@RestApi()
abstract class Api{

 factory Api(Dio dio, {String baseUrl}) {
    return _Api(dio,baseUrl: baseUrl);
  }

  @POST('/o_s_app/auth/login')
  Future<BaseResponse> login(@Body() Login login);

 @GET('/o_s_app/sales-app/app/visitingCard/info')
 Future<BaseResponse> cardInfo();
}
```

3.发起请求

```
Api(DefaultHttp().create()).login(Login('xx','xx')).then((value){
      print('请求结果为:$value');
    }).catchError((e){
      print('异常信息为:${e?.message}');
    });
```

















