# 🍚 가치먹자 (Gachi-Mukja)

> 위치 기반 맛집 동행 매칭 서비스  
> **“혼자 가기 애매한 순간, 함께 먹을 사람을 찾다!”**

---

## 🚀 프로젝트 소개

**가치먹자**는 사용자가 동네, 여행지 기반으로 함께 식사할 사람을 쉽게 찾을 수 있도록 만든 Flutter 앱입니다.  
맛집을 함께 갈 메이트를 찾고, 채팅으로 약속까지 이어가는 서비스를 제공합니다.

---

## ✨ 주요 기능

- **위치 기반 매칭**: 현재 위치/동네 기준 모집글 탐색  
- **모집글 등록**: 사진 · 가게 정보 · 일정 입력  
- **상세 페이지 + 지도**: 네이버 지도 연동, 가게 위치 확인  
- **실시간 채팅**: Firestore 기반 1:1 채팅  
- **마이페이지**: 프로필 및 정보 수정  

---

## 🎨 앱 디자인 설계

![가치먹자 메인 화면](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdna%2FAOqr7%2FdJMb99LycT3%2FAAAAAAAAAAAAAAAAAAAAAHm7qCIcUOaQPABnGdIrwiPf7fruwrhGQZfCGXTeLQIb%2Fimg.png%3Fcredential%3DyqXZFxpELC7KVnFOS48ylbz2pIh7yKj8%26expires%3D1764514799%26allow_ip%3D%26allow_referer%3D%26signature%3DgM1qsLITKEj8V73sSBcXJyurHYQ%253D)

---

## 👥 역할 분담

- **강준석**  
  - 실시간 채팅 페이지 구현  
  - Firestore 연동 및 채팅 데이터 구조 설계  
  - 현재 위치 기반 모집글 탐색 기능 구현  

- **박한결**  
  - 모집글 상세 페이지 및 네이버 지도 연동  
  - 서비스 로고·발표 자료 제작  
  - 프로젝트 README 작성

- **이장수**  
  - 카카오 로그인 및 인증 흐름 구현  
  - 홈(메인) 화면 구성 및 게시글 리스트 연동  
  - 사용자 데이터와 화면 간 상태 연결  

- **정민지**  
  - 모집글 등록 페이지 및 마이페이지 구현  
  - Figma를 활용한 UI·UX 디자인  
  - 시연 영상 제작

---

## 🛠 기술 스택

- Flutter · MVVM · Riverpod  
- Firebase Authentication / Firestore / Storage  
- geolocator · geocoding · flutter_naver_map  

---

## 📁 폴더 구조

```bash
lib/
├── core/
├── model/
├── repository/
└── view/
    ├── home/
    ├── post_detail/
    ├── add_post_page.dart
    ├── chat_detail/
    ├── my/
    ├── login_kakao/
    ├── profile_setting/
    ├── splash_page.dart
    └── welcome/
