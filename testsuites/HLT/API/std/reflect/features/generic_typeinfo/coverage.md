# class_GenericTypeInfo 覆盖率报告

> Rule 驱动生成（design: test_designs/std/reflect/class_GenericTypeInfo）

## 1. 汇总

| 指标 | 值 |
|---|---|
| 测试用例（TC.cj） | 9 |
| design criterion 目标 | 27（17 Valid + 10 Invalid）|
| model 覆盖 | 26 |
| 对账结果 | ❌ 1 gap |

## 2. 用例清单（逐 TC 覆盖 criterion 数）

### test_gti_global — std.reflect — GenericTypeInfo (全局)（5 TC）

| TC | 场景 | 覆盖 criterion 数 |
|---|---|---|
| TC-0 | catalog-driven global generic host: id + Acquire via findGfunc(name).genericParams[0] | 21 |
| TC-1 | catalog-driven global generic host: id + Acquire via getFunction(name, [genericTypeInfo]) | 21 |
| TC-2 | catalog-driven global generic host: pick + Acquire via findGfunc(name).genericParams[0] | 21 |
| TC-3 | catalog-driven global generic host: zip + Acquire via findGfunc(name).genericParams[0] | 21 |
| TC-4 | catalog-driven global generic host: zip + Acquire via getFunction(name, [genericTypeInfo]) | 21 |

### test_gti_member — std.reflect — GenericTypeInfo (成员)（2 TC）

| TC | 场景 | 覆盖 criterion 数 |
|---|---|---|
| TC-0 | InstanceFunctionInfo host: GtiGenHolder.gtiGenInst<T> + Acquire via findGmethod(name).genericParams[0] | 21 |
| TC-1 | StaticFunctionInfo host: GtiGenStatic.gtiGenPair<K,V> + Acquire via findGsmethod(name).genericParams[0] | 21 |

### test_gti_negative — std.reflect — GenericTypeInfo (负面)（2 TC）

| TC | 场景 | 覆盖 criterion 数 |
|---|---|---|
| TC-0 | non-generic global genericParams throws InfoNotFoundException (doc L3092) | 1 |
| TC-1 | member queries throw InfoNotFoundException | 4 |

## 3. 覆盖对账明细

未覆盖 criterion（1）：

- ✗ reflect/ec/GenericTypeInfo/superInterfaces

## 4. 已知 doc-vs-cjc 差异（预期 FAIL 保留 / 环境不可构造裁剪）

- `reflect/invalid/constraint/gti_generic_params_non_generic`：文档 L3092 承诺非泛型函数 genericParams 抛 InfoNotFoundException，cjc 1.2.0 实际返回空集合（probe X1 复核）→ test_gti_negative 用例预期 FAIL，为被测缺陷证据（铁律 2）。
- `reflect/ec/GenericTypeInfo/superInterfaces`：文档 L13434 承诺返回接口集合（含 Any），cjc 1.2.0 对 GenericTypeInfo 访问该属性【无限挂起】（main/unittest均复现，最小复现 problem/gti_superinterfaces_hang_minimal.cj）——断言无法产生结果，model 层裁剪该条消费，对账呈现为 1 条已知 gap。
- 约束泛型函数（pick<T> where T <: Iface）的 getFunction 反查：文档 L2998 手法应可用，cjc 1.2.0 实际抛 InfoNotFoundException（最小复现 problem/gti_constrained_generic_getfunction_notfound_minimal.cj）——model 层裁剪 pick × byGetFunction 组合 + gtiSameExpr 退化（Global_pick TC 仍覆盖）。
- 泛型形参限定名不绑定宿主：id<T> 的 T 与 pick<T> 的 T qualifiedName 均为 "T"，== 为 true（文档 L2961 基于限定名称相等的推论）——design 层 ==/!= 差异 rule已修正为【不同名称】泛型形参间比较。

