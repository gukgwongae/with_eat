import 'package:flutter/material.dart';
import 'package:with_eat/view/profile_setting/profile_setting.dart';

class LoginKakao extends StatelessWidget {
  const LoginKakao({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Container(
          width: 350,
          padding: EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/witheat.png',
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '가치먹자',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'WITH EATH',
                        style: TextStyle(color: Colors.grey[600], fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.amber, size: 22),
                  SizedBox(width: 8),
                  Text(
                    '전체 동의하기',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Text(
                '전체동의는 선택목적에 대한 동의를 포함하고 있으며, 선택목적에 대한 동의를 거부해도 서비스 이용이 가능합니다.',
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
              SizedBox(height: 18),
              Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.amber, size: 18),
                  SizedBox(width: 8),
                  Text(
                    '[필수] 카카오 개인정보 제3자 제공 동의',
                    style: TextStyle(fontSize: 14),
                  ),
                  Spacer(),
                  Text(
                    '보기',
                    style: TextStyle(color: Colors.grey[600], fontSize: 13),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.amber, size: 18),
                  SizedBox(width: 8),
                  Text('[선택] 선택 제공 항목', style: TextStyle(fontSize: 14)),
                  Spacer(),
                  Text(
                    '보기',
                    style: TextStyle(color: Colors.grey[600], fontSize: 13),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _checkText('성별'),
                    _checkText('연령대'),
                    _checkText('전화번호'),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '[선택] 서비스 접근 권한',
                      style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                    ),
                    _checkText('카카오톡 메시지 전송'),
                  ],
                ),
              ),
              SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFE812),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileSetting()),
                    );
                  },
                  child: Text(
                    '동의하고 계속하기',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  '취소',
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _checkText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          Icon(Icons.check, color: Colors.amber, size: 16),
          SizedBox(width: 6),
          Text(text, style: TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}
