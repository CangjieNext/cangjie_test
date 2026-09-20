# TC-CJO-EC-cjpm(组: External;执行域: external)

- 用例意图: bin-dependencies 指向不兼容 cjo → cjpm 构建输出完整版本诊断(无额外协议适配);用户可定位依赖包并重编(需求来源场景的工程入口)
- fixture: 配方见套件根 test_design.md §四(运行时现场手术,套件零 .cjo 预存)。 本场景治具为 cjpm 工程(bin-dependencies 指向现场手术产出的变体 cjo)。
- 判据: cjo_version_check/ecosystem/toolchain/eco_cjpm_diag
- 需求追溯: DFX#10;DT 设计耦合场景(生态);DT:工程入口×诊断透传;需求来源:旧 SDK 换新 cjo 的用户路径

cjpm 工程级 runner 规格(External:cjpm 治具)

工程:主工程 cjpm.toml [dependencies] bin-dependencies 指向不兼容 cjo(现场编译 pkg 后经 cjo_mutate.py --set-cjo-version 0.2.0 手术产出);
步骤:
  1. cjpm build;
  2. 断言构建输出含完整版本诊断(两根串)、exit 非零;
  3. 用户动作验证:替换依赖为兼容 cjo → cjpm build 成功(需求来源场景的工程入口闭环)。
预言:cjpm 无需协议适配即透传 cjc 诊断;诊断可定位依赖包。