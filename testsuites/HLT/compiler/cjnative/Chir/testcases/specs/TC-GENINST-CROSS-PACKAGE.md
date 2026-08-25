# TC-GENINST-CROSS-PACKAGE — 跨包扩展/缓存隔离

| 字段 | 值 |
|---|---|
| TC ID | TC-GENINST-CROSS-PACKAGE |
| 场景 | cross_package_extension |
| 分组 | whitebox |
| 优先级 | P1 |
| 范围 | Manual |
| 需求追溯 | design-spec §3(包可见性/orphan 规则)/§6 可靠性(跨包不串) |
| 覆盖准则 | manualScenario(name: "cross_package_extension") |

## 命令
```
cd testcases/external/TC-GENINST-CROSS-PACKAGE && cjpm build && cjpm run   # 预期输出 TRACE_OK
```

## 预期
- 包可见性正确(orphan 规则)。
- 缓存重置不复用陈旧实例化成员。

## 测试步骤
1. 构造多包扩展 + orphan 成员 fixture。
2. 验证包可见性边界。
3. 验证 ClearCache 后跨包不脏命中旧值。

## 说明
本用例为最小多包工程骨架(pkg_a + pkg_b),验证跨包按需查询命中各自包的实例化版本。Manual。
