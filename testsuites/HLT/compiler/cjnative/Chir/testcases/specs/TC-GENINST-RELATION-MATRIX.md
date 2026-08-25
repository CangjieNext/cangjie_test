# TC-GENINST-RELATION-MATRIX — 成员来源 × 覆盖方向决策表

| 字段 | 值 |
|---|---|
| TC ID | TC-GENINST-RELATION-MATRIX |
| 场景 | override_relation_matrix |
| 分组 | override_relation_matrix |
| 优先级 | P0 |
| 范围 | External |
| 需求追溯 | design-spec §3/§7;覆盖 interface/class/struct/enum、parent 类型、直接与间接 extend、abstract/default、static/instance、getter/setter、同向/交叉合并及类型自身优先 |
| 覆盖准则 | 26 条 overrideRelation(interface_abstract_to_class ... direct_unrelated_defaults) |

## 命令
```
cd testcases/relation_matrix && bash run_all.sh   # 24 合法 fixture -O0/-O2 双跑 + 2 负向 fixture 编译拒绝
```

## 预期
- 每个合法组合选择明确的最终实现目标。
- 无父子关系的默认冲突、未实现抽象成员按稳定诊断拒绝。
- 声明顺序不影响合法结果。

## 26 条关系(逐项最小 fixture)
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
cross_direction_prefer_type / getter_setter_independent / direct_unrelated_defaults

## 测试步骤
1. 对每条关系构造最小 fixture(候选来源 + 覆盖方向)。
2. 记录候选来源、覆盖方向、最终 Decl/实例化目标或稳定 DiagKind。
3. 对合法 fixture 交换声明顺序后重复验证。

## 说明
矩阵覆盖面宽,跨多种类型种类与方向;逐条独立 fixture 更适合 External 验收,
二十六条关系各挂一份手写 `relation_matrix/<NN>_<name>/main.cj` 源码。
