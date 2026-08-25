# TC-GENINST-RECEIVER-KIND — struct/enum 接收者

| 字段 | 值 |
|---|---|
| TC ID | TC-GENINST-RECEIVER-KIND |
| 场景 | struct_enum_receiver |
| 分组 | receiver_kind |
| 优先级 | P0 |
| 范围 | External |
| 需求追溯 | design-spec §3/§7;值类型接收者选取正确直接/扩展实现 |
| 覆盖准则 | externalFixture(name: "struct_enum_receiver") |

## 命令
```
cjc testcases/external/TC-GENINST-RECEIVER-KIND/main.cj -O0 -o p && ./p
cjc testcases/external/TC-GENINST-RECEIVER-KIND/main.cj -O2 -o p && ./p
```

## 预期
- 值类型(struct/enum)接收者选取正确的直接或扩展实现。
- -O0/-O2 trace 一致。

## 测试步骤
1. 构造 struct 直接实现 + struct extend 实现 + enum 实现。
2. -O0/-O2 编译链接运行。
3. 断言 trace 一致。

## 说明
本用例覆盖 class 之外的值类型接收者形态;struct 直接实现、struct extend 实现、enum 实现各一份。
