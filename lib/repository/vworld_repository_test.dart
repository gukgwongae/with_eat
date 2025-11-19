import 'package:flutter_test/flutter_test.dart';
import 'package:with_eat/repository/vworld_repository.dart';

void main() {
  final vWorldRepository = VworldRepository();
  test('VWorldRepository : findByName', () async {
    final result = await vWorldRepository.findByName('온천동');
    expect(result.length > 0, true);
    expect(result.any((e) => e.contains('온천동')), true);

    final result2 = await vWorldRepository.findByName('asd');
    expect(result2.length, 0);
  });

  test('VWorldRepository : findByLatLng', () async {
    final result = await vWorldRepository.findByLatLng(35.2202216, 129.0823133);
    print(result);
    expect(result.first, '부산광역시 동래구 온천동');

    final result2 = await vWorldRepository.findByLatLng(
      32.2202216,
      129.0823133,
    );
    expect(result2.length, 0);
  });
}
