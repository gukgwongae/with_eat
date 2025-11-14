class ValidatorUtil {
  static String? validatorId(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return "아이디를 입력해주세요";
    }
    if (value != "sparta") {
      return '존재하지 않는 아이디입니다';
    }
    return null;
  }

  static String? validatorPassword(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return "비밀번호를 입력해주세요";
    }
    if (value!.length < 2) {
      return '비밀번호가 틀렸습니다';
    }
    return null;
  }

  static String? validatorNickname(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return "닉네임을 입력해주세요";
    }
    if (value!.length < 2) {
      return '닉네임은 2글자 이상이여야합니다';
    }
    return null;
  }
}
