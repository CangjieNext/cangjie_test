# TC-CJO-EC-cjpm(组: External;执行域: external)

- 用例意图: bin-dependencies 指向不兼容 cjo → cjpm 构建输出完整版本诊断(无额外协议适配);用户可定位依赖包并重编(需求来源场景的工程入口)
- fixture: 基准:当前 cjc 编译 pkg/(导出 public func depValue(): Int64)得 dep_v010.cjo(cjoVersion=(0,1,0),version=当前 cjc 版本)。变体 fixture:./flatc -t ./CjoFormat.fbs -- ./dep_v010.cjo 转 JSON(flatc 输出 relaxed JSON,键名不带引号;stderr 的 snake_case warning 可忽略)→ 按用例说明修改/删除 cjoVersion(必要时同步改 version 字符串)→ ./flatc -b ./CjoFormat.fbs ./dep_v010.json 得 dep_v010.bin → mv 改名回 dep_v010.cjo → 断言 Verifier 通过(仅版本字段变化不得引入结构错误)。字节定点修改仅作 flatc 不可用时的兜底。工具:cjo_mutate.py 一次性产出全部命名 fixture。缓存形态(增量缓存用例):被测门禁读的是缓存内 <hash>.cjo 的 cjoVersion 三元组(与跨包路径同一矩阵),手术目标即该字段(cjo_mutate.py --patch-cache 对 .cached 内 cjo 做 cjoVersion 手术,flatc/字节兜底同跨包配方)。注意勿混淆两类缓存机制:同目录 .cachedast 的 HashedPackage.version:string 是既有 CANGJIE_VERSION 门禁的字段(DT 设计 FN-05 明示两类机制勿混淆),不属于本特性手术目标。缓存 fixture 由 cjo_mutate.py 在现场编译产出 .cached 后手术;不以源码替换注入(同编译器重编源码版本必然一致,注入空转)。 本场景 cjpm 治具工程由 cjo_mutate.py 附带的治具模板生成,bin-dependencies 指向变体 cjo。
- 判据: cjo_version_check/ecosystem/toolchain/eco_cjpm_diag
- 需求追溯: DFX#10;DT 设计耦合场景(生态);DT:工程入口×诊断透传;需求来源:旧 SDK 换新 cjo 的用户路径

cjpm 工程级 runner 规格(External:cjpm 治具)

工程:主工程 cjpm.toml [dependencies] bin-dependencies 指向不兼容 cjo(dep_v020.cjo);
步骤:
  1. cjpm build;
  2. 断言构建输出含完整版本诊断(两根串)、exit 非零;
  3. 用户动作验证:替换依赖为兼容 cjo → cjpm build 成功(需求来源场景的工程入口闭环)。
预言:cjpm 无需协议适配即透传 cjc 诊断;诊断可定位依赖包。