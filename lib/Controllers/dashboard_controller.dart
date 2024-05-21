import 'dart:convert';
import '/Models/dashboard_model.dart';
import 'package:flutter/cupertino.dart';
import '/services/api-list.dart';
import '/services/server.dart';
import '/services/user-service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DashboardController extends GetxController {
  UserService userService = UserService();
  Server server = Server();
  List<ParcelModel> deliveredList = <ParcelModel>[].obs;
  List<ParcelModel> requestList = <ParcelModel>[].obs;
  List<ParcelModel> deliverymanReScheduleList = <ParcelModel>[].obs;
  List<ParcelModel> deliverymanAssignList = <ParcelModel>[].obs;
  List<ParcelModel> returnToCourierList = <ParcelModel>[].obs;
  final TextEditingController cashController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  String? statusID = '9';
  String? collectStatusID = '2';
  String? userID;
  RxBool dashboardLoader = false.obs;
  bool commonLoader = false;
  bool loader = false;
  late DataDashboard dashboardData;

  @override
  void onInit() {
    getDashboard();
    super.onInit();
  }

  getDashboard() async {
    deliveredList = <ParcelModel>[];
    deliverymanReScheduleList = <ParcelModel>[];
    deliverymanAssignList = <ParcelModel>[];
    returnToCourierList = <ParcelModel>[];
    requestList = <ParcelModel>[];
    dashboardLoader.value = true;
    var response = await server.getRequest(endPoint: APIList.dashboard);
    if (response != null && response.statusCode == 200) {
      dashboardLoader.value = false;
      final jsonResponse = json.decode(response.body);
      var dashboard = DashboardModel.fromJson(jsonResponse);
      dashboardData = dashboard.data!;
      deliveredList.addAll(dashboard.data!.delivered!);
      requestList.addAll(dashboard.data!.parcelRequest!);
      deliverymanReScheduleList.addAll(dashboard.data!.deliverymanReSchedule!);
      deliverymanAssignList.addAll(dashboard.data!.deliverymanAssign!);
      returnToCourierList.addAll(dashboard.data!.returnToCourier!);
      update();
    } else {
      dashboardLoader.value = false;
      update();
    }
  }

  changeStatus(context, parcelId, pickedSignatureImage, image) async {
    dashboardLoader.value = true;
    print(pickedSignatureImage);
    print(image);
    update();
    Map<String, String> body = {
      'parcel_id': parcelId,
      'status_action': statusID!,
      'cash_collection': cashController.text,
      'note': noteController.text,
    };

    print("bodys=======${body}");
    // String jsonbody = jsonEncode(body);

    try {
      var response = await server.multipartFileRequest(endPoint: APIList.changeStatus, body: body, filepath: image, pickedSignatureImage: pickedSignatureImage, type: true);
      print("======fahad====${response}+++++++++++++");
      print(response is String);
      print(response.runtimeType);
      // print("=====fahad=====${response.statusCode}+++++++++++++++");
      // print("====fahad======${response.body}+++++++++++");
      var data = jsonDecode(response as String);
      if (data != null) {
        // var data = jsonDecode(response.body);

        print("=====datasdddd=====${data}+++++++++++++");

        await getDashboard();
        Get.rawSnackbar(
          snackPosition: SnackPosition.TOP,
          title: 'Change Status',
          message: 'Status Successfully',
          backgroundColor: CupertinoColors.activeGreen.withOpacity(.9),
          margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        );
        dashboardLoader.value = false;
        update();
      } else {
        dashboardLoader.value = false;
        update();
      }
    } catch (e) {
      Get.log(e.toString());
      dashboardLoader.value = false;
      update();
    }
  }

  changeStatusWithOutSignature({
    context,
    statusID,
    parcelId,
  }) async {
    dashboardLoader.value = true;

    update();
    Map<String, String> body = {
      'parcel_id': parcelId,
      'status_action': collectStatusID!,
      'note': noteController.text,
    };
    String jsonbody = jsonEncode(body);
    print(body);
    try {
      var response = await server.postRequestWithToken(endPoint: APIList.changeStatus, body: jsonbody);
      print(response.statusCode);
      print(response is String);
      print(response is http.Response);
      print(response.runtimeType);
      print("======fahad====${response}+++++++++++++");
      print("=====fahad=====${response.statusCode}+++++++++++++++");
      print("====fahad======${response.body}+++++++++++");
      if (response.statusCode == 200) {
        await getDashboard();
        Get.rawSnackbar(
          snackPosition: SnackPosition.TOP,
          title: 'Change Status',
          message: 'Status Successfully',
          backgroundColor: CupertinoColors.activeGreen.withOpacity(.9),
          margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        );
        dashboardLoader.value = false;
      } else {
        dashboardLoader.value = false;
        update();
      }
    } catch (e) {
      Get.log(e.toString());
      dashboardLoader.value = false;
      update();
    }
  }
}
