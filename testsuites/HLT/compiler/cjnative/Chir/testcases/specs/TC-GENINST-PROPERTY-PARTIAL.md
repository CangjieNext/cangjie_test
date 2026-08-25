# TC-GENINST-PROPERTY-PARTIAL — getter/setter 部分重写

| 字段 | 值 |
|---|---|
| TC ID | TC-GENINST-PROPERTY-PARTIAL |
| 场景 | property_partial_override |
| 分组 | property |
| 优先级 | P0 |
| 范围 | External |
| 需求追溯 | design-spec §7 DFX(property);getter/setter 独立解析(getter_setter_independent) |
| 覆盖准则 | externalFixture(name: "property_partial_override") |

## 命令
```
cjc testcases/external/TC-GENINST-PROPERTY-PARTIAL/main.cj --diagnostic-format json -o p   # 预期编译失败，DiagKind=sema_property_must_have_accessors
```

## 预期
- getter/setter 分别独立解析。
- 未重写的一侧保持父实现。
- 非法 mut/类型变更在编译期拒绝。

## 测试步骤
1. 构造 interface prop(带 getter/setter)+ class 只重写 getter。
2. 实例化 + 重排。
3. 断言 getter 指向子类版本、setter 指向父类版本。
4. 构造非法 mut/类型变更,断言编译期拒绝。

## 说明
仓颉编译器 1.3.0 实测要求属性必须同时实现 getter 与 setter,仅重写一侧编译失败,诊断种类为属性必须有访问器。全重写正向侧见 TC-GENINST-PROPERTY。
