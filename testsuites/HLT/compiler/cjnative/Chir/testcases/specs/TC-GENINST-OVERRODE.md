# TC-GENINST-OVERRODE — overrode_by_diff_inst 回归

| 字段 | 值 |
|---|---|
| TC ID | TC-GENINST-OVERRODE |
| 场景 | overrode_by_diff_inst04 |
| 分组 | regression_manual |
| 优先级 | P1 |
| 范围 | External |
| 需求追溯 | design-spec §6 兼容性(移除全局 map 后不同实例化声明覆盖等价) |
| 覆盖准则 | manualScenario(name: "overrode_by_diff_inst04") |

## 命令
```
cjc testcases/external/TC-GENINST-OVERRODE/main.cj -O0 -o p && ./p
cjc testcases/external/TC-GENINST-OVERRODE/main.cj -O2 -o p && ./p
```

## 预期
- 不同实例化声明之间的覆盖结果保持等价。
- 无陈旧目标复用。

## 测试步骤
1. 取 overrode_by_diff_inst04 既有回归 fixture。
2. 全局 map 移除后重跑。
3. 断言覆盖结果等价、无陈旧复用。

## 说明
回归保护:验证重构(按需查询替代全局预构建)不改变既有覆盖语义。
