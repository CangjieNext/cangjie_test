# TC-CJO-PF-fuzz(组: External;执行域: external)

- 用例意图: seed 变异 cjoVersion/长度/偏移/嵌套深度打导入与缓存入口 → 仅出现安全拒绝(专串诊断)、明确诊断或成功导入;绝不 ICE/越界/资源无界消耗;缓存入口只丢弃缓存并完成全量编译
- fixture: 基准:当前 cjc 编译 pkg/(导出 public func depValue(): Int64)得 dep_v010.cjo(cjoVersion=(0,1,0),version=当前 cjc 版本)。变体 fixture:./flatc -t ./CjoFormat.fbs -- ./dep_v010.cjo 转 JSON(flatc 输出 relaxed JSON,键名不带引号;stderr 的 snake_case warning 可忽略)→ 按用例说明修改/删除 cjoVersion(必要时同步改 version 字符串)→ ./flatc -b ./CjoFormat.fbs ./dep_v010.json 得 dep_v010.bin → mv 改名回 dep_v010.cjo → 断言 Verifier 通过(仅版本字段变化不得引入结构错误)。字节定点修改仅作 flatc 不可用时的兜底。工具:cjo_mutate.py 一次性产出全部命名 fixture。缓存形态(增量缓存用例):被测门禁读的是缓存内 <hash>.cjo 的 cjoVersion 三元组(与跨包路径同一矩阵),手术目标即该字段(cjo_mutate.py --patch-cache 对 .cached 内 cjo 做 cjoVersion 手术,flatc/字节兜底同跨包配方)。注意勿混淆两类缓存机制:同目录 .cachedast 的 HashedPackage.version:string 是既有 CANGJIE_VERSION 门禁的字段(DT 设计 FN-05 明示两类机制勿混淆),不属于本特性手术目标。缓存 fixture 由 cjo_mutate.py 在现场编译产出 .cached 后手术;不以源码替换注入(同编译器重编源码版本必然一致,注入空转)。 本场景 seed+变异由 fuzz 治具产出,不进 CI 常规档。
- 判据: cjo_version_check/robustness/perf_fuzz/fuzz_robustness
- 需求追溯: DT 设计补盲#10(fuzz);DT:变异面×三态预言;与 verifier_random_bytes(定点极端输入)衔接

fuzz 治具 runner 规格(External:变异引擎)

seed:合法 CJO(当前 cjc 产出);变异面:
  header(file identifier/magic)、cjoVersion 存在性、三段值(uint8 边界 0/255 邻域)、
  长度、偏移、嵌套深度;同类变异另打缓存入口(LoadCachedTypeForPackage 输入)。
三态预言(每条输入):安全拒绝(专串诊断) | 明确诊断 | 成功导入;
禁态:ICE、越界/段错误、资源无界消耗(超时看门狗);缓存入口变异只允许丢弃缓存并完成全量编译。
注:版本检查不是安全边界、不替代 Verifier(design-spec 非目标)——预期是稳定拒绝/稳定通过,
不是任何输入都安全解析。