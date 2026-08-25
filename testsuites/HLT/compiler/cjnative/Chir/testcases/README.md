# 泛型实例化指针重排功能重构 — 手写测试用例套件

> 需求: SR.IR20260706000885.011「泛型实例化指针重排功能重构(按需索引)」
> 测试模型: `test_models/lang/model_generic_instantiation_opt`
> 生成方式: **手写落盘**,每条用例均有真实仓颉 `.cj` 源码
> 生成日期: 2026-08-21(初版) / 2026-08-24(output 镜像 + 大类说明) / 2026-08-25(成员属性关系矩阵 27 条)

本套件把测试模型 `allGenericInstantiationScenarios()` 定义的场景逐个物化为可执行/可验收的测试用例产物。
**所有用例均落地为手写 `.cj` 源码**：正向用例编译运行断言 `TRACE_OK`，负向用例编译断言失败并匹配符号化 `DiagKind`。
无法用手写源码表达的四条（随机广度/缓存生命周期白盒/工程级编译耗时/issue#843 mock_O2 既有回归集）已删除，不在本套件登记。

> **交付镜像**:本目录的用例源码已同步镜像到 `output/testcases/`(路径自包含,可就地运行),并附 `output/testcases/INDEX.md` 索引。本目录是开发维护源盘,`output/testcases/` 是交付快照。
>
> **测试头部(HLT)**:所有 `.cj` 用例源文件已内嵌 HLT 测试头部(`// Level:` / `// Description:` / `// EXEC:` / `// RUN-EXEC:` / `// ASSERT: scan` / `// ASSERT: scan-not` 指令),可被仓颉测试框架**直接执行**,无需外部 `run_all.sh` 驱动。头部格式权威来源为 `cjss/src/cangjie/test_case_info.cj` 的 `TestCaseInfo.toString()`。跨包用例 `TC-GENINST-CROSS-PACKAGE` 因需 `cjpm build`/`cjpm run` 多包工程,改用同目录 `TestCase.info` 文件承载头部。各 `run_all.sh`/`run.sh` 现仅作**兼容/回退**用途,框架直接跑头部即可。

## 用例清单(23)

| TC ID | 场景 | 优先级 | 范围 | 产物 |
|---|---|---|---|---|
| TC-GENINST-DFX7 | 协变返回实例化选型 | P0 | External | `dfx_case7_covariant/main.cj` |
| TC-GENINST-DFX9 | 实例化指向具体声明 | P0 | External | `dfx_case9_lazyseq/main.cj` |
| TC-GENINST-SEED | 六步按需选型种子 | P0 | Automated | `six_step_seed/` (9×main.cj + run_all.sh) |
| TC-GENINST-PARITY | O0/O2 trace 等价 | P0 | Automated | 复用 `six_step_seed/` (双跑 -O0/-O2) |
| TC-GENINST-843-O2 | issue#843 -O2 无 undefined symbol | P0 | Automated | `issue843/` (main.cj + run.sh) |
| TC-GENINST-RELATION-MATRIX | 成员来源×覆盖方向矩阵(成员函数 26 条) | P0 | External | `relation_matrix/01..26/main.cj + run_all.sh` |
| TC-GENINST-PROPERTY-MATRIX | 成员属性来源×覆盖方向矩阵(27 条) | P0 | External | `property_matrix/01..27/main.cj + run_all.sh` |
| TC-GENINST-NEG_abstract_unimpl | 抽象成员未实现 | P0 | Automated | `negative/NEG_abstract_unimpl/main.cj` |
| TC-GENINST-NEG_sig_conflict | 返回类型冲突 | P0 | Automated | `negative/NEG_sig_conflict/main.cj` |
| TC-GENINST-NEG_generic_constraint | 泛型约束不满足 | P0 | Automated | `negative/NEG_generic_constraint/main.cj` |
| TC-GENINST-NEG_diamond_default_conflict | 菱形多默认冲突 | P0 | Automated | `negative/NEG_diamond_default_conflict/main.cj` |
| TC-GENINST-NEG_unrelated_extend_conflict | 无父子关系扩展遮蔽 | P0 | Automated | `negative/NEG_unrelated_extend_conflict/main.cj` |
| TC-GENINST-NEG_static_instance_clash | static/实例状态冲突 | P0 | Automated | `negative/NEG_static_instance_clash/main.cj` |
| TC-GENINST-NEG_generic_mismatch | generic 状态不一致 | P0 | Automated | `negative/NEG_generic_mismatch/main.cj` |
| TC-GENINST-PROPERTY-PARTIAL | getter/setter 部分重写(负向) | P0 | External | `external/TC-GENINST-PROPERTY-PARTIAL/main.cj` |
| TC-GENINST-PROPERTY | property getter/setter 重排 | P1 | External | `external/TC-GENINST-PROPERTY/main.cj` |
| TC-GENINST-STATIC | interface static 泛型 | P0 | External | `external/TC-GENINST-STATIC/main.cj` |
| TC-GENINST-ABSTRACT-CLASS | 抽象类上界实例化(+负向) | P0 | External | `external/TC-GENINST-ABSTRACT-CLASS/{main,negative_part}.cj` |
| TC-GENINST-RECEIVER-KIND | struct/enum 接收者 | P0 | External | `external/TC-GENINST-RECEIVER-KIND/main.cj` |
| TC-GENINST-O0-NATIVE | O0 原生按需实例化 | P0 | External | `external/TC-GENINST-O0-NATIVE/main.cj` |
| TC-GENINST-MULTI-PARENT | 无关默认冲突/显式消歧(+负向) | P0 | External | `external/TC-GENINST-MULTI-PARENT/{main,conflict_part}.cj` |
| TC-GENINST-CROSS-PACKAGE | 跨包扩展/缓存隔离 | P1 | Manual | `external/TC-GENINST-CROSS-PACKAGE/` (pkg_a+pkg_b+run.sh) |
| TC-GENINST-OVERRODE | overrode_by_diff_inst 回归 | P1 | External | `external/TC-GENINST-OVERRODE/main.cj` |

## 需求追溯(六步 → DFX case → TC → 产物)

需求文档 `design-spec.md` §7 六步选型算法与本套件产物的映射:

| 六步 | DFX case | 产物路径 |
|---|---|---|
| ① 父接口 | case1 / case1g | `six_step_seed/DFX_case1`, `DFX_case1g` |
| ② 父类 | case2 | `six_step_seed/DFX_case2` |
| ③ 本类型 | case3 | `six_step_seed/DFX_case3` |
| ④ 扩展父接口默认 | case4 | `six_step_seed/DFX_case4` |
| ⑤ 扩展自身 | case6 / case8 | `six_step_seed/DFX_case6`, `DFX_case8` |
| ⑥ 并入同名 type-wins | case4/5/6 | `six_step_seed/DFX_case4/5/6` |

- `DFX_case1g`:六步①经泛型函数 `k<T>` 触发,验证指针重排真实形态(非直接 iface 调用)。
- `GENINST_issue843`:issue#843 修复点(`instDecl ? instDecl : decl` 空回退),
  跨接口继承 `I<:I_Buddy` + `extend C<:I` + `test<M> where M<:I_Buddy`。
- `DFX_case7` 协变返回:cjc 1.3.0 实测支持(输出 A1),本套件直接落 design-spec 源码。
- `DFX_case9` 实例化指向:白盒口径,语义不可区分(需求文档明示"对执行结果无影响"),
  无可断言运行时差异,仅验证编译链接运行成功。

## 关系矩阵 26 条

`relation_matrix/01..26/` 各一份独立 `main.cj`,逐项枚举成员来源与覆盖方向:

| # | 关系 | # | 关系 |
|---|---|---|---|
| 01 | 接口抽象→类 | 14 | 扩展接口默认→类型 |
| 02 | 接口默认→类 | 15 | 扩展成员→类型 |
| 03 | 抽象接口→抽象类 | 16 | 扩展成员→接口 |
| 04 | 继承实现→子类 | 17 | 类型成员覆盖父接口 |
| 05 | 抽象父类→具体子类 | 18 | 类型成员覆盖父类 |
| 06 | 接口抽象→扩展 | 19 | 类覆盖接口默认 |
| 07 | 接口默认→扩展 | 20 | 扩展覆盖接口默认 |
| 08 | 父接口抽象→子接口 | 21 | 多默认派生选取 |
| 09 | 父接口默认→子接口 | 22 | 默认+抽象唯一选取 |
| 10 | 父类→子类 | 23 | 同向合并去重 |
| 11 | 父类→接口 | 24 | 交叉方向优先类型 |
| 12 | 类→接口 | 25 | getter/setter 独立 |
| 13 | 类→扩展接口 | 26 | 无父子关系默认冲突(负向) |

其中 #25(getter 仅重写一侧)与 #26(无父子关系两接口默认冲突)为负向,编译断言失败+DiagKind;
其余 24 条合法,-O0/-O2 双跑断言 `TRACE_OK`。

## 成员属性关系矩阵 27 条

`property_matrix/01..27/` 各一份独立 `main.cj`,逐项枚举成员属性(prop)的来源与覆盖方向,与成员函数矩阵同等程度覆盖:
每条把 `func foo()` 改为 `mut prop x`(双访问器)或只读 `prop x`,经泛型函数 `readX<T>` 实例化触发按需查询重排,
读(getter)经泛型实例化命中预期版本,写(setter)经直接对具体实例 `c.x = 99` 命中同一版本。

| # | 关系 | # | 关系 |
|---|---|---|---|
| 01 | 接口抽象→类 | 15 | 扩展成员→类型 |
| 02 | 接口默认→类 | 16 | 扩展成员→接口 |
| 03 | 抽象接口→抽象类 | 17 | 类型成员覆盖父接口 |
| 04 | 继承实现→子类 | 18 | 类型成员覆盖父类 |
| 05 | 抽象父类→具体子类 | 19 | 类覆盖接口默认 |
| 06 | 接口抽象→扩展(struct) | 20 | 扩展覆盖接口默认 |
| 07 | 接口默认→扩展(struct) | 21 | 多默认派生选取 |
| 08 | 父接口抽象→子接口 | 22 | 默认+抽象唯一选取 |
| 09 | 父接口默认→子接口 | 23 | 同向合并去重(属性版负向) |
| 10 | 父类→子类 | 24 | 交叉方向优先类型 |
| 11 | 父类→接口 | 25 | getter/setter 独立(只读) |
| 12 | 类→接口 | 26 | 无父子关系默认冲突(负向) |
| 13 | 类→扩展接口 | 27 | 菱形默认冲突(负向) |
| 14 | 扩展接口默认→类型 | | |

其中 #23(菱形同向合并)、#26(无父子关系两接口默认冲突)、#27(菱形默认冲突)为负向,编译断言失败+DiagKind;
其余 24 条合法,-O0/-O2 双跑断言 `TRACE_OK`。

> **关键实测差异**:维度 23(菱形同向合并)在成员函数版编译通过(两路径默认合并去重),
> 但 cjc 1.3.0 实测成员属性版编译失败(`sema_interface_member_must_be_implemented`),
> 按既有矩阵以实测行为为准落为负向。这与函数矩阵 #23(合法)行为不同,是属性维度的真实语义差异。
> 另含 `TC-GENINST-PROPERTY`(全重写正向)与 `TC-GENINST-PROPERTY-PARTIAL`(只重写一侧被拒)两条 getter/setter 独立性专项作为补充。

## 构建/运行(cjc 1.3.0-alpha.02, cjnative)

### 方式一:测试框架直接执行(推荐)

每个 `.cj` 已内嵌 HLT 测试头部,仓颉测试框架扫描文件头的 `// EXEC:` / `// RUN-EXEC:` / `// ASSERT:` 指令直接编译运行并断言,无需 shell 驱动。头部指令语义:

| 指令 | 含义 |
|---|---|
| `// EXEC: %compiler %cmp_opt %f -o %output` | 编译源文件(`%f` 替换为本文件,`%output` 为输出二进制),预期退出码 0 |
| `// RUN-EXEC: %run %run_opt %output %run_args` | 运行编译产物,预期退出码 0 |
| `// EXEC-PIPE-1: %compiler ... --diagnostic-format=json ... \| compare %f` | 负向:编译预期失败(退出码 1),输出经 `compare` 比对 |
| `// ASSERT: scan TRACE_OK` | 断言输出包含指定文本 |
| `// ASSERT: scan-not undefined symbol` | 断言输出不包含指定文本 |
| `// ASSERT: scan <DiagKind>` | 负向:断言 JSON 诊断含指定符号化 DiagKind |

跨包用例 `TC-GENINST-CROSS-PACKAGE` 用 `TestCase.info`(`// EXEC: cjpm build` / `// RUN-EXEC: cjpm run`)。

### 方式二:外部脚本(兼容/回退)

```bash
# 正向种子:每个目录 O0/O2 双跑,断言 TRACE_OK
cd six_step_seed && bash run_all.sh

# issue#843:-O2 断言无 undefined symbol
cd issue843 && bash run.sh

# 负向:每个断言编译失败 + DiagKind 匹配
cd negative && bash run_all.sh

# 关系矩阵(成员函数):24 正向 O0/O2 双跑 + 2 负向 DiagKind
cd relation_matrix && bash run_all.sh

# 关系矩阵(成员属性):24 正向 O0/O2 双跑 + 3 负向 DiagKind
cd property_matrix && bash run_all.sh

# DFX7 协变返回:断言输出含 A1 不含 I1
cd dfx_case7_covariant && cjc main.cj -o t7 && ./t7

# DFX9 实例化指向:断言编译链接运行成功
cd dfx_case9_lazyseq && cjc main.cj -o t9 && ./t9

# 外部用例(单文件):cjc <dir>/main.cj -O0/-O2 -o p && ./p
cjc external/TC-GENINST-RECEIVER-KIND/main.cj -O0 -o p && ./p
cjc external/TC-GENINST-PROPERTY/main.cj -O2 -o p && ./p

# 跨包工程:cjpm build && cjpm run
cd external/TC-GENINST-CROSS-PACKAGE && bash run.sh
```

单个 `.cj` 编译: `cjc <file>.cj -o <prog> [-O2]`
负向诊断: `cjc <file>.cj --diagnostic-format json -o /dev/null | jq '.[]|.DiagKind'`
