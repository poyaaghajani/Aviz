import 'dart:io';
import 'package:dio/dio.dart';

class AppException implements Exception {
  String? message;
  DioException? dioException;

  AppException({required this.message, this.dioException}) {
    {
      if (dioException?.type == DioExceptionType.connectionError ||
          dioException?.error is SocketException) {
        message = 'check conection';
        return;
      }
      if (dioException?.type == DioExceptionType.connectionTimeout ||
          dioException?.type == DioExceptionType.receiveTimeout ||
          dioException?.type == DioExceptionType.sendTimeout) {
        message = 'timeout';
        return;
      }
      if (dioException?.response?.statusCode == 403) {
        message = 'only admin';
        return;
      }
      if (dioException?.response?.statusCode == 404) {
        message = 'not found';
        return;
      }
      if (dioException?.response?.statusCode == 405) {
        message = 'not allowed';
        return;
      }
      if (dioException?.response?.statusCode == 704) {
        message = 'token expierd';
        return;
      }
    }
  }
}

// handle and translate all App exceptions from API
String appExcenptionHandler(String message) {
  if (message == 'check conection') {
    return 'لطفا اتصال به اینترنت را چک کنید';
  }
  if (message == 'timeout') {
    return 'مشکل اتصال به سرور';
  }
  if (message == 'not found') {
    return 'درخواست یافت نشد';
  }
  if (message == 'only admin') {
    return 'فقط ادمین به این بخش دسترسی دارد';
  }
  if (message == 'unauthorized') {
    return 'دسترسی شما مجاز نیست';
  }
  if (message == 'not allowed') {
    return 'نوع درخواست اشتباه است';
  }
  if (message == 'token expierd') {
    return 'توکن شما منقضی شده است';
  }
  if (message == 'error') {
    return 'مشکلی در سرور پیش آمده';
  }
  if (message == '') {
    return 'ایتمی برای نمایش یافت نشد';
  } else {
    return message;
  }
}
