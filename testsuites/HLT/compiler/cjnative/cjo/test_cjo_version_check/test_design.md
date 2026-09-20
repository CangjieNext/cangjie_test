# CJO 版本检查 测试设计(SR.IR20260706000885.010)

> 本文档由 `test_models/lang/model_cjo_version_check` 自动导出(cjpm run,`exportDesignMarkdown`),与套件用例同源生成,**勿手改**;改动请回到模型源码(test_designs/lang/cjo_version_check 判据层 + test_models/lang/model_cjo_version_check 场景层)后重新生成。

- **需求**: SR.IR20260706000885.010(issue #1052,白盒实现 PR !2124)
- **被测对象**: cjc CJO 版本门禁——写侧 `Package.cjoVersion{major,minor,patch}`(CjoFormat.fbs)写入 + 读侧三段校验管线(Verifier → 版本判断 → AST 反序列化)
- **判定规则**(读端 0.1.0): major≠当前或缺失 → 拒绝(error);minor>当前 → 拒绝;minor≤当前(patch 任意)→ 静默通过
- **用例总数**: 38(判据 22 valid + 16 invalid = 38,**1:1 确定性映射**,无重复无遗漏)
- **执行域**: Automated 26 + External 6 + Manual 6
- **落盘布局**: 套件根每用例一目录(`<tcId>/`;External/Manual 保留组目录),工具 `cjo_mutate.py` 在套件根(用例头部 `../cjo_mutate.py` 解析深度对齐 CHIROpt/ArrayLambda `../pick_defination.py` 先例)

## 一、三条加载路径行为分叉(DT 核心维度)

| 加载路径 | 入口 | 不兼容行为 |
|---|---|---|
| 跨包导入 / LoadPackageDepInfo | cjc 编译下游 | 报 error 拒绝(`module_version_not_identical` + 两根诊断串) |
| 增量缓存 LoadCachedTypeForPackage(diagnose=false) | --incremental-compile | **静默丢弃缓存 → 全量重编成功**(无任何版本诊断) |
| CJMP 预加载 PreloadCommonPartOfPackage | --common-part-chir | 同跨包:拒绝,拒绝发生于读取公共部分之前 |

## 二、预言锚(两根诊断串,全部取自 design-spec 实测文案)

| 锚 | 内容 | 用法 |
|---|---|---|
| 版本不匹配 A | `is incompatible: compiled with cjc` | 拒绝场景 scan 正锚 |
| 版本不匹配 B | `but the current compiler is cjc` | 拒绝场景 scan 正锚(成对) |
| Verifier 专串 A | `validation of` | 结构失败场景 scan 正锚(与版本串分别断言) |
| Verifier 专串 B | `failed, please confirm it was created by compiler whose version is` | 同上(成对) |
| 内部版本泄露(禁) | `cjoVersion` | 诊断输出 scan-not(设计:版本号不让用户感知) |
| 缓存版本 error(禁) | `module_version_not_identical\|is incompatible: compiled with cjc` | 缓存路径 stderr scan-not(静默回退) |
| 缓存命中 kind 行 | `no change` | 缓存日志流(cat .cached/*.log \| compare),不作复用场景硬断言 |
| 缓存回退 kind 行 | `rollback` | 缓存日志流(回退场景稳定锚;原因行文案随失效原因变化,禁作主锚) |

**流绑定纪律**: 缓存锚词只住在 `.cached/*.log`,须经 `cat .cached/*.log | compare <规则文件>` 断言(实测命中/回退两路 stderr 静默, 挂 stderr 流必 false-fail);多条 `| compare %f` 从同一用例文件抽取同一 ASSERT 集 (整文件提取不分段),正负断言须拆独立规则文件。

## 三、建模方法(EC + BC + DT)

- **EC**(版本三元组形态等价类): baseline(0,1,0) / minor<cur (0,0,0) / minor>cur (0,2,0) / major≠ (1,0,0)(255,1,0) / 缺失 / patch 任意(0,1,255)
- **BC**(uint8 边界): 三段各取 0/255 压满组合((0,0,255)/(0,255,255)/(255,1,0))
- **DT**(版本形态 × 加载路径判定表): 同一不兼容版本在跨包(拒绝)与缓存(静默回退)**成对 fork 锚**定分叉,如 `reject_missing_version ↔ cache_missing_version`

## 四、fixture 配方(FIXTURE_RECIPE,ST 阶段由 cjo_mutate.py 执行)

基准:当前 cjc 编译 pkg/(导出 public func depValue(): Int64)得 dep_v010.cjo(cjoVersion=(0,1,0),version=当前 cjc 版本)。变体 fixture:./flatc -t ./CjoFormat.fbs -- ./dep_v010.cjo 转 JSON(flatc 输出 relaxed JSON,键名不带引号;stderr 的 snake_case warning 可忽略)→ 按用例说明修改/删除 cjoVersion(必要时同步改 version 字符串)→ ./flatc -b ./CjoFormat.fbs ./dep_v010.json 得 dep_v010.bin → mv 改名回 dep_v010.cjo → 断言 Verifier 通过(仅版本字段变化不得引入结构错误)。字节定点修改仅作 flatc 不可用时的兜底。工具:cjo_mutate.py 一次性产出全部命名 fixture。缓存形态(增量缓存用例):被测门禁读的是缓存内 <hash>.cjo 的 cjoVersion 三元组(与跨包路径同一矩阵),手术目标即该字段(cjo_mutate.py --patch-cache 对 .cached 内 cjo 做 cjoVersion 手术,flatc/字节兜底同跨包配方)。注意勿混淆两类缓存机制:同目录 .cachedast 的 HashedPackage.version:string 是既有 CANGJIE_VERSION 门禁的字段(DT 设计 FN-05 明示两类机制勿混淆),不属于本特性手术目标。缓存 fixture 由 cjo_mutate.py 在现场编译产出 .cached 后手术;不以源码替换注入(同编译器重编源码版本必然一致,注入空转)。

## 五、用例清单(按加载路径组)

### 5.1 跨包导入(ReadCjo:版本矩阵 × Verifier 次序 × 诊断质量 × 组合隔离)

| TC | 执行域 | 用例意图 | fixture | 判据 | 需求追溯 | 步骤 |
|---|---|---|---|---|---|---|
| `TC-CJO-CM-same` | automated | 编译成功、运行 exit 0;scan-not 版本不匹配串且 scan-not validation 串(不过度拒绝的 parity 基准) | 无变体:pkg 由当前 cjc 现场编译,cjoVersion=(0,1,0) 原生未改;其余矩阵用例的命名 fixture(dep_v*.cjo 等)由 cjo_mutate.py 依 FIXTURE_RECIPE 预产出 | `cjo_version_check/import/version_matrix/compat_same` | DFX 隐含基线;DT 设计正常场景 A 用例0(基准);EC:基线类;DT:跨包×静默读取 | 1. pkg 现场编译出 libpkg;2. 下游 import pkg.* 编译(PIPE-0,compare 仅负锚);3. 运行断言 depValue()==42。所有版本变体用例以本用例为 parity 基准 |
| `TC-CJO-CM-older-minor` | automated | 编译成功、运行 exit 0;scan-not 版本不匹配串且 scan-not validation 串(静默=无任何版本诊断,非 warning 继续) | dep_v000.cjo = 基准产物 cjoVersion 改 (0,0,0)(version 保留当前 cjc 版本) | `cjo_version_check/import/version_matrix/compat_older_minor` | DFX#3;DT 设计正常场景 A;EC:minor<cur 类;BC:minor 下界 0;DT:跨包×静默读取 | 1. cjo_mutate.py 产 dep_v000.cjo;2. 下游编译(PIPE-0);3. 断言无版本诊断 + 运行 depValue()==42 |
| `TC-CJO-CM-patch-255` | automated | 编译成功、运行 exit 0;结论与 compat_same 完全一致(证明比较只看 major.minor) | dep_v015.cjo = cjoVersion 改 (0,1,255)(patch 上界;(0,1,0) 即 compat_same) | `cjo_version_check/import/version_matrix/compat_patch` | DFX#4;DT 设计正常场景 A;EC:patch 任意类;BC:patch 上界 255;DT:跨包×静默读取 | 1. cjo_mutate.py 改 cjoVersion=(0,1,255);2. 下游编译(PIPE-0)断言无版本诊断;3. 运行 depValue()==42 |
| `TC-CJO-CM-boundary-00255` | automated | 编译成功、运行 exit 0;minor 下界与 patch 上界同取时判定不受影响 | dep_v00255.cjo = cjoVersion 改 (0,0,255)(minor 下界 × patch 上界) | `cjo_version_check/import/version_matrix/compat_boundary_0_0_255` | DT 设计正常场景 A 边界组合;EC×BC 组合位;DT:跨包×静默读取 | 1. cjo_mutate.py 改 cjoVersion=(0,0,255);2. 下游编译(PIPE-0)断言无版本诊断;3. 运行 depValue()==42 |
| `TC-CJO-CM-rej-major-100` | automated | 编译失败(PIPE-1 退出非零);scan 两根版本不匹配串(含 cjo 路径+包名+双端 cjc 版本);无产物 | dep_v100.cjo = cjoVersion 改 (1,0,0)(结构合法,确保拒绝来自版本判断而非 schema 损坏) | `cjo_version_check/errcheck/version_matrix/reject_major` | DFX#1;DT 设计异常场景;EC:major 异类;DT:跨包×error 拒绝;major 判等语义(非大小比较) | 1. cjo_mutate.py 改 cjoVersion=(1,0,0);2. 下游编译(PIPE-1)断言退出非零+两根诊断串;3. 断言无 %output 产物 |
| `TC-CJO-CM-rej-major-255` | automated | 编译失败;scan 版本不匹配串;与 reject_major 构成 major 轴两点覆盖(下界外第一点+上界) | dep_v255100.cjo = cjoVersion 改 (255,1,0)(major uint8 上界) | `cjo_version_check/errcheck/version_matrix/reject_major_255` | DT 设计补盲#2(uint8 边界);BC:major 上界 255;DT:跨包×error 拒绝 | 1. cjo_mutate.py 改 cjoVersion=(255,1,0);2. 下游编译(PIPE-1)断言退出非零+诊断串 |
| `TC-CJO-CM-rej-minor-020` | automated | 编译失败;scan 版本不匹配串;旧读端不得静默消费新 minor 产物(旧 SDK 只换新 cjo 崩溃问题的拦截位) | dep_v020.cjo = cjoVersion 改 (0,2,0) | `cjo_version_check/errcheck/version_matrix/reject_minor_newer` | DFX#2;DT 设计异常场景;EC:minor>cur 类;DT:跨包×error 拒绝 | 1. cjo_mutate.py 改 cjoVersion=(0,2,0);2. 下游编译(PIPE-1)断言退出非零+诊断串 |
| `TC-CJO-CM-rej-minor-255` | automated | 编译失败;scan 版本不匹配串;与 reject_minor_newer 构成 minor 轴两点覆盖 | dep_v0255255.cjo = cjoVersion 改 (0,255,255)(minor × patch 双上界) | `cjo_version_check/errcheck/version_matrix/reject_minor_255` | DT 设计补盲#2(uint8 边界);BC:minor 上界 255;DT:跨包×error 拒绝 | 1. cjo_mutate.py 改 cjoVersion=(0,255,255);2. 下游编译(PIPE-1)断言退出非零+诊断串 |
| `TC-CJO-CM-rej-missing` | automated | 编译失败;scan 版本不匹配串;缺失版本不等于 (0,0,0)——安全拒绝而非静默放行 | dep_nover.cjo = flatc JSON 往返删除 cjoVersion 字段、保留 version 字符串(Verifier 必须通过;./flatc -t ./CjoFormat.fbs -- ./dep_v010.cjo → 删 cjoVersion → ./flatc -b ./CjoFormat.fbs ./dep_v010.json 得 .bin 后 mv 改名) | `cjo_version_check/errcheck/version_matrix/reject_missing_version` | DT 设计补盲#1(缺失版本);EC:缺失类;DT:跨包×error(与缓存路径行为分叉,见 cache_missing_version) | 1. cjo_mutate.py --delete 删除 cjoVersion;2. 断言 Verifier 通过;3. 下游编译(PIPE-1)断言退出非零+诊断串 |
| `TC-CJO-VP-truncated` | automated | 编译失败;scan validation 专串(validation of ... failed, please confirm...)且 scan-not 版本不匹配串——证明失败发生在 Verifier 层而非版本层 | dep_trunc.cjo = 基准产物截断至 Verifier 恰好失败(可带伪造 cjoVersion) | `cjo_version_check/errcheck/pipeline_order/verifier_truncated` | DT 设计模块间接口1 用例1(补盲#3);DT:跨包×Verifier 拒绝;FN-02 次序:Verifier→版本→AST | 1. 截断基准 cjo 至 Verifier 失败;2. 下游编译(PIPE-1);3. 断言专串诊断出现、版本串不出现(次序甄别) |
| `TC-CJO-VP-bad-ident` | automated | 编译失败;scan validation 专串;伪造的兼容版本字段被无视——版本检查不替代 Verifier(design-spec 非目标) | dep_badident.cjo = file identifier 改为非 CJOF,cjoVersion 伪造成 (0,1,0) | `cjo_version_check/errcheck/pipeline_order/verifier_bad_identifier` | DT 设计模块间接口1 变体(补盲#3);DT:跨包×Verifier 拒绝;版本兼容不能豁免结构校验 | 1. 定点改 identifier 非 CJOF、cjoVersion=(0,1,0);2. 下游编译(PIPE-1);3. 断言专串出现、版本串不出现 |
| `TC-CJO-VP-random-bytes` | automated | 编译失败;scan validation 专串;无 ICE/越界/崩溃(安全拒绝三态之一) | dep_rand.cjo = 等长随机字节替换全文(保留文件名与导入路径) | `cjo_version_check/errcheck/pipeline_order/verifier_random_bytes` | DT 设计补盲#3 极端输入;DT:跨包×Verifier 拒绝;fuzz 设计衔接:仅安全拒绝或成功导入 | 1. 生成等长随机字节文件;2. 下游编译(PIPE-1);3. 断言专串+无崩溃(进程正常退出) |
| `TC-CJO-DQ-provenance` | automated | 编译失败;诊断含 99.99.99(而非当前编译器版本)——证明 compiled with cjc 引用的是产物 version 字段,堵住诊断拼当前版本的实现捷径 | dep_v100_9999.cjo = cjoVersion 改 (1,0,0) 且 version 字符串改 99.99.99 | `cjo_version_check/diagnose/content/diag_provenance` | DT 设计补盲#4(诊断质量);DT:跨包×error×溯源甄别;FN-04 诊断内容规格 | 1. cjo_mutate.py 改 cjoVersion=(1,0,0)+version=99.99.99;2. 下游编译(PIPE-1);3. 断言诊断含 99.99.99 |
| `TC-CJO-DQ-no-cjoVersion` | automated | 编译失败;完整诊断输出 scan-not cjoVersion——设计要求报错使用编译器版本号而非 cjo 格式版本(cjo 版本号不期望让用户感知) | 复用 dep_v020.cjo(reject_minor_newer 同款不兼容 fixture,独立断言点) | `cjo_version_check/diagnose/content/diag_no_internal_version` | DT 设计补盲#4(诊断质量);DT:跨包×error×不泄露;FN-04 注意事项1 | 1. 复用 dep_v020.cjo;2. 下游编译(PIPE-1);3. 对完整 stderr 断言 scan-not cjoVersion |
| `TC-CJO-DQ-terminates` | automated | 编译失败(PIPE-1 退出非零=error 级别)+ %output 不存在;不得以 warning 降级继续编译(拒绝发生在 AST 消费前) | 复用 dep_v020.cjo;追加 (Linux)/(Windows) 双行 EXEC 断言无产物 | `cjo_version_check/diagnose/content/diag_error_terminates` | DT 设计补盲#4(诊断质量);DT:跨包×error×终止性;error vs warning 降级甄别 | 1. 复用 dep_v020.cjo;2. PIPE-1 断言退出非零;3. 无产物断言(Linux test/Windows powershell Test-Path) |
| `TC-CJO-CB-single-bad` | automated | 编译失败;诊断指向 b_v020 的 cjo 路径与包名,不误报 a/c;替换 b 为兼容版本后重编成功(PIPE-0)且运行通过 | a/c 兼容(原生),b_v020.cjo = cjoVersion 改 (0,2,0),b_v010.cjo = 兼容基准(用户替换动作);diag_reject/diag_ok 独立规则文件(两次 compare 是独立进程,各抽各的 ASSERT——同文件承载正负断言会对同一流自相矛盾,先例 DuplicateGenericFuncType01 双规则文件) | `cjo_version_check/combo/deps/combo_single_bad_dep` | DT 设计补盲#5(组合);DT:跨包×多依赖×单点坏;诊断定位精确性+用户替换闭环 | 1. a/c 原生编译,b 改 (0,2,0);2. 三依赖同编(PIPE-1);3. 断言诊断含 b_v020 路径、不含 a/c 误报;4. 换 b_v010 重编(PIPE-0)+运行 |
| `TC-CJO-CB-transitive` | automated | mid 编译即失败(其依赖闭包内含不兼容 dep_bad);诊断出现不兼容依赖标识(粒度以实现为准);传递链上不得静默放过不兼容 cjo | mid 兼容但 import pkg;dep_bad.cjo = pkg 包 cjo 的 cjoVersion 改 (1,0,0) | `cjo_version_check/combo/deps/combo_transitive` | DT 设计补盲#5(组合);DT:跨包×传递依赖×error;FN:传递闭包内校验 | 1. 编译 mid(挂 dep_bad.cjo,PIPE-1);2. 断言诊断出现 dep_bad 标识;3. 驱动体仅备查——链已在 mid 处断,main 不达编译 |
| `TC-CJO-CB-isolation` | automated | 第一次编译拒绝后,同一驱动内 a+c 正常编译运行成功——失败不污染 CjoManager 已加载包/缓存状态,重复加载无累积错误 | b_v100.cjo = (1,0,0);a/c 兼容;main_iso.cj 只导入 a/c(同驱动内第二次编译,EXEC 引用的文件必须列入 DEPENDENCE——框架只拷 case 文件与 DEPENDENCE 项,缺列即 work_dir 缺文件);diag_reject/diag_ok 独立规则文件(两次 compare 各抽各的 ASSERT,先例 DuplicateGenericFuncType01) | `cjo_version_check/combo/deps/combo_isolation` | DT 设计补盲#5(状态隔离);DT:跨包×失败后复用;FN 状态规格:失败状态不得污染 | 1. 先用 b_v100 触发拒绝(PIPE-1);2. 同驱动内 a/c 干净组合再编译(PIPE-0);3. 断言第二次无任何诊断+运行成功 |
| `TC-CJO-BC-legacy-prever` | automated | 设计内拒绝(缺失≠兼容);测试意图盯生态影响:须确认真实存量不存在此形态或提供重编迁移指引,避免生态误伤 | legacy_nover.cjo = 缺失 cjoVersion 字段的旧格式 cjo(与 reject_missing_version 同输入、不同测试意图) | `cjo_version_check/errcheck/version_matrix/compat_legacy_pre_version` | DT 设计补盲#7(向后兼容,预版本化位);EC:缺失;DT:跨包×error(生态视角) | 1. 构造/收集缺失版本形态 cjo;2. 下游编译(PIPE-1)断言拒绝+诊断;3. 生态动作:存量普查或迁移指引确认 |

### 5.2 增量缓存(LoadCachedTypeForPackage:复用 / 回退 / 自愈)

| TC | 执行域 | 用例意图 | fixture | 判据 | 需求追溯 | 步骤 |
|---|---|---|---|---|---|---|
| `TC-CJO-IC-rej-major` | automated | 无错误丢弃缓存退化为全量编译:stderr 无版本 error(scan-not 两串,与跨包路径分叉:同版本跨包=error,缓存=静默);缓存日志含回退 kind 行(rollback);产物与干净全量一致 | cjo_mutate.py --patch-cache 将缓存内 cjo 的 cjoVersion 改为 (1,0,0)(major 异):现场编译建缓存后对 .cached 内 <hash>.cjo 做 cjoVersion 三元组手术(与跨包路径同一矩阵;flatc/字节兜底同跨包配方)。勿混淆:同目录 .cachedast 的 HashedPackage.version:string 是既有 CANGJIE_VERSION 门禁字段,非本特性手术目标。 | `cjo_version_check/errcheck/incr_cache/cache_reject_major` | DFX#5;DT 设计正常场景 B;EC:major 异;DT:增量缓存×静默回退(分叉位) | 1. pkg.old 建缓存;2. patch-cache 改 major 后增量编译(PIPE-0,静默=成功);3. stderr 断言无版本 error+缓存日志断言回退 kind 行+产物 parity |
| `TC-CJO-IC-rej-minor` | automated | 无错误丢弃缓存退化全量;失效只影响本次构建(回退重编自动重导出当前版本缓存,后续构建正常命中——与 selfheal 场景同机制) | cjo_mutate.py --patch-cache 将缓存内 cjo 的 cjoVersion 改为 (0,2,0)(minor>cur):现场编译建缓存后对 .cached 内 <hash>.cjo 做 cjoVersion 三元组手术(与跨包路径同一矩阵;flatc/字节兜底同跨包配方)。勿混淆:同目录 .cachedast 的 HashedPackage.version:string 是既有 CANGJIE_VERSION 门禁字段,非本特性手术目标。 | `cjo_version_check/errcheck/incr_cache/cache_reject_minor` | DFX#6;DT 设计正常场景 B;EC:minor>cur;DT:增量缓存×静默回退 | 1. pkg.old 建缓存;2. patch-cache 改 minor 后增量编译(PIPE-0);3. stderr 断言无版本 error+缓存日志断言回退 kind 行+产物 parity;4. 第三次构建无回退特征(自愈同机制) |
| `TC-CJO-IC-missing` | automated | 无诊断静默失效、全量重编成功;与 reject_missing_version(跨包=error)配对钉住两路径分叉 | cjo_mutate.py --patch-cache 删除缓存内 cjo 的 cjoVersion 字段(Verifier 通过口径):现场编译建缓存后对 .cached 内 <hash>.cjo 做 cjoVersion 三元组手术(与跨包路径同一矩阵;flatc/字节兜底同跨包配方)。勿混淆:同目录 .cachedast 的 HashedPackage.version:string 是既有 CANGJIE_VERSION 门禁字段,非本特性手术目标。 | `cjo_version_check/errcheck/incr_cache/cache_missing_version` | DT 设计补盲#1(缺失版本缓存位);EC:缺失;DT:增量缓存×静默失效(分叉位) | 1. pkg.old 建缓存;2. patch-cache 删版本后增量编译(PIPE-0);3. stderr 断言无任何版本诊断+缓存日志断言回退 kind 行+全量重编成功 |
| `TC-CJO-IC-reuse-compat` | automated | 三档各一轮 patch+增量编译均缓存命中(无版本 error;末轮缓存日志断言无回退 kind 行)、运行成功;版本检查不破坏既有缓存命中(三兼容形态×三轮全过) | cjo_mutate.py --patch-cache (0,1,0)/(0,0,0)/(0,1,255) 三兼容档(DT 设计缓存用例1 参数1):头部三段轮换 patch(0.0.0 → 0.1.255 → 0.1.0),各档后增量编译;末档 0.1.0 为恒等档(与当前版本全等):现场编译建缓存后对 .cached 内 <hash>.cjo 做 cjoVersion 三元组手术(与跨包路径同一矩阵;flatc/字节兜底同跨包配方)。勿混淆:同目录 .cachedast 的 HashedPackage.version:string 是既有 CANGJIE_VERSION 门禁字段,非本特性手术目标。 | `cjo_version_check/verify/incr_cache/cache_reuse_compat` | DFX#5~8 兼容侧;DT 设计正常场景 B 用例1 参数1 三档;EC:三兼容形态;DT:增量缓存×命中 | 1. pkg.old 建缓存;2. 三段轮换 patch(0.0.0/0.1.255/0.1.0)各接增量编译(PIPE-0);3. 每档 stderr 断言无版本 error;4. 末档缓存日志断言无回退 kind 行+运行 |
| `TC-CJO-IC-selfheal` | automated | 回退重建后第三次构建恢复缓存命中(缓存日志无回退 kind 行)、无错误;失效只影响本次构建,不演变为永久全量退化 | cjo_mutate.py --patch-cache 第一段 patch-cache 改 cjoVersion (1,0,0) 触发回退;回退的全量重编自动重导出当前版本缓存(无需再次手术):现场编译建缓存后对 .cached 内 <hash>.cjo 做 cjoVersion 三元组手术(与跨包路径同一矩阵;flatc/字节兜底同跨包配方)。勿混淆:同目录 .cachedast 的 HashedPackage.version:string 是既有 CANGJIE_VERSION 门禁字段,非本特性手术目标。 | `cjo_version_check/verify/incr_cache/cache_selfheal` | DT 设计补盲#6(自愈);DT:增量缓存×回退→恢复;失效不持久化退化 | 1. pkg.old 建缓存;2. patch-cache 触发回退(缓存日志断言回退 kind 行);3. 不再手术直接第三次编译;4. 缓存日志断言无回退 kind 行(恢复命中) |

### 5.3 CJMP 预加载门禁(PreloadCommonPartOfPackage)

| TC | 执行域 | 用例意图 | fixture | 判据 | 需求追溯 | 步骤 |
|---|---|---|---|---|---|---|
| `TC-CJO-CJ-compat` | automated | PreloadCommonPartOfPackage 加载兼容 CJO → 预加载成功并继续后续流程(复用跨包校验路径,无单独适配);scan-not 版本诊断 | c/p 均由当前 cjc 现场编译(公共部分 cjo 为原生 (0,1,0),无变体) | `cjo_version_check/import/cjmp/cjmp_compat` | DFX#9 正向位;DT 设计正常场景 C;DT:CJMP 预加载×静默(复用跨包判定) | 1. 公共部分 chir 导出;2. specific 部分带 --common-part-chir 预加载(PIPE-0);3. 断言无版本诊断+预加载成功 |
| `TC-CJO-CJ-reject` | automated | 预加载失败并报诊断(带版本 error 串);拒绝发生于读取公共部分之前——无部分加载产物;与跨包导入行为一致 | c 的公共部分 cjo 现场编译后由 cjo_mutate.py 将 cjoVersion 改 (0,2,0)(拒绝锚=版本 error 串+无产物;部分加载态甄别以实现日志落库时再校准,不臆测内部标记) | `cjo_version_check/import/cjmp/cjmp_reject` | DFX#9 负向位;DT 设计正常场景 C;DT:CJMP 预加载×error(行为与跨包一致);部分加载状态甄别 | 1. 公共部分 chir 导出后改版本字段;2. specific 部分预加载(PIPE-1);3. 断言版本诊断+无部分加载产物 |

### 5.4 外部/受限场景(存量回归 / 双 SDK / cjpm / LSP / perf / fuzz)

| TC | 执行域 | 用例意图 | fixture | 判据 | 需求追溯 | 步骤 |
|---|---|---|---|---|---|---|
| `TC-CJO-BC-legacy` | external | 存量 cjo 逐个导入当前编译器 → 全部静默通过;若出现拒绝须逐例归因并升级为需求出口确认项(LTS 内 AnnoKind 族 enum 可能已有真实不兼容修改),不得静默放过 | 配方见 §四。 本场景 fixture 为真实存量产物(非 flatc 变体):旧版 SDK 编译产出或存量库拉取。 | `cjo_version_check/import/backward_compat/compat_legacy_0_1` | DT 设计补盲#7(向后兼容,最大现实风险);EC:存量 0.1.0 全体;DT:跨包×静默;需求前提:现存 cjo 均满足向后兼容 | 1. 收集存量 cjo 清单;2. 逐个(或分批)下游编译(PIPE-0);3. 断言全部无版本诊断;4. 任何拒绝单独归因上报 |
| `TC-CJO-BC-cross-version` | external | 新读旧(minor/patch 档)静默通过;旧读新 patch 档可用、minor 档拒绝输出诊断、major 档拒绝;CI 缺省不具备时标注受限场景 | fixture 全部由真实双版本 SDK 产出(非 flatc 变体):patch/minor/major 三档 × 两方向。 | `cjo_version_check/import/backward_compat/compat_cross_version` | DT 设计补盲#7(双向跨版本,受限场景);DT:双向×三档判定表;design-spec 非目标范围的双向兜底验证 | 1. 双 SDK 环境就绪;2. 三档 cjo 双向交叉编译;3. 断言 3×2 判定矩阵位全部符合;4. 无双 SDK 环境时显式标注受限 |
| `TC-CJO-EC-cjpm` | external | bin-dependencies 指向不兼容 cjo → cjpm 构建输出完整版本诊断(无额外协议适配);用户可定位依赖包并重编(需求来源场景的工程入口) | 配方见 §四。 本场景 cjpm 治具工程由 cjo_mutate.py 附带的治具模板生成,bin-dependencies 指向变体 cjo。 | `cjo_version_check/ecosystem/toolchain/eco_cjpm_diag` | DFX#10;DT 设计耦合场景(生态);DT:工程入口×诊断透传;需求来源:旧 SDK 换新 cjo 的用户路径 | 1. cjpm 工程 + 不兼容 bin-dependency;2. cjpm build 断言诊断透传+非零退出;3. 换兼容 cjo 重编成功 |
| `TC-CJO-EC-lsp` | external | 三方库 cjo 版本不匹配 → LSP 报错误提示而非 crash(遗留问题9 的体验改善锚);编译器版本更新后 LSP 清理 AstData 缓存重建,不因残留缓存产生错误结果 | 配方见 §四。 本场景治具为 LSP 工作区 + 三方库不兼容 cjo。 | `cjo_version_check/ecosystem/toolchain/eco_ide_lsp` | DT 设计补盲#10(生态);DT:IDE 入口×不 crash+缓存清理;遗留问题9 改善锚 | 1. LSP 工作区引入不兼容三方 cjo;2. 触发检查断言错误提示+进程存活;3. 升级编译器断言缓存清理重建 |
| `TC-CJO-PF-perf` | external | 多依赖工程 --profile-compile-time 取样——兼容缓存构建无明显版本检查开销;不兼容缓存耗时接近全量构建且无错误诊断(回退耗时上升为预期行为,首次回退后缓存重导出、后续构建恢复命中,不演变为永久回退退化) | 配方见 §四。 本场景不改字段语义,仅性能取样;兼容/不兼容缓存两形态由 cjo_mutate.py 生成。 | `cjo_version_check/robustness/perf_fuzz/perf_negligible` | DT 设计补盲#10(性能);DT:缓存×开销甄别;FN 性能规格:固定读取+常量比较 | 1. 多依赖工程双形态取样;2. 兼容缓存断言无额外开销;3. 不兼容缓存断言接近全量+无诊断+后续构建恢复命中 |
| `TC-CJO-PF-fuzz` | external | seed 变异 cjoVersion/长度/偏移/嵌套深度打导入与缓存入口 → 仅出现安全拒绝(专串诊断)、明确诊断或成功导入;绝不 ICE/越界/资源无界消耗;缓存入口只丢弃缓存并完成全量编译 | 配方见 §四。 本场景 seed+变异由 fuzz 治具产出,不进 CI 常规档。 | `cjo_version_check/robustness/perf_fuzz/fuzz_robustness` | DT 设计补盲#10(fuzz);DT:变异面×三态预言;与 verifier_random_bytes(定点极端输入)衔接 | 1. fuzz 治具跑变异面;2. 断言每条输入落入三态之一;3. 禁态计数为 0;4. 缓存入口断言只丢缓存 |

### 5.5 白盒/人工场景(写侧字段断言 / 分流查询接口)

| TC | 执行域 | 用例意图 | fixture | 判据 | 需求追溯 | 步骤 |
|---|---|---|---|---|---|---|
| `TC-CJO-WR-values` | manual | 普通 CJO 与 ExportASTSignature 缓存 CJO 的 cjoVersion 均为 (0,1,0)、version 为当前 cjc 版本;ASTLoader 读回三元组与写侧逐项一致(写读闭环) | 配方见 §四。 本场景只读产物,不制造变体。 | `cjo_version_check/write_read/write_side/write_read_values` | DT 设计补盲#8(写读闭环);FN-01 写侧规格;特性一半在写侧:SaveCjo/ExportASTSignature 必须写入当前三元组 | 1. 导出两类产物;2. flatc -t ./CjoFormat.fbs 转 JSON 断言写入值;3. ASTLoader 读回断言一致 |
| `TC-CJO-WR-macro-independent` | manual | 启用/禁用 native backend 两配置导出的 CJO 均含版本字段,交叉导入无差异;版本常量定义不再受 native backend 宏控制(DT 设计明确) | 配方见 §四。 本场景变体为构建配置(native backend 宏开/关),非字段篡改。 | `cjo_version_check/write_read/write_side/write_macro_independence` | DT 设计补盲#8(宏无关性);FN-01;版本定义与宏配置解耦回归 | 1. 双宏配置各导出 CJO;2. flatc -t ./CjoFormat.fbs 转 JSON 断言均含版本字段;3. 交叉导入断言无诊断 |
| `TC-CJO-QY-current` | manual | 加载 (0,1,0) 查询 (0,0)/(0,1)/(0,2) —— 对 (0,1) 三接口均 true;对 (0,0) 仅 AtMost;对 (0,2) 三接口均 false;patch 任意改变比较结果不变 | fixture:cjoVersion=(0,1,0) 的最小 CJO——由当前 cjc 编译最小包产出(flatc -t ./CjoFormat.fbs 核验字段),或以最小 JSON 经 ./flatc -b ./CjoFormat.fbs ./min.json 产出 min.bin 后 mv 改名 .cjo 构造,或 UT 内直构 header 缓冲。 | `cjo_version_check/whitebox/version_query/query_current` | DT 设计补盲#9(分流接口);白盒:三接口×三目标+patch 扰动判定表;Exactly 语义锚 | 1. 装载 (0,1,0);2. 3×3 接口矩阵逐项断言;3. patch 扰动断言结果不变 |
| `TC-CJO-QY-older-minor` | manual | 加载 (0,0,255) 查询 (0,1) → AtMost=true、AtLeast/Exactly=false;读侧分流据此选择旧语义分支(design-spec §4.1 分流示例的矩阵位) | fixture:cjoVersion=(0,0,255) 的最小 CJO。 | `cjo_version_check/whitebox/version_query/query_older_minor` | DT 设计补盲#9(分流接口);白盒:镜像位+patch 镜像锚;读侧分流语义 | 1. 装载 (0,0,255);2. 三接口断言;3. 断言分流方向(旧分支选择)语义成立 |
| `TC-CJO-QY-unloaded` | manual | 未加载查询:header 未加载的 loader → HasCjoVersion=false、三元组默认 {0,0,0}、三接口均 false、不崩溃;缺版本时 AtLeast=false 为 §4.1 明文约束(防把未知版本误判为满足要求) | fixture:未加载态 loader 或删除 cjoVersion 的 CJO(同 dep_nover 形态,UT 内直构)。 | `cjo_version_check/whitebox/version_query/query_unloaded` | DT 设计补盲#9(分流接口);白盒:未加载态边界;§4.1 缺版本明文约束锚 | 1. 构造未加载 loader;2. 断言 HasCjoVersion=false+默认三元组;3. 三接口 false+不崩溃 |
| `TC-CJO-QY-cross-major` | manual | requiredMajor=1 → 三接口均 false;跨 major 不满足同一 major 内的版本要求(§4.1 约束),不被误判为可排序版本 | fixture:cjoVersion=(0,1,0) 与 (255,1,0) 各一。 | `cjo_version_check/whitebox/version_query/query_cross_major` | DT 设计补盲#9(分流接口);白盒:跨 major 不可排序语义锚 | 1. 装载两种 major;2. requiredMajor=1 三接口断言 false;3. 确认无排序误判路径 |

## 六、判据索引(↔ test_designs/lang/cjo_version_check 1:1)

### Valid(22)

| 判据 ID | 类别 | 描述 |
|---|---|---|
| `cjo_version_check/import/version_matrix/compat_same` | version_matrix | 当前版本写读基线（DFX 隐含）：当前 cjc 产出 dep.cjo(0,1,0) → 下游 import dep.* 编译运行成功、无版本诊断；作为全部版本变体用例的 parity 基准（防过度拒绝） |
| `cjo_version_check/import/version_matrix/compat_older_minor` | version_matrix | 旧 minor 兼容（DFX#3）：cjoVersion=(0,0,0) 结构合法 → 静默读取，编译成功且无版本诊断（向后兼容承诺位） |
| `cjo_version_check/import/version_matrix/compat_patch` | version_matrix | patch 不参与判定（DFX#4）：cjoVersion=(0,1,255) → 与基准结论一致，编译成功无版本诊断；证明兼容比较只使用 major/minor |
| `cjo_version_check/import/version_matrix/compat_boundary_0_0_255` | version_matrix | 边界组合：cjoVersion=(0,0,255)（minor 下界×patch 上界）→ 静默读取编译成功；钉住 minor 下界与 patch 上界同取时判定不受影响 |
| `cjo_version_check/diagnose/content/diag_provenance` | diagnose_content | 生成端版本溯源（DT 补盲#4）：不兼容 cjo 的 version 字段改为 99.99.99 → 诊断含 99.99.99（非当前编译器版本）；证明 compiled with cjc 引用的是产物 version 字段，堵住诊断拼当前版本的实现捷径 |
| `cjo_version_check/diagnose/content/diag_no_internal_version` | diagnose_content | 诊断不泄露内部版本（DT 补盲#4）：完整诊断输出中 scan-not cjoVersion —— 设计要求 cjo 版本号不让用户感知，报错使用编译器版本号而非 cjo 格式版本 |
| `cjo_version_check/diagnose/content/diag_error_terminates` | diagnose_content | error 级别与终止性（DT 补盲#4）：版本不匹配拒绝 → error 诊断 + 非零退出码 + 无产物；不得以 warning 降级继续编译（拒绝发生在 AST 消费前） |
| `cjo_version_check/verify/incr_cache/cache_reuse_compat` | incr_cache | 兼容缓存复用（DFX#5~8 兼容侧）：三档缓存版本 0.0.0/0.1.255/0.1.0 逐档 patch 后各做一次增量编译，均缓存命中（无回退特征）、无错误，产物与干净全量构建等价；证明版本检查不破坏既有缓存命中 |
| `cjo_version_check/verify/incr_cache/cache_selfheal` | incr_cache | 缓存自愈（DT 补盲#6）：一次静默回退后第三次构建恢复缓存命中（重建缓存为当前 0.1.0，以实现重建时机为准）、无回退特征；失效只影响本次构建，不演变为永久全量退化 |
| `cjo_version_check/import/backward_compat/compat_legacy_0_1` | backward_compat | 存量 cjo 回归（DT 补盲#7）：旧版本 SDK 产出的存量 cjo（0.1.0）逐个导入当前编译器 → 全部静默通过；若拒绝须逐例归因升级需求出口确认（遗留问题2：LTS 内特定 enum 可能已有真实不兼容），不得静默放过 |
| `cjo_version_check/import/backward_compat/compat_cross_version` | backward_compat | 双向跨版本验证（DT 补盲#7，受限场景）：双版本 SDK 专项环境——新读旧（minor/patch 档）静默通过；旧读新 patch 档可用、minor 档拒绝输出诊断、major 档拒绝；CI 缺省不具备时标注受限 |
| `cjo_version_check/write_read/write_side/write_read_values` | write_side | 写侧写入值校验（DT 补盲#8）：普通 CJO 与 ExportASTSignature 缓存 CJO 的 cjoVersion 均为 (0,1,0)、version 为当前 cjc 版本；ASTLoader 读回三元组与写侧逐项一致（写读闭环） |
| `cjo_version_check/write_read/write_side/write_macro_independence` | write_side | 宏配置无关性（DT 补盲#8）：启用/禁用 native backend 两配置导出的 CJO 均含版本字段，交叉导入无差异；版本常量定义不再受 native backend 宏控制 |
| `cjo_version_check/import/cjmp/cjmp_compat` | cjmp | CJMP 兼容预加载（DFX#9）：PreloadCommonPartOfPackage 加载兼容 CJO → 预加载成功并继续后续流程（复用跨包校验路径，无单独适配） |
| `cjo_version_check/ecosystem/toolchain/eco_cjpm_diag` | ecosystem_toolchain | cjpm 依赖分析感知（DFX#10）：bin-dependencies 指向不兼容 cjo → cjpm 构建输出完整版本诊断（无额外协议适配）；用户可定位依赖包并重编（需求来源场景的工程入口） |
| `cjo_version_check/ecosystem/toolchain/eco_ide_lsp` | ecosystem_toolchain | IDE/LSP 行为改善（DT 补盲#10）：三方库 cjo 版本不匹配 → LSP 报错误提示而非 crash（遗留问题9 改善锚）；编译器版本更新后 LSP 清理 AstData 缓存重建，不因残留缓存产生错误结果 |
| `cjo_version_check/robustness/perf_fuzz/perf_negligible` | perf_fuzz | 性能可忽略性（DT 补盲#10）：多依赖工程 --profile-compile-time 取样——兼容缓存构建无明显版本检查开销；不兼容缓存耗时接近全量构建且无错误诊断（回退耗时上升为预期行为，不允许反复误命中旧缓存） |
| `cjo_version_check/robustness/perf_fuzz/fuzz_robustness` | perf_fuzz | fuzz 健壮性（DT 补盲#10）：seed 变异 cjoVersion/长度/偏移/嵌套深度打导入与缓存入口 → 仅出现安全拒绝（专串诊断）、明确诊断或成功导入；绝不 ICE/越界/资源无界消耗；缓存入口只丢弃缓存并完成全量编译；版本检查非安全边界（预期=稳定拒绝/稳定通过，非任何输入安全解析） |
| `cjo_version_check/whitebox/version_query/query_current` | version_query | 当前版本查询（DT 补盲#9）：加载 (0,1,0) 查询 (0,0)/(0,1)/(0,2) —— 对 (0,1) 三接口均 true；对 (0,0) 仅 AtMost；对 (0,2) 三接口均 false；patch 任意改变比较结果不变 |
| `cjo_version_check/whitebox/version_query/query_older_minor` | version_query | 旧 minor 查询（DT 补盲#9）：加载 (0,0,255) 查询 (0,1) → AtMost=true、AtLeast/Exactly=false；读侧分流据此选择旧语义分支（design-spec §4.1 分流示例的矩阵位） |
| `cjo_version_check/whitebox/version_query/query_unloaded` | version_query | 未加载查询（DT 补盲#9）：header 未加载的 loader → HasCjoVersion=false、三元组默认 {0,0,0}、三接口均 false、不崩溃；缺版本时 AtLeast=false 为 §4.1 明文约束（防把未知版本误判为满足要求） |
| `cjo_version_check/whitebox/version_query/query_cross_major` | version_query | 跨 major 查询（DT 补盲#9）：requiredMajor=1 → 三接口均 false；跨 major 不满足同一 major 内的版本要求（§4.1 约束），不被误判为可排序版本 |

### Invalid(16)

| 判据 ID | 类别 | 诊断锚 | 描述 |
|---|---|---|---|
| `cjo_version_check/errcheck/version_matrix/reject_major` | errcheck_version_matrix | `is incompatible: compiled with cjc` | major 不同拒绝（DFX#1）：cjoVersion=(1,0,0) 结构合法 → 拒绝编译；major 仅判等无方向性（当前 major=0 无 current-1 方向，以任意 major≠0 覆盖）；诊断含 cjo 路径、包名、双端 cjc 版本 |
| `cjo_version_check/errcheck/version_matrix/reject_major_255` | errcheck_version_matrix | `is incompatible: compiled with cjc` | major 上界拒绝：cjoVersion=(255,1,0) → 拒绝；uint8 上界 major 不属于任何兼容等价类（与 reject_major 构成 major 轴两点覆盖） |
| `cjo_version_check/errcheck/version_matrix/reject_minor_newer` | errcheck_version_matrix | `is incompatible: compiled with cjc` | minor 更高拒绝（DFX#2）：cjoVersion=(0,2,0) → 拒绝；旧读端不静默消费新 minor 产物（向前不兼容矩阵位，需求来源场景：旧 SDK 只换新 cjo 崩溃问题） |
| `cjo_version_check/errcheck/version_matrix/reject_minor_255` | errcheck_version_matrix | `is incompatible: compiled with cjc` | minor 上界拒绝：cjoVersion=(0,255,255) → 拒绝；uint8 上界 minor 超过当前 1（与 reject_minor_newer 构成 minor 轴两点覆盖） |
| `cjo_version_check/errcheck/version_matrix/reject_missing_version` | errcheck_version_matrix | `is incompatible: compiled with cjc` | 缺失版本拒绝（DT 补盲#1）：JSON 往返删除 cjoVersion 字段（结构合法、保留 version）→ 安全拒绝并输出版本诊断，不静默视为当前版本；缺失 ≠ (0,0,0)，两条路径行为分叉（跨包拒绝/缓存静默失效） |
| `cjo_version_check/errcheck/pipeline_order/verifier_truncated` | errcheck_pipeline_order | `validation of` | 截断拒绝：截断至 Verifier 失败的 CJO（可带伪造版本字段）→ 走 Verifier 失败诊断专串（validation of ... failed, please confirm...），不进入版本判断与 AST 反序列化；证明结构校验先于版本检查 |
| `cjo_version_check/errcheck/pipeline_order/verifier_bad_identifier` | errcheck_pipeline_order | `validation of` | 错误 file identifier 拒绝：identifier 非 CJOF + 伪造兼容版本 (0,1,0) → Verifier 拒绝（专串诊断），伪造的兼容版本字段被无视；版本检查不替代 Verifier |
| `cjo_version_check/errcheck/pipeline_order/verifier_random_bytes` | errcheck_pipeline_order | `validation of` | 随机字节拒绝：等长随机字节 → Verifier 拒绝（专串诊断），无 ICE/越界/崩溃；极端输入入口与 fuzz 设计衔接（fuzz 断言仅安全拒绝或成功导入） |
| `cjo_version_check/combo/deps/combo_single_bad_dep` | combo_deps | `is incompatible: compiled with cjc` | 多依赖单点不兼容（DT 补盲#5）：depA/depB/depC 仅 depB=(0,2,0) → 编译拒绝且诊断指向 depB 路径与包名，不误报其他依赖；替换 depB 为兼容版本后重编成功（指引可执行） |
| `cjo_version_check/combo/deps/combo_transitive` | combo_deps | `is incompatible: compiled with cjc` | 传递依赖门禁（DT 补盲#5）：main→mid→dep 仅 dep 不兼容 → main 编译拒绝，诊断出现传递依赖标识（粒度以实现为准）；传递链上不得静默放过不兼容 cjo |
| `cjo_version_check/combo/deps/combo_isolation` | combo_deps | `is incompatible: compiled with cjc` | 失败状态隔离（DT 补盲#5）：拒绝一次后同构建内正常 CJO 仍可导入——失败不污染 CjoManager 已加载包/缓存状态；重复加载不产生累积错误或崩溃 |
| `cjo_version_check/errcheck/incr_cache/cache_reject_major` | errcheck_incr_cache | `module_version_not_identical|is incompatible: compiled with cjc` | 缓存 major 不兼容静默回退（DFX#5）：缓存 (1,0,0) → 丢弃缓存退化为全量编译；scan-not 两根版本 error 串（与跨包路径行为分叉：同版本跨包=error，缓存=静默）；产物与干净全量一致 |
| `cjo_version_check/errcheck/incr_cache/cache_reject_minor` | errcheck_incr_cache | `module_version_not_identical|is incompatible: compiled with cjc` | 缓存 minor 不兼容静默回退（DFX#6）：缓存 (0,2,0) → 无错误丢弃缓存退化全量；失效只影响本次构建（回退重编重导出当前版本缓存，后续构建正常命中——与缓存自愈同机制） |
| `cjo_version_check/errcheck/incr_cache/cache_missing_version` | errcheck_incr_cache | `module_version_not_identical|is incompatible: compiled with cjc` | 缺失版本缓存静默失效（DT 补盲#1 缓存位）：删除 cjoVersion 的缓存 → 无诊断静默失效、全量重编成功；与 reject_missing_version（跨包=error）配对钉住两路径分叉 |
| `cjo_version_check/errcheck/version_matrix/compat_legacy_pre_version` | errcheck_backward_compat | `is incompatible: compiled with cjc` | 预版本化存量形态：缺失 cjoVersion 的旧格式 cjo → 设计内拒绝（缺失≠兼容）；须确认真实存量不存在此形态或提供重编迁移指引，避免生态误伤（与 reject_missing_version 同输入、不同测试意图：此处盯生态影响） |
| `cjo_version_check/import/cjmp/cjmp_reject` | errcheck_cjmp | `is incompatible: compiled with cjc` | CJMP 不兼容预加载（DFX#9）：PreloadCommonPartOfPackage 加载 major/minor 不兼容 CJO → 读取公共部分前失败并报诊断（带版本 error），不产生部分加载状态；与跨包导入行为一致 |

## 七、ST 阶段待办(用例落库前置)

1. `cjo_mutate.py` 落地(套件根已落契约占位;flatc ./CjoFormat.fbs JSON 往返主路径 + 字节兜底 + --patch-cjo/--set-cache-cjo-version/--clear-cache-cjo-version)
2. 两根诊断串 / 缓存日志 kind 行 / 回退原因行 / CJMP 无产物锚的真实运行校准
3. Windows 侧校准:`.cached` 日志落盘与 `type` 通配行为实测(通过后方可补 `(Windows)` 缓存日志断言行)
4. 24 个命名 cjo fixture(dep_*.cjo / b_v*.cjo / legacy*.cjo)由 cjo_mutate.py 依配方产出
5. External/Manual runner.md 对应治具与 C++ UT 挂载点;双 SDK 专项环境(TC-CJO-BC-cross-version 受限场景)
