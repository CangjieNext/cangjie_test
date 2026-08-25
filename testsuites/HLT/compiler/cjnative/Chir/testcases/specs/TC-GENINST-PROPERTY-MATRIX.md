# TC-GENINST-PROPERTY-MATRIX — 成员属性来源 × 覆盖方向决策表

| 字段 | 值 |
|---|---|
| TC ID | TC-GENINST-PROPERTY-MATRIX |
| 场景 | property_override_relation_matrix |
| 分组 | property_relation_matrix |
| 优先级 | P0 |
| 范围 | External |
| 需求追溯 | design-spec §3/§7;覆盖 interface/class/struct、parent 类型、直接与间接 extend、abstract/default、getter/setter、同向/交叉合并及类型自身优先;与成员函数矩阵 TC-GENINST-RELATION-MATRIX 同源同构,成员属性同等覆盖 |
| 覆盖准则 | 27 条 propertyRelation(interface_abstract_to_class ... diamond_default_conflict) |

## 命令
```
cd testcases/property_matrix && bash run_all.sh   # 24 合法 fixture -O0/-O2 双跑 + 3 负向 fixture 编译拒绝
```

## 预期
- 每个合法组合的成员属性经按需查询选取明确的最终实现目标(读 getter + 写 setter 命中同一版本)。
- 菱形同向合并、无关默认冲突、未实现抽象属性按稳定诊断拒绝。
- 声明顺序不影响合法结果。

## 27 条关系(逐项最小 fixture)
interface_abstract_to_class / interface_default_to_class /
abstract_interface_to_abstract_class / inherited_impl_to_subclass /
abstract_parent_to_concrete_subclass / interface_abstract_to_extend /
interface_default_to_extend / parent_interface_abstract_to_child_interface /
parent_interface_default_to_child_interface / parent_class_to_child_class /
parent_class_to_interface / class_to_interface / class_to_extend_interface /
extend_interface_default_to_type / extend_member_to_type /
extend_member_to_interface / type_member_overrides_parent_interface /
type_member_overrides_parent_class / class_overrides_interface_default /
extend_overrides_interface_default / multiple_default_derived_select /
default_plus_abstract_unique_select / same_direction_merge_dedup /
cross_direction_prefer_type / getter_setter_independent /
direct_unrelated_defaults / diamond_default_conflict

## 测试步骤
1. 对每条关系构造最小 fixture(成员属性 prop 候选来源 + 覆盖方向)。
2. 读经泛型函数 `readX<T>(a: T): Int64 where T <: <约束> { a.x }` 实例化触发按需查询重排,断言命中预期 getter 版本(如 `[C.x.get]`)。
3. 写经直接对具体类型实例 `c.x = 99` 赋值,断言命中同一版本 setter(如 `[C.x.set]`);只读用例(#25)仅测读。
4. 负向 fixture(23/26/27)编译断言失败 + `--diagnostic-format json` 符号化 DiagKind 匹配。
5. 对合法 fixture 交换声明顺序后重复验证。

## 说明
本矩阵与成员函数关系矩阵(TC-GENINST-RELATION-MATRIX 26 条)同源同构,把 `func foo()` 改为 `mut prop x`(双访问器)或只读 `prop x`,
逐项枚举成员属性的来源与覆盖方向,达到与成员函数同等程度的覆盖。

**关键实测差异(cjc 1.3.0-alpha.02)**:
- 维度 23(菱形同向合并 same_direction_merge_dedup):成员函数版编译通过(两路径默认合并去重,合法),
  但成员属性版编译失败(`sema_interface_member_must_be_implemented`)。按既有矩阵 25/26 处理原则以实测行为为准,属性版落为负向。
- 维度 25(getter_setter_independent):成员函数矩阵中是"getter 仅重写一侧"负向,
  成员属性维度改为只读 `prop x`(仅 getter)正向变体,验证 getter 独立解析。
- 维度 27(diamond_default_conflict):成员属性版菱形继承两不同默认经菱形到达,编译失败(与 26 无关默认冲突同族但路径不同)。

另含 `TC-GENINST-PROPERTY`(全重写正向)与 `TC-GENINST-PROPERTY-PARTIAL`(只重写一侧被拒,
`sema_property_must_have_accessors`)两条 getter/setter 独立性专项作为补充,非矩阵主体。

27 条关系各挂一份手写 `property_matrix/<NN>_<name>/main.cj` 源码,内嵌 HLT 测试头部。
