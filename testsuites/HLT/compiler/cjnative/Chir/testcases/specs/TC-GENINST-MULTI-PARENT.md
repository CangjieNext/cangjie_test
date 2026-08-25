# TC-GENINST-MULTI-PARENT — 无关默认冲突/显式消歧

| 字段 | 值 |
|---|---|
| TC ID | TC-GENINST-MULTI-PARENT |
| 场景 | multi_parent_resolution |
| 分组 | interface_conflict |
| 优先级 | P0 |
| 范围 | External |
| 需求追溯 | design-spec §3(direct_unrelated_defaults)/§6;dt-design 异常用例3 |
| 覆盖准则 | externalFixture(name: "multi_parent_resolution") |

## 命令
```
cjc testcases/external/TC-GENINST-MULTI-PARENT/main.cj -O0 -o p && ./p          # 显式消歧正向：TRACE_OK
cjc testcases/external/TC-GENINST-MULTI-PARENT/conflict_part.cj --diagnostic-format json -o pn   # 无关默认冲突，预期编译失败
```

## 预期
- 无关默认冲突被拒绝(无显式实现时)。
- 显式实现被选取,与声明顺序无关。

## 测试步骤
1. 构造两无关接口各带同名默认 + class 共实现(无显式实现)→ 拒绝。
2. 构造同上但 class 提供显式实现 → 选取显式实现。
3. 交换声明顺序重复验证。

## 说明
对照 NEG_diamond_default_conflict(菱形形态)与 NEG_unrelated_extend_conflict(扩展遮蔽)。
