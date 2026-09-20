# CJO 版本检查 测试设计(SR.IR20260706000885.010)

> 载体说明:套件根 27 个自动化用例目录 + External(4)+ Manual(6);本文档按《测试设计参考手册》格式组织。配套方法论见 `测试设计分层思路.md`;XMind 版 `cjo_version_check_test_design.xmind` 与本文同构。

- **需求**: SR.IR20260706000885.010(issue #1052,白盒实现 PR !2124)
- **被测对象**: cjc CJO 版本门禁——写侧 `Package.cjoVersion{major,minor,patch}`(CjoFormat.fbs)写入 + 读侧三段校验管线(Verifier → 版本判断 → AST 反序列化)
- **判定规则**(读端 0.1.0): major≠当前或缺失 → 拒绝(error);minor>当前 → 拒绝;minor≤当前(patch 任意)→ 静默通过
- **用例总数**: 37(判据 21 valid + 16 invalid,**1:1 确定性映射**,无重复无遗漏;2026-09-21 去双 SDK:两条双 SDK valid 判据移除、新增 compat_legacy_upstream)
- **执行域**: Automated 27 + External 4 + Manual 6(2026-09-21 起去双 SDK:BC 族并入自动化,External 缩为 cjpm/LSP/perf/fuzz 四组)
- **落盘布局**: 套件根每用例一目录(`<tcId>/`;External/Manual 保留组目录),工具 `cjo_mutate.py` 在套件根(用例头部 `../cjo_mutate.py` 解析深度对齐 CHIROpt/ArrayLambda `../pick_defination.py` 先例)

## 文档修改记录

- 2026-09-17:初版设计判据 22V+16I+模型 38 场景 1:1,wikishare DT 设计修订(schema 文件名纠错+Verifier 专串+FN 分解+补盲清单) --test_designs
- 2026-09-20:HLT 迁移(LLT→compiler/cjnative/cjo)+flatc 权威配方校正+真实执行 26/26 PASS,门禁语义 G1-G12 实测定谳(三次推翻设计前提) --maple_test 实测
- 2026-09-21:去双 SDK(两 External 组删除,新增 BC-legacy-upstream,27/27 PASS);逐用例设计思路详解(§八) --需求裁剪
- 2026-09-21:运行时现场生成(零预存 fixture,gen_fixtures.py 删除,cjo_mutate.py 加字节操作,19 用例批量重构+External/Manual runner.md 同步,27/27 PASS 复验) --自足性改造
- 2026-09-21:按《测试设计参考手册》格式重组本文档;对账修正 4 处矛盾(头部 21V+16I、CM-rej-missing/IC-missing 意图列、判据索引 3 条实测翻转注记) --格式对齐

## 测试对象分析

### 被测对象背景

- **需求规格描述**(SR.IR20260706000885.010,交付范围=写侧+读侧+工具链感知):
  - FN-01 写侧:SaveCjo/ExportASTSignature 必须把当前编译器 cjc 版本写入 Package.cjoVersion{major,minor,patch} 三 uint8 + version 串
  - FN-02 读侧管线:加载 cjo 前依次 Verifier(结构校验)→ 版本判断 → AST 反序列化
  - FN-03 版本判定:读端当前 (0,1,0);major 判等(≠即拒),minor≤cur 接受(patch 不参与),minor>cur 拒绝;兼容=静默,不兼容=error 拒绝
  - FN-04 诊断质量:两根固定串 `is incompatible: compiled with cjc` + `but the current compiler is cjc`;provenance 取产物 version 串;不泄露内部字段名 cjoVersion;error 级终止
  - DFX#1~10:major/minor/patch/older-minor 写入、缓存 major/minor 拒绝、CJMP 预加载、生态感知(cjpm/LSP)、性能/fuzz
  - **规格突破后的行为可接受性**:兼容产物被拒=不可接受(向后兼容承诺,遗留问题2);不兼容产物静默通过=不可接受(需求来源:旧 SDK 只换新 cjo 崩溃);结构坏产物走版本拒绝=不可接受(次序规格)
- **需求背景和应用场景**:用户侧真实故障=旧 SDK 环境只替换新编译器的 cjo 产物→旧 cjc 消费崩溃;IDE 侧=三方库 cjo 版本不匹配致 LSP crash(遗留问题9)。本特性是编译产物的"门禁+溯源"层,核心价值=把隐性的二进制不兼容变成显性的、可定位的编译期错误。

### 被测对象结构和流程

| 加载路径 | 入口 | 不兼容行为 |
|---|---|---|
| 跨包导入 / LoadPackageDepInfo | cjc 编译下游 | 报 error 拒绝(`module_version_not_identical` + 两根诊断串) |
| 增量缓存 LoadCachedTypeForPackage(diagnose=false) | --incremental-compile | **静默丢弃缓存 → 全量重编成功**(无任何版本诊断) |
| CJMP 预加载 PreloadCommonPartOfPackage | --common-part-chir | 同跨包:拒绝,拒绝发生于读取公共部分之前 |

读侧处理流程(所有 cjo 消费共用):**Verifier(结构校验)→ 版本判断(三元组比较)→ AST 反序列化**。次序本身是规格(FN-02):结构坏必须报 Verifier 专串(`validation of ... failed, please confirm...`)而非版本串;反之携带伪造兼容版本的坏结构 cjo 不能靠版本字段蒙混过闸。写侧与读侧共享 CjoFormat.fbs 的 Package.cjoVersion 字段(inline struct 三 uint8,CjoFormat.fbs:651/:689)。

### 对外接口描述

- **写侧**:SaveCjo(普通导出)/ExportASTSignature(增量签名导出)→ CJO 文件含 cjoVersion 三元组+version 字符串
- **读侧门禁**:三条加载路径(跨包导入/增量缓存/CJMP 预加载)在编译期自动生效,无用户显式调用
- **白盒查询接口**(ASTLoader,Manual UT 覆盖):IsCjoVersionAtLeast / IsCjoVersionAtMost / IsCjoVersionExactly(requiredMajor/Minor)——同一 major 内可排序比较,patch 不参与;缺版本时 AtLeast=false(防把未知版本误判为满足要求);跨 major 一律 false(不可排序)
- **生态透传**:cjpm bin-dependencies 构建输出完整 cjc 诊断(无协议适配);LSP 报错误提示而非 crash

### 特性约束条件

- cjoVersion 是 **inline struct,不可缺失**:"缺版本"唯一可实现形态=全零 (0,0,0),且被接受(G5 实测)
- major 是**判等**非大小比较(当前 major=0 无"current-1"方向语义)
- patch **不参与**门禁判定(0 与 255 等价);版本**字符串不参与**判定,只进诊断 provenance(G6 实测)
- 门禁读**兄弟 cjo**(静态库 pkg.a 旁的 pkg.cjo),`.cached/<hash>.cjo` 从不被读(G8 实测);裸 .cjo 不是包源(G1 实测)
- 版本检查**不是安全边界**、不替代 Verifier(design-spec 非目标):预期=稳定拒绝/稳定通过,非任何输入安全解析
- 缓存失效只影响**单次构建**:回退全量重编自动重导出当前版本缓存,不演变为永久退化(G9 实测)

### 平台差异分析

- 判定语义无平台差异(纯字节读取+常量比较);平台差异集中在**断言载体**层:
  - 动态库后缀:Linux libp.so / Windows libp.dll(CJMP 无产物断言按平台条件行双写)
  - 缓存日志读取:`cat`(Linux)/ `powershell Get-Content`(Windows),无引号形态
  - 无产物断言:`test ! -f`(Linux)/ `powershell Test-Path`(Windows)
- 纪律:**平台条件行必须双写**——框架 `(Linux)EXEC` 在默认空条件集下被静默跳过,单平台条件行=另一平台整条断言 no-op(实测教训)
- 等效性结论:判定矩阵类用例(L1)跨平台等效,只在 Windows 侧全量跑;IC/CJ 组缓存与产物断言双平台条件行均在

### 被测对象可信属性分析

#### 可靠可用

- 错误路径可用性:不兼容产物→**可定位的错误诊断**(cjo 路径+包名+双端版本),非 crash、非静默(EC-lsp 承接遗留问题9 改善锚)
- 失败之后可用性:拒绝一次后同构建内正常 CJO 仍可导入,失败不污染 CjoManager 状态(CB-isolation)
- 缓存韧性:失效自愈,无永久回退退化(IC-selfheal/PF-perf)

#### 安全隐私

- 版本检查非安全边界(design-spec 明示);边界由 Verifier 承担:随机字节/截断/坏 identifier 全部走 Verifier 专串稳定拒绝,无 ICE/越界/崩溃(VP 组三态)
- 内部信息不泄露:诊断不含内部字段名 cjoVersion(DQ-no-cjoVersion 负向锚)

#### 韧性

- 增量构建对坏缓存输入=静默回退全量重编(不 crash、不拒绝构建),失效单次性自愈(IC 组+PF-perf 性能锚)

## 测试策略分析

### 测试重点

按"被测机制的作用域"分五层纵切(完整方法论见 `测试设计分层思路.md`):

- **EC**(版本三元组形态等价类): baseline(0,1,0) / minor<cur (0,0,0) / minor>cur (0,2,0) / major≠ (1,0,0)(255,1,0) / 缺失 / patch 任意(0,1,255)
- **BC**(uint8 边界): 三段各取 0/255 压满组合((0,0,255)/(0,255,255)/(255,1,0))
- **DT**(版本形态 × 加载路径判定表): 同一不兼容版本在跨包(拒绝)与缓存(静默回退)**成对 fork 锚**定分叉,如 `reject_missing_version ↔ cache_missing_version`

| 层 | 回答的问题 | 用例组 | 数 |
|---|---|---|---|
| L1 机制层 | 版本矩阵判据边界在哪?拒绝时报什么? | CM | 11 |
| L2 管线层 | 同一判据经增量缓存/CJMP 管线时分叉形态? | IC、CJ | 5+2 |
| L3 组合层 | 多依赖一个坏,整体怎么办?失败是否污染? | CB | 3 |
| L4 生态层 | 老版本产物、包管理器入口,语义一致? | BC、External | 2+4 |
| L5 鲁棒层 | 规格外输入、溯源、终止性符合规格? | VP、DQ | 3+3 |

测试设计方法:EC(等价类:六形态三元组)× BC(uint8 边界 0/255 压满)× DT(判定表:版本形态×加载路径 fork 锚)三法叠加;自动化只钉代表性极端点,全谱变异外移 PF-fuzz。

### 测试难点、风险与策略

1. **设计前提可能就是错的(三次实测推翻)**:缓存门禁读位(.cached 内 cjo 从不被读→兄弟 cjo)、裸 cjo 是否包源(不是)、cjoVersion 可否缺失(inline struct 不可缺失)。策略:**实测定谳先于设计前提**——任何"编译器应该这样"先用最小探针验证再落用例。
2. **断言流绑定**:缓存锚词只住 `.cached/*.log`,挂编译流必假红。策略:一流一断言,正负断言不共流,多段用例每段独立规则文件。
3. **假绿风险**:只断言"编译失败"无法归因(结构损坏也会失败)。策略:拒绝 fixture 携带探针版本串(--set-version-string v100probe),诊断 provenance 与 fixture 内容绑定。
4. **双 SDK 环境不可得**:向后兼容的"旧产物接受侧"改单 SDK 达成——门禁只读三元组,降档三元组对门禁与真实旧产物无异(BC-legacy-upstream)。
5. **框架语义坑**(写用例前置知识):DEPENDENCE 文件扁平拷贝(EXEC 用裸名)、EXEC 引用文件必须列 DEPENDENCE、SEPARATE-FILE 容器纯 ASCII(框架 locale 重开)、平台条件行默认空条件集被静默跳过须双写、read_scans 段泄漏→多段独立规则文件。
6. **风险接受项**:双 SDK"旧读新"侧随需求裁剪移除(读端固定当前编译器,拒绝位与读端新旧无关);LTS 存量真实不兼容(遗留问题2)由 BC-legacy-prever 生态盯防位承接,出现拒绝升级需求出口确认。

## 详细测试用例设计

### 功能测试设计

#### 接口测试(判据级等价类矩阵)

写侧/查询接口/判定规则的接口级矩阵,判据与用例 1:1 映射(工具:flatc -t 往返核验字段;UT 内直构 header 缓冲)。

**Valid 判据(21)**

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

(注:原 `compat_legacy_0_1` 与 `compat_cross_version` 两条双 SDK 判据已随需求裁剪移除 TC,断言价值分别由 CM-older-minor/CM-boundary-00255/CM-patch-255/BC-legacy-upstream(新读旧静默通过)与 CM-rej 族(旧读新拒绝=读端固定当前编译器,拒绝位与读端新旧无关)承接。新增 `compat_legacy_upstream` 判据未及回填本索引——TC-CJO-BC-legacy-upstream,单 SDK 降档 (0,0,0)/(0,0,1) 静默接受+运行正确。)

**Invalid 判据(16)**

| 判据 ID | 类别 | 诊断锚 | 描述 |
|---|---|---|---|
| `cjo_version_check/errcheck/version_matrix/reject_major` | errcheck_version_matrix | `is incompatible: compiled with cjc` | major 不同拒绝（DFX#1）：cjoVersion=(1,0,0) 结构合法 → 拒绝编译；major 仅判等无方向性（当前 major=0 无 current-1 方向，以任意 major≠0 覆盖）；诊断含 cjo 路径、包名、双端 cjc 版本 |
| `cjo_version_check/errcheck/version_matrix/reject_major_255` | errcheck_version_matrix | `is incompatible: compiled with cjc` | major 上界拒绝：cjoVersion=(255,1,0) → 拒绝；uint8 上界 major 不属于任何兼容等价类（与 reject_major 构成 major 轴两点覆盖） |
| `cjo_version_check/errcheck/version_matrix/reject_minor_newer` | errcheck_version_matrix | `is incompatible: compiled with cjc` | minor 更高拒绝（DFX#2）：cjoVersion=(0,2,0) → 拒绝；旧读端不静默消费新 minor 产物（向前不兼容矩阵位，需求来源场景：旧 SDK 只换新 cjo 崩溃问题） |
| `cjo_version_check/errcheck/version_matrix/reject_minor_255` | errcheck_version_matrix | `is incompatible: compiled with cjc` | minor 上界拒绝：cjoVersion=(0,255,255) → 拒绝；uint8 上界 minor 超过当前 1（与 reject_minor_newer 构成 minor 轴两点覆盖） |
| `cjo_version_check/errcheck/version_matrix/reject_missing_version` | errcheck_version_matrix | `is incompatible: compiled with cjc` | 缺失版本形态甄别（DT 补盲#1，实测翻转后语义）：cjoVersion 是 inline struct 不可缺失，(0,0,0) 即"缺失"的唯一可实现形态且被接受（compat 类位）；真实可实现的无溯源形态=不兼容三元组+版本串抹除 → 拒绝且 provenance 落 cjc unknown（诊断锚兼容串）。跨包/增量两条路径判定一致（接受由三元组决定） |
| `cjo_version_check/errcheck/pipeline_order/verifier_truncated` | errcheck_pipeline_order | `validation of` | 截断拒绝：截断至 Verifier 失败的 CJO（可带伪造版本字段）→ 走 Verifier 失败诊断专串（validation of ... failed, please confirm...），不进入版本判断与 AST 反序列化；证明结构校验先于版本检查 |
| `cjo_version_check/errcheck/pipeline_order/verifier_bad_identifier` | errcheck_pipeline_order | `validation of` | 错误 file identifier 拒绝：identifier 非 CJOF + 伪造兼容版本 (0,1,0) → Verifier 拒绝（专串诊断），伪造的兼容版本字段被无视；版本检查不替代 Verifier |
| `cjo_version_check/errcheck/pipeline_order/verifier_random_bytes` | errcheck_pipeline_order | `validation of` | 随机字节拒绝：等长随机字节 → Verifier 拒绝（专串诊断），无 ICE/越界/崩溃；极端输入入口与 fuzz 设计衔接（fuzz 断言仅安全拒绝或成功导入） |
| `cjo_version_check/combo/deps/combo_single_bad_dep` | combo_deps | `is incompatible: compiled with cjc` | 多依赖单点不兼容（DT 补盲#5）：depA/depB/depC 仅 depB=(0,2,0) → 编译拒绝且诊断指向 depB 路径与包名，不误报其他依赖；替换 depB 为兼容版本后重编成功（指引可执行） |
| `cjo_version_check/combo/deps/combo_transitive` | combo_deps | `is incompatible: compiled with cjc` | 传递依赖门禁（DT 补盲#5）：main→mid→dep 仅 dep 不兼容 → main 编译拒绝，诊断出现传递依赖标识（粒度以实现为准）；传递链上不得静默放过不兼容 cjo |
| `cjo_version_check/combo/deps/combo_isolation` | combo_deps | `is incompatible: compiled with cjc` | 失败状态隔离（DT 补盲#5）：拒绝一次后同构建内正常 CJO 仍可导入——失败不污染 CjoManager 已加载包/缓存状态；重复加载不产生累积错误或崩溃 |
| `cjo_version_check/errcheck/incr_cache/cache_reject_major` | errcheck_incr_cache | `module_version_not_identical|is incompatible: compiled with cjc` | 缓存 major 不兼容静默回退（DFX#5）：缓存 (1,0,0) → 丢弃缓存退化为全量编译；scan-not 两根版本 error 串（与跨包路径行为分叉：同版本跨包=error，缓存=静默）；产物与干净全量一致 |
| `cjo_version_check/errcheck/incr_cache/cache_reject_minor` | errcheck_incr_cache | `module_version_not_identical|is incompatible: compiled with cjc` | 缓存 minor 不兼容静默回退（DFX#6）：缓存 (0,2,0) → 无错误丢弃缓存退化全量；失效只影响本次构建（回退重编重导出当前版本缓存，后续构建正常命中——与缓存自愈同机制） |
| `cjo_version_check/errcheck/incr_cache/cache_missing_version` | errcheck_incr_cache | `module_version_not_identical|is incompatible: compiled with cjc` | 无溯源形态增量拒绝（DT 补盲#1 缓存位，实测翻转后语义）：不兼容三元组+版本串抹除的兄弟 cjo → 增量路径同样拒绝（PIPE-1），provenance 落 cjc unknown；与 BC-legacy-prever（兼容三元组+抹串→接受）构成极性对 |
| `cjo_version_check/errcheck/version_matrix/compat_legacy_pre_version` | errcheck_backward_compat | `is incompatible: compiled with cjc` | 预版本化存量形态（实测翻转后语义）：兼容三元组 (0,1,0)+版本串清空 → 接受（判据=三元组非版本串，provenance 落 unknown）；生态盯防：真实存量若出现拒绝须升级需求出口确认，不得静默放过 |
| `cjo_version_check/import/cjmp/cjmp_reject` | errcheck_cjmp | `is incompatible: compiled with cjc` | CJMP 不兼容预加载（DFX#9）：PreloadCommonPartOfPackage 加载 major/minor 不兼容 CJO → 读取公共部分前失败并报诊断（带版本 error），不产生部分加载状态；与跨包导入行为一致 |

#### 功能场景测试(用例清单,按加载路径组)

预言锚(全部实测文案,断言设计的基础):

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

fixture 配方(运行时现场手术,套件不预存任何 .cjo):

全部变体 fixture 均为**运行时现场生成**(2026-09-21 起,套件根零 .cjo 预存):用例内 pkg 包先由当前 cjc 现场编译出兄弟 pkg.cjo(cjoVersion=(0,1,0),version=当前 cjc 版本),随后 `%python cjo_mutate.py --patch-cjo pkg.cjo ...` 对它做版本手术(flatc -t → 改 JSON → flatc -b → mv 权威配方;字节级破坏 --truncate/--corrupt-identifier/--random-fill 走纯字节路径不经 flatc)。编译步本身产出的 pkg.cjo 就是基准 fixture,无 cp 预生成文件。增量缓存用例同理:被测门禁读的是静态库旁的兄弟 cjo(实测定谳:.cached/<hash>.cjo 从不被读,对它手术只会静默 no-change;手术目标=兄弟 cjo)。注意勿混淆两类缓存机制:同目录 .cachedast 的 HashedPackage.version:string 是既有 CANGJIE_VERSION 门禁的字段(DT 设计 FN-05 明示两类机制勿混淆),不属于本特性手术目标。不以源码替换注入(同编译器重编源码版本必然一致,注入空转)。

##### 跨包导入(ReadCjo:版本矩阵 × Verifier 次序 × 诊断质量 × 组合隔离)

| TC | 执行域 | 用例意图 | fixture | 判据 | 需求追溯 | 步骤 |
|---|---|---|---|---|---|---|
| `TC-CJO-CM-same` | automated | 编译成功、运行 exit 0;scan-not 版本不匹配串且 scan-not validation 串(不过度拒绝的 parity 基准) | 无变体:pkg 由当前 cjc 现场编译,cjoVersion=(0,1,0) 原生未改;其余矩阵用例的变体均为现场手术(见 §四) | `cjo_version_check/import/version_matrix/compat_same` | DFX 隐含基线;DT 设计正常场景 A 用例0(基准);EC:基线类;DT:跨包×静默读取 | 1. pkg 现场编译出 libpkg;2. 下游 import pkg.* 编译(PIPE-0,compare 仅负锚);3. 运行断言 depValue()==42。所有版本变体用例以本用例为 parity 基准 |
| `TC-CJO-CM-older-minor` | automated | 编译成功、运行 exit 0;scan-not 版本不匹配串且 scan-not validation 串(静默=无任何版本诊断,非 warning 继续) | 现场手术:pkg.cjo 经 cjo_mutate.py --set-cjo-version 0.0.0(version 保留当前 cjc) | `cjo_version_check/import/version_matrix/compat_older_minor` | DFX#3;DT 设计正常场景 A;EC:minor<cur 类;BC:minor 下界 0;DT:跨包×静默读取 | 1. pkg 现场编译;2. cjo_mutate.py 现场手术 (0,0,0);3. 下游编译(PIPE-0)断言无版本诊断 + 运行 depValue()==42 |
| `TC-CJO-CM-patch-255` | automated | 编译成功、运行 exit 0;结论与 compat_same 完全一致(证明比较只看 major.minor) | 现场手术:pkg.cjo 经 cjo_mutate.py --set-cjo-version 0.1.255(patch 上界;(0,1,0) 即 compat_same) | `cjo_version_check/import/version_matrix/compat_patch` | DFX#4;DT 设计正常场景 A;EC:patch 任意类;BC:patch 上界 255;DT:跨包×静默读取 | 1. cjo_mutate.py 改 cjoVersion=(0,1,255);2. 下游编译(PIPE-0)断言无版本诊断;3. 运行 depValue()==42 |
| `TC-CJO-CM-boundary-00255` | automated | 编译成功、运行 exit 0;minor 下界与 patch 上界同取时判定不受影响 | 现场手术:pkg.cjo 经 cjo_mutate.py --set-cjo-version 0.0.255(minor 下界 × patch 上界) | `cjo_version_check/import/version_matrix/compat_boundary_0_0_255` | DT 设计正常场景 A 边界组合;EC×BC 组合位;DT:跨包×静默读取 | 1. cjo_mutate.py 改 cjoVersion=(0,0,255);2. 下游编译(PIPE-0)断言无版本诊断;3. 运行 depValue()==42 |
| `TC-CJO-CM-rej-major-100` | automated | 编译失败(PIPE-1 退出非零);scan 两根版本不匹配串(含 cjo 路径+包名+双端 cjc 版本);无产物 | 现场手术:pkg.cjo 经 cjo_mutate.py --set-cjo-version 1.0.0 --set-version-string v100probe(结构合法,确保拒绝来自版本判断而非 schema 损坏) | `cjo_version_check/errcheck/version_matrix/reject_major` | DFX#1;DT 设计异常场景;EC:major 异类;DT:跨包×error 拒绝;major 判等语义(非大小比较) | 1. cjo_mutate.py 改 cjoVersion=(1,0,0);2. 下游编译(PIPE-1)断言退出非零+两根诊断串;3. 断言无 %output 产物 |
| `TC-CJO-CM-rej-major-255` | automated | 编译失败;scan 版本不匹配串;与 reject_major 构成 major 轴两点覆盖(下界外第一点+上界) | 现场手术:pkg.cjo 经 cjo_mutate.py --set-cjo-version 255.1.0 --set-version-string v255100probe(major uint8 上界) | `cjo_version_check/errcheck/version_matrix/reject_major_255` | DT 设计补盲#2(uint8 边界);BC:major 上界 255;DT:跨包×error 拒绝 | 1. cjo_mutate.py 改 cjoVersion=(255,1,0);2. 下游编译(PIPE-1)断言退出非零+诊断串 |
| `TC-CJO-CM-rej-minor-020` | automated | 编译失败;scan 版本不匹配串;旧读端不得静默消费新 minor 产物(旧 SDK 只换新 cjo 崩溃问题的拦截位) | 现场手术:pkg.cjo 经 cjo_mutate.py --set-cjo-version 0.2.0 --set-version-string v020probe | `cjo_version_check/errcheck/version_matrix/reject_minor_newer` | DFX#2;DT 设计异常场景;EC:minor>cur 类;DT:跨包×error 拒绝 | 1. cjo_mutate.py 改 cjoVersion=(0,2,0);2. 下游编译(PIPE-1)断言退出非零+诊断串 |
| `TC-CJO-CM-rej-minor-255` | automated | 编译失败;scan 版本不匹配串;与 reject_minor_newer 构成 minor 轴两点覆盖 | 现场手术:pkg.cjo 经 cjo_mutate.py --set-cjo-version 0.255.255 --set-version-string v0255255probe(minor × patch 双上界) | `cjo_version_check/errcheck/version_matrix/reject_minor_255` | DT 设计补盲#2(uint8 边界);BC:minor 上界 255;DT:跨包×error 拒绝 | 1. cjo_mutate.py 改 cjoVersion=(0,255,255);2. 下游编译(PIPE-1)断言退出非零+诊断串 |
| `TC-CJO-CM-rej-missing` | automated | 编译成功、运行 exit 0;(0,0,0) 是"缺失版本"的真实可实现形态(inline struct 不可缺失),被接受——接受与否由三元组决定,与路径无关(跨包位) | 现场手术:pkg.cjo 经 cjo_mutate.py --set-cjo-version 0.0.0(与 CM-older-minor 同输入不同意图:跨包路径镜像位) | `cjo_version_check/errcheck/version_matrix/reject_missing_version` | DT 设计补盲#1(缺失版本);EC:缺失类;DT:跨包×error(与缓存路径行为分叉,见 cache_missing_version) | 1. pkg 现场编译;2. 现场手术 (0,0,0);3. 下游编译(PIPE-0)断言接受+运行(重设计后语义,见修订记录 2026-09-20 条 3) |
| `TC-CJO-VP-truncated` | automated | 编译失败;scan validation 专串(validation of ... failed, please confirm...)且 scan-not 版本不匹配串——证明失败发生在 Verifier 层而非版本层 | 现场手术:pkg.cjo 经 cjo_mutate.py --truncate 500(截断至 500 字节,Verifier 恰好失败;可带可读版本字段——次序测试价值所在) | `cjo_version_check/errcheck/pipeline_order/verifier_truncated` | DT 设计模块间接口1 用例1(补盲#3);DT:跨包×Verifier 拒绝;FN-02 次序:Verifier→版本→AST | 1. pkg 现场编译;2. cjo_mutate.py --truncate 500;3. 下游编译(PIPE-1)断言专串诊断出现、版本串不出现(次序甄别) |
| `TC-CJO-VP-bad-ident` | automated | 编译失败;scan validation 专串;伪造的兼容版本字段被无视——版本检查不替代 Verifier(design-spec 非目标) | 现场手术:pkg.cjo 经 cjo_mutate.py --corrupt-identifier(头 4 字节改 XXXX=identifier 非 CJOF,cjoVersion 保持兼容 (0,1,0)) | `cjo_version_check/errcheck/pipeline_order/verifier_bad_identifier` | DT 设计模块间接口1 变体(补盲#3);DT:跨包×Verifier 拒绝;版本兼容不能豁免结构校验 | 1. pkg 现场编译;2. cjo_mutate.py --corrupt-identifier;3. 下游编译(PIPE-1)断言专串出现、版本串不出现 |
| `TC-CJO-VP-random-bytes` | automated | 编译失败;scan validation 专串;无 ICE/越界/崩溃(安全拒绝三态之一) | 现场手术:pkg.cjo 经 cjo_mutate.py --random-fill 42(固定种子等长随机字节,可复现) | `cjo_version_check/errcheck/pipeline_order/verifier_random_bytes` | DT 设计补盲#3 极端输入;DT:跨包×Verifier 拒绝;fuzz 设计衔接:仅安全拒绝或成功导入 | 1. pkg 现场编译;2. cjo_mutate.py --random-fill 42;3. 下游编译(PIPE-1)断言专串+无崩溃(进程正常退出) |
| `TC-CJO-DQ-provenance` | automated | 编译失败;诊断含 99.99.99(而非当前编译器版本)——证明 compiled with cjc 引用的是产物 version 字段,堵住诊断拼当前版本的实现捷径 | 现场手术:pkg.cjo 经 cjo_mutate.py --set-cjo-version 1.0.0 --set-version-string 99.99.99 | `cjo_version_check/diagnose/content/diag_provenance` | DT 设计补盲#4(诊断质量);DT:跨包×error×溯源甄别;FN-04 诊断内容规格 | 1. pkg 现场编译;2. 现场手术 (1,0,0)+99.99.99;3. 下游编译(PIPE-1)断言诊断含 99.99.99 |
| `TC-CJO-DQ-no-cjoVersion` | automated | 编译失败;完整诊断输出 scan-not cjoVersion——设计要求报错使用编译器版本号而非 cjo 格式版本(cjo 版本号不期望让用户感知) | 现场手术:pkg.cjo 经 cjo_mutate.py --set-cjo-version 0.2.0(与 CM-rej-minor-020 同款不兼容形态,独立断言点) | `cjo_version_check/diagnose/content/diag_no_internal_version` | DT 设计补盲#4(诊断质量);DT:跨包×error×不泄露;FN-04 注意事项1 | 1. pkg 现场编译;2. 现场手术 (0,2,0);3. 下游编译(PIPE-1)对完整 stderr 断言 scan-not cjoVersion |
| `TC-CJO-DQ-terminates` | automated | 编译失败(PIPE-1 退出非零=error 级别)+ %output 不存在;不得以 warning 降级继续编译(拒绝发生在 AST 消费前) | 现场手术:pkg.cjo 经 cjo_mutate.py --set-cjo-version 0.2.0;追加 (Linux)/(Windows) 双行 EXEC 断言无产物 | `cjo_version_check/diagnose/content/diag_error_terminates` | DT 设计补盲#4(诊断质量);DT:跨包×error×终止性;error vs warning 降级甄别 | 1. pkg 现场编译;2. 现场手术 (0,2,0);3. PIPE-1 断言退出非零;4. 无产物断言(Linux test/Windows powershell Test-Path) |
| `TC-CJO-CB-single-bad` | automated | 编译失败;诊断指向坏档 b.cjo 的路径与包名,不误报 a/c;b 手术回兼容版本后重编成功(PIPE-0)且运行通过 | a/c 兼容(原生);b 现场手术:b.cjo 先 --set-cjo-version 0.2.0(坏档),恢复轮再 --set-cjo-version 0.1.0(用户替换动作的现场化);diag_reject/diag_ok 独立规则文件(两次 compare 是独立进程,各抽各的 ASSERT——同文件承载正负断言会对同一流自相矛盾,先例 DuplicateGenericFuncType01 双规则文件) | `cjo_version_check/combo/deps/combo_single_bad_dep` | DT 设计补盲#5(组合);DT:跨包×多依赖×单点坏;诊断定位精确性+用户替换闭环 | 1. a/b/c 现场编译,b 手术 (0,2,0);2. 三依赖同编(PIPE-1);3. 断言诊断含 b.cjo 路径、不含 a/c 误报;4. b 手术回 (0,1,0) 重编(PIPE-0)+运行 |
| `TC-CJO-CB-transitive` | automated | mid 编译即失败(其依赖闭包内含不兼容 dep_bad);诊断出现不兼容依赖标识(粒度以实现为准);传递链上不得静默放过不兼容 cjo | mid 兼容但 import pkg;现场手术:pkg.cjo 经 cjo_mutate.py --set-cjo-version 1.0.0 | `cjo_version_check/combo/deps/combo_transitive` | DT 设计补盲#5(组合);DT:跨包×传递依赖×error;FN:传递闭包内校验 | 1. pkg 现场编译后手术 (1,0,0);2. mid 编译(PIPE-1)断言诊断含 pkg.cjo 路径+专串;3. 驱动体仅备查——链已在 mid 处断,main 不达编译 |
| `TC-CJO-CB-isolation` | automated | 第一次编译拒绝后,同一驱动内 a+c 正常编译运行成功——失败不污染 CjoManager 已加载包/缓存状态,重复加载无累积错误 | b 现场手术 (1,0,0) 触发拒绝、再手术回 (0,1,0) 恢复;a/c 兼容;main_iso.cj 只导入 a/c(同驱动内第二次编译,EXEC 引用的文件必须列入 DEPENDENCE——框架只拷 case 文件与 DEPENDENCE 项,缺列即 work_dir 缺文件);diag_reject/diag_ok 独立规则文件(两次 compare 各抽各的 ASSERT,先例 DuplicateGenericFuncType01) | `cjo_version_check/combo/deps/combo_isolation` | DT 设计补盲#5(状态隔离);DT:跨包×失败后复用;FN 状态规格:失败状态不得污染 | 1. b 手术 (1,0,0) 触发拒绝(PIPE-1);2. b 手术回 (0,1,0) 后同驱动内 a/c 干净组合再编译(PIPE-0);3. 断言第二次无任何诊断+运行成功 |
| `TC-CJO-BC-legacy-prever` | automated | 版本串缺失→溯源 unknown 但接受(判据=三元组非版本串);测试意图盯生态影响:真实存量若出现拒绝须升级需求出口确认项,不得静默放过 | 现场手术:pkg.cjo 经 cjo_mutate.py --clear-version-string(兼容三元组 (0,1,0) 保留、版本串清空→溯源 unknown;探针 G6:接受与否由三元组决定) | `cjo_version_check/errcheck/version_matrix/compat_legacy_pre_version` | DT 设计补盲#7(向后兼容,预版本化位);EC:缺失;DT:跨包×error(生态视角) | 1. pkg 现场编译;2. --clear-version-string 手术;3. 下游编译(PIPE-0)断言接受+运行(重设计后语义);4. 生态动作:存量普查或迁移指引确认 |

##### 增量缓存(LoadCachedTypeForPackage:复用 / 回退 / 自愈)

| TC | 执行域 | 用例意图 | fixture | 判据 | 需求追溯 | 步骤 |
|---|---|---|---|---|---|---|
| `TC-CJO-IC-rej-major` | automated | 兄弟 cjo 版本不匹配 → 增量构建被拒(PIPE-1)+ module_version_not_identical;错误被丢弃回退全量:缓存日志含回退 kind 行(frontend error detected, roll back to full compilation);恢复后缓存不受污染 | cjo_mutate.py --patch-cjo pkg.cjo --set-cjo-version 1.0.0 对兄弟 cjo 做 cjoVersion 三元组手术(实测定谳:.cached/<hash>.cjo 从不被读,门禁读静态库旁的兄弟 cjo;缓存手术只会静默 no-change,禁用——cjo_mutate.py --patch-cache 已改为显式报错)。勿混淆:同目录 .cachedast 的 HashedPackage.version:string 是既有 CANGJIE_VERSION 门禁字段,非本特性手术目标。 | `cjo_version_check/errcheck/incr_cache/cache_reject_major` | DFX#5;DT 设计正常场景 B;EC:major 异;DT:增量缓存×静默回退(分叉位) | 1. pkg.old 建缓存;2. 兄弟 cjo 手术改 major 后增量编译(PIPE-1,拒绝);3. stderr 断言无版本 error+缓存日志断言回退 kind 行+产物 parity |
| `TC-CJO-IC-rej-minor` | automated | 兄弟 cjo minor 不匹配 → 增量构建被拒(PIPE-1);失效只影响本次构建(回退重编自动重导出当前版本缓存,后续构建正常命中——与 selfheal 场景同机制) | cjo_mutate.py --patch-cjo pkg.cjo --set-cjo-version 0.2.0 对兄弟 cjo 做 cjoVersion 三元组手术(实测定谳:.cached 内 cjo 不被读)(与跨包路径同一矩阵;flatc/字节兜底同跨包配方)。勿混淆:同目录 .cachedast 的 HashedPackage.version:string 是既有 CANGJIE_VERSION 门禁字段,非本特性手术目标。 | `cjo_version_check/errcheck/incr_cache/cache_reject_minor` | DFX#6;DT 设计正常场景 B;EC:minor>cur;DT:增量缓存×静默回退 | 1. pkg.old 建缓存;2. 兄弟 cjo 手术改 minor 后增量编译(PIPE-1,拒绝);3. stderr 断言无版本 error+缓存日志断言回退 kind 行+产物 parity;4. 第三次构建无回退特征(自愈同机制) |
| `TC-CJO-IC-missing` | automated | 不兼容三元组+版本串抹除(无溯源形态)→ 增量路径同样拒绝,provenance 落 cjc unknown——版本检查对无溯源产物同样生效;与 BC-legacy-prever(抹串但三元组兼容→接受)构成极性对 | 现场手术:pkg.cjo 经 cjo_mutate.py --set-cjo-version 0.2.0 --clear-version-string((0,2,0)+版本串抹除→拒绝且 provenance 落 cjc unknown 形态)。勿混淆:同目录 .cachedast 的 HashedPackage.version:string 是既有 CANGJIE_VERSION 门禁字段,非本特性手术目标。 | `cjo_version_check/errcheck/incr_cache/cache_missing_version` | DT 设计补盲#1(缺失版本缓存位);EC:缺失;DT:增量缓存×静默失效(分叉位) | 1. pkg.old 建缓存;2. 兄弟 cjo 手术 (0,2,0)+抹版本串后增量编译(PIPE-1,拒绝);3. stderr 断言版本串+cjc unknown 锚+缓存日志断言回退 kind 行 |
| `TC-CJO-IC-reuse-compat` | automated | 三档各一轮 patch+增量编译均缓存命中(无版本 error;末轮缓存日志断言无回退 kind 行)、运行成功;版本检查不破坏既有缓存命中(三兼容形态×三轮全过) | cjo_mutate.py --patch-cjo pkg.cjo 三档轮换 (0,0,0)/(0,1,255)/(0,1,0)(兄弟 cjo 手术;缓存命中维持):现场编译建缓存后对兄弟 pkg.cjo 做 cjoVersion 三元组手术(与跨包路径同一矩阵;flatc/字节兜底同跨包配方)。勿混淆:同目录 .cachedast 的 HashedPackage.version:string 是既有 CANGJIE_VERSION 门禁字段,非本特性手术目标。 | `cjo_version_check/verify/incr_cache/cache_reuse_compat` | DFX#5~8 兼容侧;DT 设计正常场景 B 用例1 参数1 三档;EC:三兼容形态;DT:增量缓存×命中 | 1. pkg.old 建缓存;2. 三段轮换 patch(0.0.0/0.1.255/0.1.0)各接增量编译(PIPE-0);3. 每档 stderr 断言无版本 error;4. 末档缓存日志断言无回退 kind 行+运行 |
| `TC-CJO-IC-selfheal` | automated | 回退重建后第三次构建恢复缓存命中(缓存日志无回退 kind 行)、无错误;失效只影响本次构建,不演变为永久全量退化 | cjo_mutate.py --patch-cjo pkg.cjo --set-cjo-version 1.0.0 第一段对兄弟 cjo 手术触发回退;回退的全量重编自动重导出当前版本缓存(无需再次手术):现场编译建缓存后,恢复兄弟 cjo 兼容版本(实测定谳:.cached 内 cjo(与跨包路径同一矩阵;flatc/字节兜底同跨包配方)。勿混淆:同目录 .cachedast 的 HashedPackage.version:string 是既有 CANGJIE_VERSION 门禁字段,非本特性手术目标。 | `cjo_version_check/verify/incr_cache/cache_selfheal` | DT 设计补盲#6(自愈);DT:增量缓存×回退→恢复;失效不持久化退化 | 1. pkg.old 建缓存;2. 兄弟 cjo 手术 (1,0,0) 触发回退(PIPE-1;缓存日志断言回退 kind 行);3. 不再手术直接第三次编译;4. 缓存日志断言无回退 kind 行(恢复命中) |

##### CJMP 预加载门禁(PreloadCommonPartOfPackage)

| TC | 执行域 | 用例意图 | fixture | 判据 | 需求追溯 | 步骤 |
|---|---|---|---|---|---|---|
| `TC-CJO-CJ-compat` | automated | PreloadCommonPartOfPackage 加载兼容 CJO → 预加载成功并继续后续流程(复用跨包校验路径,无单独适配);scan-not 版本诊断 | c/p 均由当前 cjc 现场编译(公共部分 cjo 为原生 (0,1,0),无变体) | `cjo_version_check/import/cjmp/cjmp_compat` | DFX#9 正向位;DT 设计正常场景 C;DT:CJMP 预加载×静默(复用跨包判定) | 1. 公共部分 chir 导出;2. specific 部分带 --common-part-chir 预加载(PIPE-0);3. 断言无版本诊断+预加载成功 |
| `TC-CJO-CJ-reject` | automated | 预加载失败并报诊断(带版本 error 串);拒绝发生于读取公共部分之前——无部分加载产物;与跨包导入行为一致 | c 的公共部分 cjo 现场编译后由 cjo_mutate.py 将 cjoVersion 改 (0,2,0)(拒绝锚=版本 error 串+无产物;部分加载态甄别以实现日志落库时再校准,不臆测内部标记) | `cjo_version_check/import/cjmp/cjmp_reject` | DFX#9 负向位;DT 设计正常场景 C;DT:CJMP 预加载×error(行为与跨包一致);部分加载状态甄别 | 1. 公共部分 chir 导出后改版本字段;2. specific 部分预加载(PIPE-1);3. 断言版本诊断+无部分加载产物 |

##### 向后兼容(单 SDK 上游降档)与外部场景(cjpm / LSP / perf / fuzz)

| TC | 执行域 | 用例意图 | fixture | 判据 | 需求追溯 | 步骤 |
|---|---|---|---|---|---|---|
| `TC-CJO-BC-legacy-upstream` | automated | 单 SDK 向后兼容轮:当前 cjc 编译的上游包,兄弟 cjo 三元组被 cjo_mutate.py 现场降档为 (0,0,0)(预版本化全零形态)与 (0,0,1)(最旧 minor/patch 形态)→ 一次同编静默通过(PIPE-0 无版本诊断无 verifier 诊断)+ 运行正确——门禁只读三元组,降档三元组对门禁而言与真实旧编译器产物无异,无需双 SDK 环境即可钉住兼容承诺的接受侧 | pkg_l1/pkg_l2 由当前 cjc 现场编译;l1_mut/l2_mut = 编译产物拷贝经 cjo_mutate.py --set-cjo-version 0.0.0 / 0.0.1 后回填兄弟位(手术在拷贝上做,保持产物原样);diag_ok.txt 独立规则文件(负断言专用) | `cjo_version_check/import/backward_compat/compat_legacy_upstream` | DT 设计补盲#7(向后兼容);替代 External/TC-CJO-BC-legacy(双 SDK);探针 G5:(0,0,0) 是可实现的"缺失版本"且被接受 | 1. pkg_l1/pkg_l2 现场编译;2. 拷贝产物经 cjo_mutate.py 降档 (0,0,0)/(0,0,1) 回填兄弟 cjo;3. 下游一次同编(PIPE-0,diag_ok 负锚);4. 运行 l1Value+l2Value==30 |
| `TC-CJO-EC-cjpm` | external | bin-dependencies 指向不兼容 cjo → cjpm 构建输出完整版本诊断(无额外协议适配);用户可定位依赖包并重编(需求来源场景的工程入口) | 配方见 §四。 本场景 cjpm 治具工程由 cjo_mutate.py 附带的治具模板生成,bin-dependencies 指向变体 cjo。 | `cjo_version_check/ecosystem/toolchain/eco_cjpm_diag` | DFX#10;DT 设计耦合场景(生态);DT:工程入口×诊断透传;需求来源:旧 SDK 换新 cjo 的用户路径 | 1. cjpm 工程 + 不兼容 bin-dependency;2. cjpm build 断言诊断透传+非零退出;3. 换兼容 cjo 重编成功 |
| `TC-CJO-EC-lsp` | external | 三方库 cjo 版本不匹配 → LSP 报错误提示而非 crash(遗留问题9 的体验改善锚);编译器版本更新后 LSP 清理 AstData 缓存重建,不因残留缓存产生错误结果 | 配方见 §四。 本场景治具为 LSP 工作区 + 三方库不兼容 cjo。 | `cjo_version_check/ecosystem/toolchain/eco_ide_lsp` | DT 设计补盲#10(生态);DT:IDE 入口×不 crash+缓存清理;遗留问题9 改善锚 | 1. LSP 工作区引入不兼容三方 cjo;2. 触发检查断言错误提示+进程存活;3. 升级编译器断言缓存清理重建 |
| `TC-CJO-PF-perf` | external | 多依赖工程 --profile-compile-time 取样——兼容缓存构建无明显版本检查开销;不兼容缓存耗时接近全量构建且无错误诊断(回退耗时上升为预期行为,首次回退后缓存重导出、后续构建恢复命中,不演变为永久回退退化) | 配方见 §四。 本场景不改字段语义,仅性能取样;兼容/不兼容缓存两形态由 cjo_mutate.py 生成。 | `cjo_version_check/robustness/perf_fuzz/perf_negligible` | DT 设计补盲#10(性能);DT:缓存×开销甄别;FN 性能规格:固定读取+常量比较 | 1. 多依赖工程双形态取样;2. 兼容缓存断言无额外开销;3. 不兼容缓存断言接近全量+无诊断+后续构建恢复命中 |
| `TC-CJO-PF-fuzz` | external | seed 变异 cjoVersion/长度/偏移/嵌套深度打导入与缓存入口 → 仅出现安全拒绝(专串诊断)、明确诊断或成功导入;绝不 ICE/越界/资源无界消耗;缓存入口只丢弃缓存并完成全量编译 | 配方见 §四。 本场景 seed+变异由 fuzz 治具产出,不进 CI 常规档。 | `cjo_version_check/robustness/perf_fuzz/fuzz_robustness` | DT 设计补盲#10(fuzz);DT:变异面×三态预言;与 verifier_random_bytes(定点极端输入)衔接 | 1. fuzz 治具跑变异面;2. 断言每条输入落入三态之一;3. 禁态计数为 0;4. 缓存入口断言只丢缓存 |

##### 白盒/人工场景(写侧字段断言 / 分流查询接口)

| TC | 执行域 | 用例意图 | fixture | 判据 | 需求追溯 | 步骤 |
|---|---|---|---|---|---|---|
| `TC-CJO-WR-values` | manual | 普通 CJO 与 ExportASTSignature 缓存 CJO 的 cjoVersion 均为 (0,1,0)、version 为当前 cjc 版本;ASTLoader 读回三元组与写侧逐项一致(写读闭环) | 配方见 §四。 本场景只读产物,不制造变体。 | `cjo_version_check/write_read/write_side/write_read_values` | DT 设计补盲#8(写读闭环);FN-01 写侧规格;特性一半在写侧:SaveCjo/ExportASTSignature 必须写入当前三元组 | 1. 导出两类产物;2. flatc -t ./CjoFormat.fbs 转 JSON 断言写入值;3. ASTLoader 读回断言一致 |
| `TC-CJO-WR-macro-independent` | manual | 启用/禁用 native backend 两配置导出的 CJO 均含版本字段,交叉导入无差异;版本常量定义不再受 native backend 宏控制(DT 设计明确) | 配方见 §四。 本场景变体为构建配置(native backend 宏开/关),非字段篡改。 | `cjo_version_check/write_read/write_side/write_macro_independence` | DT 设计补盲#8(宏无关性);FN-01;版本定义与宏配置解耦回归 | 1. 双宏配置各导出 CJO;2. flatc -t ./CjoFormat.fbs 转 JSON 断言均含版本字段;3. 交叉导入断言无诊断 |
| `TC-CJO-QY-current` | manual | 加载 (0,1,0) 查询 (0,0)/(0,1)/(0,2) —— 对 (0,1) 三接口均 true;对 (0,0) 仅 AtMost;对 (0,2) 三接口均 false;patch 任意改变比较结果不变 | fixture:cjoVersion=(0,1,0) 的最小 CJO——由当前 cjc 编译最小包产出(flatc -t ./CjoFormat.fbs 核验字段),或以最小 JSON 经 ./flatc -b ./CjoFormat.fbs ./min.json 产出 min.bin 后 mv 改名 .cjo 构造,或 UT 内直构 header 缓冲。 | `cjo_version_check/whitebox/version_query/query_current` | DT 设计补盲#9(分流接口);白盒:三接口×三目标+patch 扰动判定表;Exactly 语义锚 | 1. 装载 (0,1,0);2. 3×3 接口矩阵逐项断言;3. patch 扰动断言结果不变 |
| `TC-CJO-QY-older-minor` | manual | 加载 (0,0,255) 查询 (0,1) → AtMost=true、AtLeast/Exactly=false;读侧分流据此选择旧语义分支(design-spec §4.1 分流示例的矩阵位) | fixture:cjoVersion=(0,0,255) 的最小 CJO。 | `cjo_version_check/whitebox/version_query/query_older_minor` | DT 设计补盲#9(分流接口);白盒:镜像位+patch 镜像锚;读侧分流语义 | 1. 装载 (0,0,255);2. 三接口断言;3. 断言分流方向(旧分支选择)语义成立 |
| `TC-CJO-QY-unloaded` | manual | 未加载查询:header 未加载的 loader → HasCjoVersion=false、三元组默认 {0,0,0}、三接口均 false、不崩溃;缺版本时 AtLeast=false 为 §4.1 明文约束(防把未知版本误判为满足要求) | fixture:未加载态 loader(UT 内直构,不依赖 cjo 文件——单测边界)。 | `cjo_version_check/whitebox/version_query/query_unloaded` | DT 设计补盲#9(分流接口);白盒:未加载态边界;§4.1 缺版本明文约束锚 | 1. 构造未加载 loader;2. 断言 HasCjoVersion=false+默认三元组;3. 三接口 false+不崩溃 |
| `TC-CJO-QY-cross-major` | manual | requiredMajor=1 → 三接口均 false;跨 major 不满足同一 major 内的版本要求(§4.1 约束),不被误判为可排序版本 | fixture:cjoVersion=(0,1,0) 与 (255,1,0) 各一。 | `cjo_version_check/whitebox/version_query/query_cross_major` | DT 设计补盲#9(分流接口);白盒:跨 major 不可排序语义锚 | 1. 装载两种 major;2. requiredMajor=1 三接口断言 false;3. 确认无排序误判路径 |

### 特性耦合分析测试

- **依赖闭包耦合**:多依赖单点坏(CB-single-bad:点名坏依赖不误报)、传递依赖(CB-transitive:闭包每一跳生效)、状态隔离(CB-isolation:失败不污染 CjoManager)
- **工具链耦合**:cjpm bin-dependencies 诊断透传(EC-cjpm)、LSP AstData 缓存随编译器版本清理重建(EC-lsp)
- **缓存机制耦合(易混淆点)**:同目录 .cachedast 的 HashedPackage.version:string 是既有 CANGJIE_VERSION 门禁字段(DT 设计 FN-05 明示两类机制勿混淆),不属于本特性手术目标

### 可靠/可用性测试

- DQ-terminates(error 终止性:非零退出+无产物,不降级 warning 继续编译)
- IC-selfheal(失效自愈:回退→重导出→第三次构建恢复命中,不演变为永久全量退化)
- EC-lsp(IDE 进程存活:不匹配→错误提示而非 crash)

### 安全/隐私性测试

- VP 组三态:截断/坏 identifier/随机字节 → Verifier 专串稳定拒绝,无 ICE/越界/崩溃(进程正常退出)
- PF-fuzz(External):seed 变异全谱(版本字段/长度/偏移/嵌套深度)→ 三态预言,禁态计数 0;缓存入口只丢缓存
- DQ-no-cjoVersion:诊断不泄露内部字段名(用户不感知 cjo 格式版本)

### 韧性测试

- IC-rej-major/IC-rej-minor:坏缓存输入 → 静默回退全量重编(构建不失败,stderr 无版本 error)
- IC-reuse-compat:三兼容档轮换全命中,版本检查不破坏既有缓存
- PF-perf(External):--profile-compile-time 取样,兼容缓存无额外开销;回退开销为预期行为且不累积

### 兼容性测试

- 接受侧(新读旧):CM-older-minor(0,0,0)/CM-boundary-00255(0,0,255)/CM-patch-255(0,1,255)/BC-legacy-upstream(降档 (0,0,0)+(0,0,1) 双包同编)/BC-legacy-prever(兼容三元组+抹版本串→溯源 unknown 仍接受)
- 拒绝侧(向前不兼容):CM-rej-minor-020/255(旧读端不静默消费新 minor 产物——需求来源场景的拦截位)、CM-rej-major-100/255
- 写读闭环:WR-values(写侧两产物字段逐项一致)、WR-macro-independent(native backend 宏开/关双构建交叉导入无差异)

### 性能测试

- 规格要求:版本检查开销=固定三字节读取+常量比较(可忽略)
- PF-perf(External):多依赖工程(≥8 依赖)双形态取样,兼容缓存构建无明显额外开销;不兼容缓存耗时接近全量且无错误诊断
- 自动化侧无性能基线断言(阈值型断言在 runner.md 固定取样口径)

### 资料测试

- 诊断信息用户可见性已由用例覆盖:报错含 cjo 路径+包名+双端 cjc 版本(DQ 族),不含内部字段名(cjoVersion scan-not)
- 无独立资料交付需求;迁移指引类内容(存量普查)挂 BC-legacy-prever 生态确认项

## 自动化、组网和测试环境分析

- **执行域对账**:Automated 27 = CM 9 + IC 5 + CJ 2 + CB 3 + BC-upstream 1 + BC-prever 1 + DQ 3 + VP 3;External 4(cjpm/LSP/perf/fuzz,治具在各自 runner.md);Manual 6(C++ 白盒 UT:写侧×2+查询接口×4)
- **运行环境**:maple_test 框架,`cd /e/cangjie_test_suite/cangjie_test_framework && python main.py --test_cfg <HLT config 基线 cfg> <套件路径>`;cjc 1.3.0-alpha.20260920003052 验证通过 27/27
- **组网**:单机无组网;flatc(+CjoFormat.fbs)仅 fixture 核验/人工构造时需要
- **外部化理由**:cjpm 需工程级包管理器环境、LSP 需 IDE 进程、perf 需取样脚本、fuzz 需变异引擎、Manual 需 C++ UT 挂载点——框架外治具,各承载判据不占自动化指标
- **ST 阶段待办**:

1. `cjo_mutate.py` 落地(套件根已落契约占位;flatc ./CjoFormat.fbs JSON 往返主路径 + 字节兜底 + --patch-cjo/--set-cache-cjo-version/--clear-cache-cjo-version)
2. 两根诊断串 / 缓存日志 kind 行 / 回退原因行 / CJMP 无产物锚的真实运行校准
3. Windows 侧校准:`.cached` 日志落盘与 `type` 通配行为实测(通过后方可补 `(Windows)` 缓存日志断言行)
4. ~~24 个命名 cjo fixture 由 cjo_mutate.py 依配方产出~~(2026-09-21 起废除:全部改为运行时现场手术,套件根零 .cjo 预存;gen_fixtures.py 已删除)
5. External/Manual runner.md 对应治具与 C++ UT 挂载点;双 SDK 专项环境(TC-CJO-BC-cross-version 受限场景)

---

## 附录A:逐用例设计思路详解

> 每条给出:设计动机(为什么要有这条)→ 构造(怎么搭出这个局面)→ 断言链(凭什么算过)→ 钉死语义(实测定谳的行为事实)。步骤细节见"功能场景测试"表格,此处不重复。

### 5.1 跨包导入组(9+7 条, L1/L3/L5)

**TC-CJO-CM-same(基准锚)**
- 动机:所有矩阵变体的 parity 基准。没有"什么都不动时全绿"的对照,变体用例的绿无法归因(可能 fixture 手术本身坏了编译)。这条用例证明:pkg 包编译→下游消费→运行,整条链路在本编译器上是干净的。
- 构造:pkg 现场编译静态库,无任何手术。
- 断言链:PIPE-0 + scan-not 版本串 + scan-not verifier 串(双重负锚:证明无版本拒绝也无结构拒绝)+ 运行 depValue()==42。
- 钉死语义:门禁对自家产物零打扰。

**TC-CJO-CM-older-minor((0,0,0) 接受)**
- 动机:向后兼容承诺的核心位——旧 minor 产物必须静默消费。(0,0,0) 同时是"预版本化全零形态"(探针 G5:真实格式里 cjoVersion 是 inline struct 不可缺失,(0,0,0) 就是"缺失"的唯一可实现形态),一条用例钉两个语义。
- 构造:pkg 现场编译出兄弟 pkg.cjo,cjo_mutate.py --set-cjo-version 0.0.0 就地手术(version 串保留)。
- 断言链:PIPE-0 + 双负锚 + 运行正确。运行正确这一步不可省:证明消费的是真 AST 而非空转。
- 钉死语义:minor≤cur 接受;(0,0,0) ≠ 拒绝。

**TC-CJO-CM-patch-255(patch 不参与判定)**
- 动机:证明比较只看 major.minor,patch 任意。patch 是三元组里唯一"无论什么值都不改变判定"的维度,必须用上界 255 钉死。
- 构造:pkg.cjo 现场手术 --set-cjo-version 0.1.255。
- 断言链:PIPE-0 + 双负锚 + 运行正确——与 CM-same 结论完全一致即通过("一致性"本身是断言)。
- 钉死语义:patch 0 与 255 等价。

**TC-CJO-CM-boundary-00255(双下界/上界组合)**
- 动机:CM-older-minor 只钉 minor 下界、CM-patch-255 只钉 patch 上界,二值同取的组合位单独一条——等价类组合处最容易出"单值各自对、组合错"的边界缺陷。
- 构造:pkg.cjo 现场手术 --set-cjo-version 0.0.255。
- 断言链:同上,PIPE-0 + 双负锚 + 运行正确。
- 钉死语义:(0,0,255) 与 (0,0,0) 等价。

**TC-CJO-CM-rej-major-100(major 判等拒绝 + 探针串溯源)**
- 动机:major≠cur 必须拒绝(DFX#1)。拒绝的**原因**必须可证:如果只断言"编译失败",结构损坏也会让编译失败——假绿。探针版本串 v100probe 让诊断 provenance 与 fixture 内容绑定:只有三元组真的被读到并被拒绝,报错里才会出现探针串。
- 构造:pkg.cjo 现场手术 --set-cjo-version 1.0.0 --set-version-string v100probe(手术与探针一次完成)。
- 断言链:PIPE-1 + scan 两根版本诊断串 + scan v100probe(探针锚)。三锚缺一不可。
- 钉死语义:major 判等(非大小比较,1>0 只是巧合方向);诊断 provenance 来自 version 串字段。

**TC-CJO-CM-rej-major-255(uint8 上界)**
- 动机:major 轴第二点。(1,0,0) 是"下界外第一点",(255,1,0) 是 uint8 上界——两点夹住整个拒绝区间,防止实现里存在 "major<某阈值才拒绝" 的意外路径。
- 构造:pkg.cjo 现场手术 --set-cjo-version 255.1.0 --set-version-string v255100probe。
- 断言链:PIPE-1 + 双版本串 + 探针串。
- 钉死语义:major=255(与当前 0 不等)拒绝。

**TC-CJO-CM-rej-minor-020(minor>cur 拒绝)**
- 动机:向前不兼容矩阵位(DFX#2)——需求来源场景"旧 SDK 只换新 cjo 就崩"的拦截位。旧 minor 接受、新 minor 拒绝,不对称语义必须两侧都钉。
- 构造:pkg.cjo 现场手术 --set-cjo-version 0.2.0 --set-version-string v020probe。
- 断言链:PIPE-1 + 双版本串 + 探针串。
- 钉死语义:minor>cur 拒绝。

**TC-CJO-CM-rej-minor-255(minor 上界)**
- 动机:minor 轴第二点,(0,255,255) 是 minor×patch 双上界——同一条用例覆盖两个维度的边界压满组合。
- 构造:pkg.cjo 现场手术 --set-cjo-version 0.255.255 --set-version-string v0255255probe。
- 断言链:PIPE-1 + 双版本串 + 探针串。
- 钉死语义:minor=255>cur 拒绝。

**TC-CJO-CM-rej-missing((0,0,0) 在跨包路径也接受)**
- 动机:IC-missing 的镜像对照位——同一 (0,0,0) 输入,跨包路径与增量路径结论必须一致(都接受),钉住"接受与否由三元组决定"而非路径。
- 构造:pkg.cjo 现场手术 --set-cjo-version 0.0.0(与 CM-older-minor 同输入,独立意图)。
- 断言链:PIPE-0 + 双负锚 + 运行正确。
- 钉死语义:跨包路径对 (0,0,0) 无特殊化。

**TC-CJO-VP-truncated(Verifier 先于版本门禁)**
- 动机:拒绝的两层结构(Verifier→版本)次序本身是规格。截断输入若走版本门禁会报错版本串(版本字段可能在截断前恰好可读),走 Verifier 则报结构串——诊断内容甄别哪层先动手。
- 构造:pkg.cjo 现场经 cjo_mutate.py --truncate 500 截断(结构坏,但文件头版本字段可能仍可读——这正是次序测试的价值)。
- 断言链:PIPE-1 + scan validation 专串 + scan-not 版本串。正锚+负锚成对:证明"是 Verifier 拒的"且"不是版本层拒的"。
- 钉死语义:validation of ... failed, please confirm...;版本串不出现。

**TC-CJO-VP-bad-ident(伪造版本不豁免结构校验)**
- 动机:与 truncated 同族但输入形态不同——结构坏在 file identifier(非 CJOF)而非长度。携带兼容版本 (0,1,0) 的坏结构 cjo 必须仍被 Verifier 拒绝:版本兼容不是结构校验的通行证。
- 构造:pkg.cjo 现场经 cjo_mutate.py --corrupt-identifier(头 4 字节改 XXXX),cjoVersion 保持原生兼容 (0,1,0)。
- 断言链:PIPE-1 + validation 专串 + scan-not 版本串。
- 钉死语义:Verifier 不看版本,版本层看不到 Verifier 拒掉的东西。

**TC-CJO-VP-random-bytes(极端输入安全拒绝)**
- 动机:健壮性保底——等长随机字节(非截断非定点改)必须被 Verifier 稳定拒绝,不允许 ICE/越界/崩溃。fuzz 治理的定点缩影片:全谱变异交 External/PF-fuzz,自动化只钉一个代表性极端点。
- 构造:pkg.cjo 现场经 cjo_mutate.py --random-fill 42(固定种子等长随机字节,可复现)。
- 断言链:PIPE-1 + validation 专串 + scan-not 版本串 + 进程正常退出(无崩溃)。
- 钉死语义:任意坏输入 → 稳定拒绝,三态预言(拒绝/诊断/通过)的"拒绝"态。

**TC-CJO-DQ-provenance(溯源字段甄别)**
- 动机:诊断里 compiled with cjc 后面的版本号必须来自产物 version 串字段,不能是实现偷懒拼当前编译器版本。若实现拼错了来源,这条用例红;若只断言报错出现,拼错来源的实现照样绿。
- 构造:pkg.cjo 现场手术 --set-cjo-version 1.0.0 --set-version-string 99.99.99(与当前编译器版本任何一位都不同)。
- 断言链:PIPE-1 + scan is incompatible + scan 99.99.99。
- 钉死语义:provenance 引用产物字段。

**TC-CJO-DQ-no-cjoVersion(内部标识不泄露)**
- 动机:设计要求用户不应感知 cjo 格式内部版本名。诊断输出若包含 cjoVersion 字样,说明实现把内部字段名漏给了用户——设计规格的负向约束必须有负向断言。
- 构造:pkg.cjo 现场手术 --set-cjo-version 0.2.0(与 CM-rej-minor-020 同款不兼容形态不同断言点,形态复用是有意的:证明同一拒绝行为可独立甄别不同质量维度)。
- 断言链:PIPE-1 + scan 版本串 + scan-not cjoVersion(对完整 stderr)。
- 钉死语义:诊断用编译器版本号,不用 cjo 格式版本。

**TC-CJO-DQ-terminates(error 终止性)**
- 动机:拒绝必须以 error 级别终止(非零退出、无产物),不能降级 warning 继续编译——后者会让不兼容 AST 流入后端产生不可预测后果。退出码甄别 error vs warning,产物缺失甄别终止 vs 继续。
- 构造:pkg.cjo 现场手术 --set-cjo-version 0.2.0;追加平台双行无产物断言(Linux test / Windows powershell Test-Path,条件行双写防止单平台静默跳过)。
- 断言链:PIPE-1 + scan 版本串 + 无产物断言。
- 钉死语义:拒绝发生在 AST 消费前,无部分产物。

**TC-CJO-CB-single-bad(多依赖单点坏 + 定位准确 + 替换闭环)**
- 动机:单依赖拒绝(1.1 组)不等于多依赖场景正确——三个依赖一个坏,必须(a)整体拒绝、(b)报错点名坏的、(c)不误报好的、(d)用户替换后闭环。四个要求里 (c)(d) 只有在多依赖构造下才能测。
- 构造:a/c 原生,b 同一兄弟 b.cjo 上两轮手术(先 0.2.0 坏档、恢复轮 0.1.0);同一驱动内先坏后好两轮编译,各自独立规则文件(负锚轮/正锚轮)。
- 断言链:第一轮 PIPE-1 + scan b.cjo(点名坏依赖);第二轮 PIPE-0 + scan-not 版本串 + 运行 126(三包求和,证明三个依赖真被链接进来)。
- 钉死语义:诊断定位到 cjo 文件级;替换 cjo 即恢复,无需清缓存。

**TC-CJO-CB-transitive(传递依赖门禁)**
- 动机:坏 cjo 不一定被 main 直接 import——main→mid→坏 pkg 链上,mid 编译时它的依赖闭包里就有坏 cjo。门禁必须在闭包每一跳都生效,不能只查直接依赖。
- 构造:pkg_mid(合法,import pkg)+ pkg.cjo 现场手术 --set-cjo-version 1.0.0;mid 编译即触发。
- 断言链:mid 编译 PIPE-1 + scan 版本串 + scan pkg.cjo(指向源头 pkg 而非 mid)。
- 钉死语义:传递闭包内校验;驱动体 main 不达编译(链已在 mid 断),仅备查。

**TC-CJO-CB-isolation(失败状态不污染)**
- 动机:拒绝之后系统还能用吗?CjoManager 已加载包/缓存状态不得被一次失败污染,否则一个坏依赖会毒化后续所有编译。这是"失败之后"语义的半壁江山。
- 构造:同一驱动内:第一轮 b 手术 (1,0,0) 触发拒绝 → b 手术回 (0,1,0) → 第二轮 a+c 干净组合(经 SEPARATE-FILE 物化的独立驱动源 main_iso.cj,只 import a/c);SEPARATE-FILE 容器纯 ASCII(框架该路径用 locale 编码重开文件)。
- 断言链:第一轮 PIPE-1 + scan b.cjo;第二轮 PIPE-0 + scan-not 版本串 + 运行成功(全链路验证不只是一次编译)。
- 钉死语义:失败与恢复在进程内先后发生,第二次编译零诊断=状态干净。

**TC-CJO-BC-legacy-prever(生态视角的缺失形态)**
- 动机:与 CM-rej-missing 同输入不同意图——那条钉判定行为,这条钉生态影响:真实存量若存在版本串被抹的形态,兼容判据看三元组不看串,必须接受。提醒维护者:若未来真实存量出现拒绝,须升级为需求出口确认项而非静默放过。
- 构造:pkg.cjo 现场经 cjo_mutate.py --clear-version-string(兼容三元组 (0,1,0) 保留、版本串清空)。
- 断言链:PIPE-0 + scan-not 版本串 + scan-not validation 串 + 运行正确。
- 钉死语义:版本串缺失→溯源 unknown,但接受与否仍由三元组决定(探针 G6)。

### 5.2 增量缓存组(5 条, L2)

**TC-CJO-IC-rej-major(增量路径拒绝分叉)**
- 动机:同一坏 cjo,跨包路径报 error、增量路径报 module_version_not_identical 且伴随回退——管线不是传递路径,是语义分叉点。这条钉"增量路径也会拒绝"(而非有人担心的静默放过),下一条钉回退形态。
- 构造:pkg.cj 直编建缓存 → cjo_mutate.py --patch-cjo pkg.cjo --set-cjo-version 1.0.0(兄弟 cjo 手术——实测定谳 G8:门禁读兄弟 cjo,从不读 .cached 内 cjo)→ 增量重编。
- 断言链:PIPE-1 + scan is incompatible;缓存日志流独立规则文件(log_reject.txt,断言回退 kind 行)——缓存锚词只住 .cached/*.log,挂编译流必假红。
- 钉死语义:增量拒绝=PIPE-1+两流各断各的;手术目标=兄弟 cjo。

**TC-CJO-IC-rej-minor(minor 档增量拒绝)**
- 动机:major 档拒绝可能被误解为"只有 major 才查缓存",minor 档独立一条证明判定矩阵在增量路径完整生效。
- 构造:同上,手术 (0,2,0)。
- 断言链:同上(PIPE-1 + 版本串 + 缓存日志回退行)。
- 钉死语义:minor>cur 在增量路径同样拒绝。

**TC-CJO-IC-missing((0,0,0) 增量路径也接受)**
- 动机:CM-rej-missing 的跨包-增量对照位:同一 (0,0,0) 在两条路径结论一致(都接受),钉住"接受由三元组决定、与路径无关"。此用例同时验证手术后的全量重编走通(缓存失效重编 = 干净编译 parity)。
- 构造:手术兄弟 cjo (0,0,0) → 增量重编。
- 断言链:PIPE-1 + scan 版本串 + scan cjc unknown 形态锚;缓存日志回退行(失效发生了)。
- 动机补:同一手术同时验证"版本检查在增量路径对无溯源产物同样生效"。
- 钉死语义:版本串缺失+不兼容三元组在增量路径同样拒绝;provenance 落 cjc unknown 形态(IC 流内 scan 锚钉住)。

**TC-CJO-IC-reuse-compat(兼容三档轮换全命中)**
- 动机:单次兼容接受(一条用例)可能是巧合,三档兼容版本连续轮换(0.0.0→0.1.255→0.1.0)每次手术各编译一轮、全走缓存命中——证明版本检查不破坏既有缓存命中(DFX#5~8 兼容侧),也证明多次手术+多次增量编译无累积污染。
- 构造:三段 EXEC-PIPE-0 轮换手术+编译;缓存日志独立规则文件断言无回退行(末档)。
- 断言链:每段 PIPE-0 + scan-not module_version_not_identical;缓存日志无回退 kind 行;运行正确。
- 钉死语义:兼容版本轮换=零回退。

**TC-CJO-IC-selfheal(自愈:失效只影响一次构建)**
- 动机:回退之后缓存会怎样?最危险的失败模式是永久退化——坏版本进过一次缓存,之后每次构建都回退。实测:回退的全量重编自动重导出当前版本缓存,第三次构建恢复命中。这条钉"失效不持久化"。
- 构造:三段式——(1)建缓存;(2)手术 (1,0,0) 触发拒绝+回退(编译流 diag_p1 + 缓存日志 log_selfheal_p1);(3)恢复 (0,1,0) 再增量编译(编译流 diag_p2 + 缓存日志 log_selfheal_p2 断言 no change, skip sema=命中)。多段独立规则文件:框架把同文件 ASSERT 泄漏给相邻 compare 段,物理分文件防串锚。
- 断言链:段2 PIPE-1+回退行;段3 PIPE-0+命中行+运行正确。
- 钉死语义:回退→重导出→自愈,三步闭环;失效不演变为永久全量退化。

### 5.3 CJMP 组(2 条, L2)

**TC-CJO-CJ-compat(预加载复用跨包判定)**
- 动机:CJMP 公共部分预加载是第三条 cjo 消费路径,设计宣称"复用跨包校验路径,无单独适配"——宣称必须验证:兼容产物预加载成功且无版本诊断。
- 构造:c 导出 chir+cjo;p 带 --common-part-chir 与 --common-part-cjo 双参数编译(实测 G10:两参数必须同给,输出目录须先存在)。
- 断言链:PIPE-0 + 双负锚。
- 钉死语义:预加载成功=后续流程继续(编译完成)。

**TC-CJO-CJ-reject(预加载拒绝早于读取)**
- 动机:兼容侧的镜像位——不兼容公共部分 cjo 必须被拒绝,且拒绝发生在读取公共部分之前(无部分加载产物)。若实现先加载再检查,会出现半加载状态,后端消费半 AST 是最难的崩法。
- 构造:c 导出后手术 cmp.cjo (0,2,0);p 编译 PIPE-1。
- 断言链:PIPE-1 + scan 版本串 + 平台双行无产物断言(p 侧 dylib 不存在)。
- 钉死语义:预加载拒绝与跨包导入行为一致;无部分加载。

### 5.4 向后兼容与外部组

**TC-CJO-BC-legacy-upstream(单 SDK 向后兼容,新增)**
- 动机:原 External/TC-CJO-BC-legacy 需要真实旧 SDK 存量产物——环境依赖重(CI 缺省不具备),而其断言价值(旧形态 cjo 被静默接受)可以单 SDK 达成:门禁只读三元组,当前 cjc 编译的产物被降档到 (0,0,0)/(0,0,1) 后,对门禁而言与真实旧编译器产物无异。降档模拟替代双 SDK 环境,断言力等价。
- 构造:pkg_l1/pkg_l2 现场编译;产物拷贝各经 cjo_mutate.py --set-cjo-version 降档回填兄弟位(手术在拷贝上做,产物原样保留);两包一次同编。
- 断言链:PIPE-0 + diag_ok 双负锚 + 运行 30(两包求和=两个依赖真被消费)。
- 钉死语义:两档最旧形态同时在场仍全接受;接受侧的向后兼容承诺由自动化钉住,不再占外部指标。

**External 四组(cjpm/LSP/perf/fuzz,治具在 runner.md)**
- 保留外部化的理由不是双 SDK,而是各自需要框架外治具:cjpm 需要工程级包管理器环境、LSP 需要 IDE 进程、perf 需要多依赖工程+取样脚本、fuzz 需要变异引擎。断言内容见各自 runner.md,不占自动化指标。

### 5.5 白盒/人工组(6 条)

**Manual 六组(WR-values/WR-macro-independent/QY-current/QY-older-minor/QY-unloaded/QY-cross-major)**
- 保留 Manual 的理由:全部是 C++ 层白盒断言(SaveCjo/ExportASTSignature 写侧字段、ASTLoader 查询接口、native backend 宏配置双构建),挂载点在编译器 C++ UT,不在仓颉测试框架可达范围。判定表与 fixture 构造已在 runner.md 写死(9+6 布尔值逐项断言/镜像位/未加载态/跨 major 不可排序),UT 落库时照搬。
- 与自动化黑盒的关系:QY 三接口是读侧分流语义的内部形态,黑盒只能测分流的外部投影(接受/拒绝矩阵),白盒测三接口布尔真值表——两层互补,不冗余。

---

## 附录B:修订记录(实测落地全程)

### 2026-09-20 实测落地修订(26/26 真实执行通过)

本设计文档生成后,用例经真实框架执行(maple_test + cjc 1.3.0-alpha.20260920003052)迭代验证,以下语义以**实测**为准,与正文早期描述不一致时以本节为准:

1. **门禁读兄弟 cjo,非缓存 cjo**:`.cached/<hash>.cjo` 的 cjoVersion 从不被读,对它手术只会静默 no-change。IC 组全部重设计为对静态库旁兄弟 cjo(pkg.cjo)手术;`cjo_mutate.py --patch-cache` 已改为显式报错防误用。
2. **裸 cjo 不是包源**:把 .cjo 作为首个命令行参数不触发门禁也不触发 Verifier-for-import;统一采用 `%compiler %pkg_opt pkg %compile_lib_opt -o pkg.a` + `%cp ../dep_xxx.cjo pkg.cjo` 兄弟替换形态。
3. **cjoVersion 是 inline struct,不可缺失**:"缺版本"的真实可实现形态是全零 (0,0,0),被接受。CM-rej-missing 重设计为接受+运行;BC-legacy-prever 重设计为版本串抹除(--clear-version-string+兼容三元组)接受+运行。
4. **CM 拒绝组加探针版本串**:拒绝报错的 provenance 来自版本 string 字段而非三元组;每个拒绝 fixture 现场以 `--set-version-string <probe>` 注入唯一探针串,断言锚 scan 探针串(如 `v100probe`),使"拒绝来自版本判断"可证。
5. **IC 拒绝形态实测**:stderr 报 `module_version_not_identical`(PIPE-1)+ `.cached/<hash>.log` 落 `frontend error detected, roll back to full compilation`+`full sema`(无 kind 行);恢复兼容版本后自愈(自愈用例 log_p2 断言 `no change, skip sema`)。
6. **CB-isolation 用 SEPARATE-FILE**:驱动源 main.cj 与 main_iso.cj 经容器内 `// SEPARATE-FILE:` 指令物化(LLT genericParamReExport 先例);容器文件保持 ASCII(该路径框架用 locale 编码重开文件)。
7. **框架语义钉死**:DEPENDENCE 文件扁平拷入 work_dir(EXEC 用裸名,DEPENDENCE 行带 `../`);EXEC 引用的本地辅助文件必须列入 DEPENDENCE;compare 段 ASSERT 会泄漏给相邻段——多段用例每段独立规则文件(diag_p1/diag_p2 先例)。

### 2026-09-21 去双 SDK 修订 + 逐用例思路详解(27/27 真实执行通过)

1. **双 SDK 两组移除**:External/TC-CJO-BC-cross-version 与 External/TC-CJO-BC-legacy 删除(需求裁剪:不做双版本 SDK 专项环境)。其断言价值由自动化承接:
   - "新读旧 minor/patch 静默通过" = CM-older-minor/CM-boundary-00255/CM-patch-255 + 新增 BC-legacy-upstream(降档 (0,0,0)/(0,0,1));
   - "旧读新拒绝" = CM-rej-minor-020/CM-rej-minor-255/CM-rej-major-100/CM-rej-major-255(读端固定当前编译器,拒绝位与读端新旧无关——门禁只比较三元组);
   - 双向矩阵中真正需要双 SDK 的只剩"旧编译器能否消费新产物"(旧端行为,非本特性门禁的读侧),随需求裁剪移除。
2. **新增 TC-CJO-BC-legacy-upstream**(automated,L4 生态层):当前 cjc 编译 pkg_l1/pkg_l2 → 产物拷贝经 cjo_mutate.py --set-cjo-version 降档 (0,0,0)/(0,0,1) 回填兄弟 cjo → 一次同编静默通过+运行正确。判据 `cjo_version_check/import/backward_compat/compat_legacy_upstream`。总用例 27(26+1);原 External BC-legacy 意图由本用例承接。
3. **执行域对账**:Automated 27 = CM 9 + IC 5 + CJ 2 + CB 3 + BC-upstream 1 + DQ 3 + VP 3 + BC-prever 1;External 4(cjpm/LSP/perf/fuzz,治具在 runner.md);Manual 6(白盒 UT/写侧/宏)。
4. 逐用例设计思路详解见 §八(每用例:设计动机→构造→断言链→钉死语义)。

---

### 2026-09-21b 运行时现场生成修订(零预存 fixture,27/27 真实执行通过)

1. **套件根零 .cjo 预存**:19 个预生成命名 fixture(dep_*.cjo/b_v*.cjo/legacy_nover.cjo)与 gen_fixtures.py 删除。全部用例改为运行时现场手术:编译步 `%compiler %pkg_opt pkg ...` 本身就产出兄弟 pkg.cjo(这就是基准 fixture),随后 `%python cjo_mutate.py --patch-cjo pkg.cjo ...` 就地变体——"用例自足",拷贝套件目录到任何环境即可跑,无预生成步骤依赖。
2. **cjo_mutate.py 扩展字节级破坏操作**(VP 组去预生成所需):`--truncate [N]`(省略=减半)、`--corrupt-identifier`(头 4 字节改 XXXX)、`--random-fill [SEED]`(固定种子可复现,默认 42)。三操作走纯字节路径不经 flatc(输入本就允许是坏结构)。
3. **CB-single-bad/CB-isolation 的 b 包恢复轮**:原来 cp 回 b_v010.cjo,改为对同一 b.cjo 再次 `--set-cjo-version 0.1.0`(手术即"用户替换动作"的现场化)。
4. **IC-missing 重定向**:原依赖 dep_v020_nover.cjo((0,2,0)+版本串抹除),改为现场手术 `--set-cjo-version 0.2.0 --clear-version-string`,语义不变(拒绝+provenance 落 cjc unknown 形态)。
5. fixture 复述全文档同步:§四配方总则、§五表格 fixture/步骤列、§八详解构造行、"ST 待办"第 4 条划除。
6. **External/Manual runner.md 同步**(10 份):6 份长样板段(预生成配方+已作废的 --patch-cache 缓存手术)改为 §四 指针+运行时现场生成口径;EC-cjpm/EC-lsp 正文 dep_v020.cjo 引用、QY-unloaded dep_nover 引用改为现场手术措辞;EC-cjpm "cjo_mutate.py 附带治具模板"失实措辞纠正(工具无此模板)。External 4+Manual 6 保留理由:C++ UT 挂载点/框架外治具,各承载 DT 设计判据,删则悬空。
