class AppLoginTerm {
  static const needLoginFirst = 'Cần đăng nhập bằng tài khoản trước';
  static const unavailableBiometrics = 'Thiết bị không hỗ trợ';
  static const emptyFingerPrint = 'Vân tay không tồn tại';
  static const email = "Email";
  static const password = "Mật khẩu";
  static const requireEmail = "Nhập email";
  static const requirePassword = "Nhập mật khẩu";
  static const corectEmail = "Nhập email hợp lệ";
  static const corectPassword = "Mật khẩu phải dài hơn 6 ký tự";
  static const notConnectivityWifi = "Lỗi kết nối mạng";
  static const incorrectEmailAndPassword =
      "Tài khoản hoặc mật khẩu không chính xác";
  static const apiError = "Lỗi đăng nhập";
}

class DialogTitle {
  static const error = 'Error';
  static const warning = 'Warning';
}

class AppLogoutTerm {
  static const logoutError = 'Đăng xuất thất bại';
}

class AppDeviceTerm {
  static const active = "Active"; //Đang Sử Dụng
  static const inactive = "Inactive"; //Ngưng Sử Dụng
  static const wasBroken = "Was_broken"; //Đang Báo Hỏng
  static const corrected = "Corrected"; //Đang Sửa Chữa
  static const liquidated = "Liquidated"; //Đã Thanh Lý
  static const nothanded = "Not_handed"; //Mới
  static const all = "All";
  static const errorData = 'Không tìm thấy thiết bị'; //Tất Cả

  static const List listStatus = [
    all,
    active,
    inactive,
    wasBroken,
    corrected,
    liquidated,
    nothanded,
  ];
}
