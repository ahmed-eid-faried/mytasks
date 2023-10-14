// import 'dart:convert';
// import 'package:dartz/dartz.dart';
// import 'package:mytasks/core/class/status_request.dart';
// import 'package:mytasks/core/function/checkinternet.dart';
// import 'package:http/http.dart' as http;

// class Curd {
//   Future<Either<StatusRequest, Map>> getData(String link) async {
//     try {
//       if (await checkInternet()) {
//         var response = await http.get(Uri.parse(link));
//         if (response.statusCode == 200 || response.statusCode == 201) {
//           var responsebody = jsonDecode(response.body);
//           print(responsebody);
//           return Right(responsebody);
//         } else {
//           return const Left(StatusRequest.serverfailure);
//         }
//       } else {
//         return const Left(StatusRequest.offlinefailure);
//       }
//     } catch (e) {
//       print(e);
//       return const Left(StatusRequest.serverException);
//     }
//   }

//   Future<Either<StatusRequest, Map>> postData(String link, Map data) async {
//     try {
//       if (await checkInternet()) {
//         var response = await http.post(Uri.parse(link), body: data);
//         if (response.statusCode == 200 || response.statusCode == 201) {
//           var responsebody = jsonDecode(response.body);
//           print(responsebody);
//           return Right(responsebody);
//         } else {
//           return const Left(StatusRequest.serverfailure);
//         }
//       } else {
//         return const Left(StatusRequest.offlinefailure);
//       }
//     } catch (e) {
//       print(e);
//       return const Left(StatusRequest.serverException);
//     }
//   }
// }
