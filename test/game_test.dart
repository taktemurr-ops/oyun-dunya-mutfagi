import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_dunya_mutfagi/oyun_dunya_mutfagi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(dunyaMutfagiConfig.title.length, 33);
    expect(dunyaMutfagiConfig.tagline.length, 33);
    for (final s in dunyaMutfagiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(dunyaMutfagiConfig.gameId, dunyaMutfagiId);
    expect(dunyaMutfagiRules.gameId, dunyaMutfagiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(dunyaMutfagiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: dunyaMutfagiId, optionalMechanics: dunyaMutfagiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(dunyaMutfagiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
