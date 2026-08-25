# TC-GENINST-ABSTRACT-CLASS — 抽象类上界实例化

| 字段 | 值 |
|---|---|
| TC ID | TC-GENINST-ABSTRACT-CLASS |
| 场景 | abstract_class_bound |
| 分组 | abstract_class |
| 优先级 | P0 |
| 范围 | External |
| 需求追溯 | design-spec §3(abstract class 延迟实现)/§7;abstract_parent_to_concrete_subclass |
| 覆盖准则 | externalFixture(name: "abstract_class_bound") |

## 命令
```
cjc testcases/external/TC-GENINST-ABSTRACT-CLASS/main.cj -O0 -o p && ./p
cjc testcases/external/TC-GENINST-ABSTRACT-CLASS/main.cj -O2 -o p && ./p
cjc testcases/external/TC-GENINST-ABSTRACT-CLASS/negative_part.cj --diagnostic-format json -o pn   # 预期编译失败
```

## 预期
- instantiated call 选取具体子类实现。
- 不完整子类被拒绝。

## 测试步骤
1. 构造 abstract class 上界 + 具体子类实现 + 不完整子类。
2. -O0/-O2 编译。
3. 断言具体子类选取正确;不完整子类编译失败。

## 说明
覆盖六步②父类在抽象类上界场景下的延迟实现路径。
