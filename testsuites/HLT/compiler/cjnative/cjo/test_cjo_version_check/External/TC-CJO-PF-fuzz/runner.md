# TC-CJO-PF-fuzz(组: External;执行域: external)

- 用例意图: seed 变异 cjoVersion/长度/偏移/嵌套深度打导入与缓存入口 → 仅出现安全拒绝(专串诊断)、明确诊断或成功导入;绝不 ICE/越界/资源无界消耗;缓存入口只丢弃缓存并完成全量编译
- fixture: 配方见套件根 test_design.md §四(运行时现场手术,套件零 .cjo 预存)。 本场景 seed+变异由 fuzz 治具产出,不进 CI 常规档。
- 判据: cjo_version_check/robustness/perf_fuzz/fuzz_robustness
- 需求追溯: DT 设计补盲#10(fuzz);DT:变异面×三态预言;与 verifier_random_bytes(定点极端输入)衔接

fuzz 治具 runner 规格(External:变异引擎)

seed:合法 CJO(当前 cjc 产出);变异面:
  header(file identifier/magic)、cjoVersion 存在性、三段值(uint8 边界 0/255 邻域)、
  长度、偏移、嵌套深度;同类变异另打缓存入口(LoadCachedTypeForPackage 输入)。
三态预言(每条输入):安全拒绝(专串诊断) | 明确诊断 | 成功导入;
禁态:ICE、越界/段错误、资源无界消耗(超时看门狗);缓存入口变异只允许丢弃缓存并完成全量编译。
注:版本检查不是安全边界、不替代 Verifier——预期是稳定拒绝/稳定通过,
不是任何输入都安全解析。