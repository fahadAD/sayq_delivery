class DashboardModel {
  bool? success;
  String? message;
  DataDashboard? data;

  DashboardModel({this.success, this.message, this.data});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new DataDashboard.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataDashboard {
  List<ParcelModel>? parcelRequest;
  List<ParcelModel>? deliverymanAssign;
  List<ParcelModel>? deliverymanReSchedule;
  List<ParcelModel>? returnToCourier;
  List<ParcelModel>? delivered;

  DataDashboard({this.parcelRequest, this.deliverymanAssign, this.deliverymanReSchedule, this.returnToCourier, this.delivered});

  DataDashboard.fromJson(Map<String, dynamic> json) {
    if (json['parcel_request'] != null) {
      parcelRequest = <ParcelModel>[];
      json['parcel_request'].forEach((v) {
        parcelRequest!.add(new ParcelModel.fromJson(v));
      });
    }
    if (json['deliveryman_assign'] != null) {
      deliverymanAssign = <ParcelModel>[];
      json['deliveryman_assign'].forEach((v) {
        deliverymanAssign!.add(new ParcelModel.fromJson(v));
      });
    }
    if (json['deliveryman_re_schedule'] != null) {
      deliverymanReSchedule = <ParcelModel>[];
      json['deliveryman_re_schedule'].forEach((v) {
        deliverymanReSchedule!.add(new ParcelModel.fromJson(v));
      });
    }
    if (json['return_to_courier'] != null) {
      returnToCourier = <ParcelModel>[];
      json['return_to_courier'].forEach((v) {
        returnToCourier!.add(new ParcelModel.fromJson(v));
      });
    }
    if (json['delivered'] != null) {
      delivered = <ParcelModel>[];
      json['delivered'].forEach((v) {
        delivered!.add(new ParcelModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.parcelRequest != null) {
      data['parcel_request'] = this.parcelRequest!.map((v) => v.toJson()).toList();
    }
    if (this.deliverymanAssign != null) {
      data['deliveryman_assign'] = this.deliverymanAssign!.map((v) => v.toJson()).toList();
    }
    if (this.deliverymanReSchedule != null) {
      data['deliveryman_re_schedule'] = this.deliverymanReSchedule!.map((v) => v.toJson()).toList();
    }
    if (this.returnToCourier != null) {
      data['return_to_courier'] = this.returnToCourier!.map((v) => v.toJson()).toList();
    }
    if (this.delivered != null) {
      data['delivered'] = this.delivered!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ParcelModel {
  int? id;
  String? trackingId;
  int? merchantId;
  String? merchantName;
  String? merchantUserName;
  String? merchantUserEmail;
  String? merchantMobile;
  String? merchantAddress;
  String? customerName;
  String? customerPhone;
  String? customerAddress;
  String? note;
  String? invoiceNo;
  String? weight;
  String? totalDeliveryAmount;
  String? codAmount;
  String? vatAmount;
  String? currentPayable;
  String? cashCollection;
  int? deliveryTypeId;
  String? deliveryType;
  int? status;
  dynamic priorityTypeId;
  String? statusName;
  String? pickupDate;
  String? deliveryDate;
  String? createdAt;
  String? updatedAt;
  String? parcelDate;
  String? parcelTime;

  ParcelModel(
      {this.id,
      this.trackingId,
      this.merchantId,
      this.merchantName,
      this.merchantUserName,
      this.merchantUserEmail,
      this.merchantMobile,
      this.merchantAddress,
      this.customerName,
      this.customerPhone,
      this.customerAddress,
      this.note,
      this.invoiceNo,
      this.weight,
      this.totalDeliveryAmount,
      this.codAmount,
      this.vatAmount,
      this.currentPayable,
      this.cashCollection,
      this.deliveryTypeId,
      this.deliveryType,
      this.status,
      this.priorityTypeId,
      this.statusName,
      this.pickupDate,
      this.deliveryDate,
      this.createdAt,
      this.updatedAt,
      this.parcelDate,
      this.parcelTime});

  ParcelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    trackingId = json['tracking_id'];
    merchantId = json['merchant_id'];
    merchantName = json['merchant_name'];
    merchantUserName = json['merchant_user_name'];
    merchantUserEmail = json['merchant_user_email'];
    merchantMobile = json['merchant_mobile'];
    merchantAddress = json['merchant_address'];
    customerName = json['customer_name'];
    customerPhone = json['customer_phone'];
    customerAddress = json['customer_address'];
    note = json['note'];
    invoiceNo = json['invoice_no'];
    weight = json['weight'];
    totalDeliveryAmount = json['total_delivery_amount'];
    codAmount = json['cod_amount'];
    vatAmount = json['vat_amount'];
    currentPayable = json['current_payable'];
    cashCollection = json['cash_collection'];
    deliveryTypeId = json['delivery_type_id'];
    deliveryType = json['deliveryType'];
    status = json['status'];
    priorityTypeId = json['priority_type_id'];
    statusName = json['statusName'];
    pickupDate = json['pickup_date'];
    deliveryDate = json['delivery_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    parcelDate = json['parcel_date'];
    parcelTime = json['parcel_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tracking_id'] = this.trackingId;
    data['merchant_id'] = this.merchantId;
    data['merchant_name'] = this.merchantName;
    data['merchant_user_name'] = this.merchantUserName;
    data['merchant_user_email'] = this.merchantUserEmail;
    data['merchant_mobile'] = this.merchantMobile;
    data['merchant_address'] = this.merchantAddress;
    data['customer_name'] = this.customerName;
    data['customer_phone'] = this.customerPhone;
    data['customer_address'] = this.customerAddress;
    data['note'] = this.note;
    data['invoice_no'] = this.invoiceNo;
    data['weight'] = this.weight;
    data['total_delivery_amount'] = this.totalDeliveryAmount;
    data['cod_amount'] = this.codAmount;
    data['vat_amount'] = this.vatAmount;
    data['current_payable'] = this.currentPayable;
    data['cash_collection'] = this.cashCollection;
    data['delivery_type_id'] = this.deliveryTypeId;
    data['deliveryType'] = this.deliveryType;
    data['status'] = this.status;
    data['priority_type_id'] = this.priorityTypeId;
    data['statusName'] = this.statusName;
    data['pickup_date'] = this.pickupDate;
    data['delivery_date'] = this.deliveryDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['parcel_date'] = this.parcelDate;
    data['parcel_time'] = this.parcelTime;
    return data;
  }
}
