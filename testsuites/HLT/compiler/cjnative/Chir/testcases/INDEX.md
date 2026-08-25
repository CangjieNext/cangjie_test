# 测试用例源码索引 — model_generic_instantiation_opt

> 需求: SR.IR20260706000885.011「泛型实例化指针重排功能重构(按需索引)」
> 本目录是测试设计 23 个 TC 的手写 `.cj` 用例源码镜像,按设计文档分组结构组织。
> 运行脚本路径自包含(`ROOT=$(dirname "$0")`),可在本目录直接 `bash run_all.sh` 运行。
> 编译器: cjc 1.3.0-alpha.02 (cjnative),正向经仓颉单元测试框架(`cjc --test`,断言 `PASSED:1 FAILED:0`)或断言 `TRACE_OK`,负向断言 DiagKind 匹配。

## 用例 → 源码映射(23 TC)

| TC ID | 分组 | 优先级 | 源码文件 | 运行 |
|---|---|:---:|---|---|
| TC-GENINST-DFX7 | DFX 专项边界 | P0 | `dfx_case7_covariant/main.cj` | `cjc main.cj -O0/-O2 -o p && ./p` 断言输出 A1 |
| TC-GENINST-DFX9 | DFX 专项边界 | P0 | `dfx_case9_lazyseq/main.cj` | `cjc main.cj -O0/-O2 -o p && ./p` 编译链接运行成功 |
| TC-GENINST-SEED | 六步种子 | P0 | `six_step_seed/DFX_case1,1g,2,3,4,5,6,8 + GENINST_issue843` (9×main.cj) | `cd six_step_seed && bash run_all.sh` |
| TC-GENINST-PARITY | O0/O2 等价 | P0 | 复用 `six_step_seed/` (双跑 -O0/-O2) | `cd six_step_seed && bash run_all.sh` |
| TC-GENINST-843-O2 | issue#843 | P0 | `issue843/main.cj` | `cd issue843 && bash run.sh` (-O2 无 undefined symbol) |
| TC-GENINST-RELATION-MATRIX | 关系矩阵(成员函数) | P0 | `relation_matrix/01..26/main.cj` (26 条) | `cd relation_matrix && bash run_all.sh` (23 正向+3 负向) |
| TC-GENINST-PROPERTY-MATRIX | 关系矩阵(成员属性) | P0 | `property_matrix/01..27/main.cj` (27 条) | `cd property_matrix && bash run_all.sh` (24 正向 unittest PASSED:1 FAILED:0 + 3 负向 DiagKind) |
| TC-GENINST-NEG_abstract_unimpl | 负向诊断 | P0 | `negative/NEG_abstract_unimpl/main.cj` | `cjc main.cj --diagnostic-format json` DiagKind=sema_class_need_abstract_modifier_or_func_need_impl |
| TC-GENINST-NEG_sig_conflict | 负向诊断 | P0 | `negative/NEG_sig_conflict/main.cj` | DiagKind=sema_return_type_incompatible |
| TC-GENINST-NEG_generic_constraint | 负向诊断 | P0 | `negative/NEG_generic_constraint/main.cj` | DiagKind=sema_generic_type_argument_not_match_constraint |
| TC-GENINST-NEG_diamond_default_conflict | 负向诊断 | P0 | `negative/NEG_diamond_default_conflict/main.cj` | DiagKind=sema_interface_member_must_be_implemented |
| TC-GENINST-NEG_unrelated_extend_conflict | 负向诊断 | P0 | `negative/NEG_unrelated_extend_conflict/main.cj` | DiagKind=sema_extend_member_cannot_shadow |
| TC-GENINST-NEG_static_instance_clash | 负向诊断 | P0 | `negative/NEG_static_instance_clash/main.cj` | DiagKind=sema_static_and_non_static_member_cannot_have_same_name |
| TC-GENINST-NEG_generic_mismatch | 负向诊断 | P0 | `negative/NEG_generic_mismatch/main.cj` | DiagKind=sema_return_type_incompatible |
| TC-GENINST-PROPERTY-PARTIAL | property | P0 | `external/TC-GENINST-PROPERTY-PARTIAL/main.cj` | `cjc main.cj --diagnostic-format json` DiagKind=sema_property_must_have_accessors |
| TC-GENINST-PROPERTY | property | P1 | `external/TC-GENINST-PROPERTY/main.cj` | `cjc main.cj -O0/-O2 -o p && ./p` |
| TC-GENINST-STATIC | static 泛型 | P0 | `external/TC-GENINST-STATIC/main.cj` | `cjc main.cj -O0/-O2 -o p && ./p` |
| TC-GENINST-ABSTRACT-CLASS | 抽象类上界 | P0 | `external/TC-GENINST-ABSTRACT-CLASS/{main,negative_part}.cj` | `cjc main.cj -O0/-O2 -o p && ./p` (negative_part.cj 编译拒绝) |
| TC-GENINST-RECEIVER-KIND | 接收者种类 | P0 | `external/TC-GENINST-RECEIVER-KIND/main.cj` | `cjc main.cj -O0/-O2 -o p && ./p` |
| TC-GENINST-O0-NATIVE | O0 原生 | P0 | `external/TC-GENINST-O0-NATIVE/main.cj` | `cjc main.cj -O0/-O2 -o p && ./p` |
| TC-GENINST-MULTI-PARENT | 多父冲突 | P0 | `external/TC-GENINST-MULTI-PARENT/{main,conflict_part}.cj` | `cjc main.cj -O0/-O2 -o p && ./p` (conflict_part.cj 编译拒绝) |
| TC-GENINST-CROSS-PACKAGE | 跨包隔离 | P1 | `external/TC-GENINST-CROSS-PACKAGE/` (pkg_a/a.cj + pkg_b/main.cj + package.toml + run.sh) | `cd ... && bash run.sh` (cjpm build && run) |
| TC-GENINST-OVERRODE | 等价回归 | P1 | `external/TC-GENINST-OVERRODE/main.cj` | `cjc main.cj -O0/-O2 -o p && ./p` |

## 目录结构

```
testcases/
├── dfx_case7_covariant/main.cj          # DFX7 协变返回
├── dfx_case9_lazyseq/main.cj            # DFX9 实例化指向
├── issue843/main.cj + run.sh            # issue#843 -O2 修复
├── six_step_seed/                        # 六步种子 9 个 + run_all.sh
│   ├── DFX_case1/  DFX_case1g/  DFX_case2/  DFX_case3/
│   ├── DFX_case4/  DFX_case5/  DFX_case6/  DFX_case8/
│   └── GENINST_issue843/
├── relation_matrix/                      # 关系矩阵(成员函数)26 条 + run_all.sh
│   ├── 01_interface_abstract_to_class/  ...  26_direct_unrelated_defaults/
├── property_matrix/                     # 关系矩阵(成员属性)27 条 + run_all.sh
│   ├── 01_interface_abstract_to_class/  ...  27_diamond_default_conflict/
├── negative/                             # 负向 7 个 + run_all.sh
│   ├── NEG_abstract_unimpl/  NEG_sig_conflict/  NEG_generic_constraint/
│   ├── NEG_diamond_default_conflict/  NEG_unrelated_extend_conflict/
│   └── NEG_static_instance_clash/  NEG_generic_mismatch/
└── external/                             # 外部专项 9 个 TC
    ├── TC-GENINST-STATIC/                # 单文件
    ├── TC-GENINST-RECEIVER-KIND/         # 单文件
    ├── TC-GENINST-O0-NATIVE/             # 单文件
    ├── TC-GENINST-PROPERTY/              # 单文件
    ├── TC-GENINST-PROPERTY-PARTIAL/      # 单文件(负向)
    ├── TC-GENINST-OVERRODE/             # 单文件
    ├── TC-GENINST-ABSTRACT-CLASS/        # 双文件(正向+负向)
    ├── TC-GENINST-MULTI-PARENT/          # 双文件(正向+负向)
    └── TC-GENINST-CROSS-PACKAGE/         # 多包工程骨架
        ├── package.toml  pkg_a/a.cj  pkg_b/main.cj  run.sh
```

## 文件统计

- .cj 源码: 84 个
- 运行脚本: 6 个 (six_step_seed/run_all.sh, issue843/run.sh, negative/run_all.sh, relation_matrix/run_all.sh, property_matrix/run_all.sh, external/TC-GENINST-CROSS-PACKAGE/run.sh)
- 工程配置: 1 个 (TC-GENINST-CROSS-PACKAGE/package.toml)
- 合计: 91 个文件

## 复现命令

```bash
# 六步种子:9 个种子 O0/O2 双跑,断言 TRACE_OK
cd six_step_seed && bash run_all.sh

# issue#843:-O2 断言无 undefined symbol
cd issue843 && bash run.sh

# 负向:7 条断言编译失败 + DiagKind 匹配
cd negative && bash run_all.sh

# 关系矩阵(成员函数):23 正向 O0/O2 双跑 + 3 负向 DiagKind
cd relation_matrix && bash run_all.sh

# 关系矩阵(成员属性):24 正向 unittest O0/O2 双跑(PASSED:1 FAILED:0) + 3 负向 DiagKind
cd property_matrix && bash run_all.sh

# 单文件外部用例
cjc external/TC-GENINST-RECEIVER-KIND/main.cj -O0 -o p && ./p
cjc external/TC-GENINST-PROPERTY/main.cj -O2 -o p && ./p

# 跨包工程:cjpm build && cjpm run
cd external/TC-GENINST-CROSS-PACKAGE && bash run.sh
```

> 注:本镜像仅含设计 23 个 TC 引用的用例源码。`testcases/` 原目录下另有 stray 旧目录(extend_resolution/six_step_seed_genfunc/skip_strategy 等)未被设计引用,未纳入本镜像。
