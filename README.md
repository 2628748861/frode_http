# dio_request 

A new Flutter package for http request width dio.

## Getting Started

提取了dio特性,封装为一个抽象的http请求类,精简了创建dio各种属性的设置,在实际应用中结合[retrofit](https://pub.dev/packages/retrofit)进行开发将会更加快速便捷.
## 注意

为避免太多的依赖冲突,此依赖并没有引用[retrofit](https://pub.dev/packages/retrofit)相关依赖.如需使用请自行依赖.


[github项目主页地址](https://github.com/2628748861/frode_http)

## 安装依赖

```
dependencies:
  dio_request: xx
```

## 使用方法

###### 在已安装依赖的前提下,按如下操作完成:
-  ###### 继承IHttp创建一个网络请求类

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
-  ###### 引用

```
var http=DefaultHttp().create()
http.get(...)
```

- ###### 设置baseUrl
```
 @override
  String baseUrl() {
    return 'xxx';
  }
```
- ###### 设置超时时间
```
 @override
  int timeout() {
    return 10*1000;
  } 
```
- ###### 设置代理(抓包专用)
```
@override
  String proxy() =>'xx';
```
- ###### 设置拦截器
```
@override
  List<InterceptorsWrapper> interceptors() =>[...];
```
- ###### 设置转换器

```
@override
  DefaultTransformer transformer() =>MyTransformer();
```
