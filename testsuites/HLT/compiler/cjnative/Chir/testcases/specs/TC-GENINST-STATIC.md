# TC-GENINST-STATIC — interface static 泛型

| 字段 | 值 |
|---|---|
| TC ID | TC-GENINST-STATIC |
| 场景 | interface_static_generic |
| 分组 | static_member |
| 优先级 | P0 |
| 范围 | External |
| 需求追溯 | design-spec §3(static 成员定位规则)/§7;具体类型 static 实现被选中 |
| 覆盖准则 | externalFixture(name: "interface_static_generic") |

## 命令
```
cjc testcases/external/TC-GENINST-STATIC/main.cj -O0 -o p && ./p
cjc testcases/external/TC-GENINST-STATIC/main.cj -O2 -o p && ./p
```

## 预期
- 具体类型 static 实现被选中。
- 两个优化级别均成功链接运行。
- 无 undefined symbol。

## 测试步骤
1. 构造 interface 带 static 泛型成员 + class 提供 static 实现。
2. -O0/-O2 编译链接运行。
3. 断言 static 调用选取具体类型实现。

## 说明
对应 NEG_static_instance_clash 的正向侧:static/实例一致时合法选取。
