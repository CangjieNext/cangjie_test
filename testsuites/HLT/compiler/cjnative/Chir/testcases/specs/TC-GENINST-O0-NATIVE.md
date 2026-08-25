# TC-GENINST-O0-NATIVE — O0 原生按需实例化

| 字段 | 值 |
|---|---|
| TC ID | TC-GENINST-O0-NATIVE |
| 场景 | o0_native_receiver |
| 分组 | optimization_boundary |
| 优先级 | P0 |
| 范围 | External |
| 需求追溯 | design-spec §6 兼容性(O0 仍按需查询重排)/§2 关键流程 |
| 覆盖准则 | externalFixture(name: "o0_native_receiver") |

## 命令
```
cjc testcases/external/TC-GENINST-O0-NATIVE/main.cj -O0 -o p && ./p
cjc testcases/external/TC-GENINST-O0-NATIVE/main.cj -O2 -o p && ./p
```

## 预期
- O0 原生路径(CPointer 等按需实例化)链接运行成功。
- 与 O2 可观察行为一致。

## 测试步骤
1. 构造 primitive/CPointer 按需实例化 fixture。
2. -O0/-O2 编译链接运行。
3. 断言两者行为一致。

## 说明
验证 O0 不开启泛型实例化时,CPointer 等仍按需查询重排(非全量预构建)。
