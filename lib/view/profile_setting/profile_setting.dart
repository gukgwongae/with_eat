import 'package:flutter/material.dart';
import 'package:with_eat/core/geolocator_helper.dart';
import 'package:with_eat/core/user_session.dart';
import 'package:with_eat/view/home/home_page.dart';
import 'package:with_eat/view/profile_setting/nickname_text_field.dart';

class ProfileSetting extends StatefulWidget {
  const ProfileSetting({super.key});

  @override
  State<ProfileSetting> createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  final _formKey = GlobalKey<FormState>();
  final _nicknameController = TextEditingController();
  CurrentLocation? _currentLocation;
  String? _locationError;
  bool _isFetchingLocation = false;

  @override
  void dispose() {
    _nicknameController.dispose();
    super.dispose();
  }

  Future<void> _fetchCurrentLocation() async {
    setState(() {
      _isFetchingLocation = true;
      _locationError = null;
    });
    final location = await GeolocatorHelper.getCurrentLocation();
    if (!mounted) return;
    if (location == null) {
      setState(() {
        _currentLocation = null;
        _locationError = '현재 위치 정보를 가져오지 못했습니다. 권한을 확인해주세요.';
        _isFetchingLocation = false;
      });
      return;
    }
    setState(() {
      _currentLocation = location;
      _locationError = null;
      _isFetchingLocation = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("프로필 설정하기"), automaticallyImplyLeading: false),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.unfocus();
          }
        },
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 100),
                    Text("프로필 사진"),
                    Icon(Icons.person, size: 90),
                    SizedBox(height: 20),
                    NicknameTextField(controller: _nicknameController),
                    SizedBox(height: 20),
                    TextButton(
                      style: TextButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                      ),
                      onPressed:
                          _isFetchingLocation ? null : _fetchCurrentLocation,
                      child: _isFetchingLocation
                          ? Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(strokeWidth: 2),
                                ),
                                SizedBox(width: 8),
                                Text("현재 위치를 불러오는 중..."),
                              ],
                            )
                          : Text("현재 위치 가져오기"),
                    ),
                    if (_currentLocation != null) ...[
                      SizedBox(height: 8),
                      Text(
                        _currentLocation!.address,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '위도: ${_currentLocation!.latitude.toStringAsFixed(6)}\n경도: ${_currentLocation!.longitude.toStringAsFixed(6)}',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ] else if (_locationError != null) ...[
                      SizedBox(height: 8),
                      Text(
                        _locationError!,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.red),
                      ),
                    ],
                    SizedBox(height: 200),
                    Container(
                      width: double.infinity,
                      height: 50,
                      child: TextButton(
                        onPressed: () async {
                          if (_formKey.currentState?.validate() ?? false) {
                            final nickname = _nicknameController.text.trim();
                            await UserSession.setNickname(nickname);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          }
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text("시작하기"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
