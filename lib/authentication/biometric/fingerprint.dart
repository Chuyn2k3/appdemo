import "package:local_auth/local_auth.dart";
import "package:shared_preferences/shared_preferences.dart";

class BiometricsFingerprint {
  final LocalAuthentication auth = LocalAuthentication();
  bool isAuthenticated = false;
  bool fingerprintEnabled = false;

  Future<void> checkBiometrics() async {
    bool canCheckBiometrics = await auth.canCheckBiometrics;
    if (canCheckBiometrics) {
      List<BiometricType> availableBiometrics =
          await auth.getAvailableBiometrics();
      if (availableBiometrics.contains(BiometricType.fingerprint)) {
        // setState(() {
        //   isAuthenticated = true;
        // });
      }
    }
  }

  Future<void> authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: "Scan your fingerprint to log in",
        );
    } catch (e) {
      print(e);
    }
    if (authenticated) {
      enableFingerprint();
    } else {
      print('error');
    }
  }

  Future<void> enableFingerprint() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    fingerprintEnabled = await pref.setBool("fingerprintEnabled", true);
  }

  Future<void> checkFingerEnable() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    fingerprintEnabled = pref.getBool("fingerprintEnabled") ?? false;
  }
}
