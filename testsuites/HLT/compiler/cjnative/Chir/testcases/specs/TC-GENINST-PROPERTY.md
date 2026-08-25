# TC-GENINST-PROPERTY — property getter/setter 重排

| 字段 | 值 |
|---|---|
| TC ID | TC-GENINST-PROPERTY |
| 场景 | property_getter_setter |
| 分组 | property |
| 优先级 | P1 |
| 范围 | External |
| 需求追溯 | design-spec §7 DFX(property 重排);dt-design 耦合场景(WorkForMembers 跨模块复用) |
| 覆盖准则 | propertyReorder(name: "getter_setter") |

## 命令
```
cjc testcases/external/TC-GENINST-PROPERTY/main.cj -O0 -o p && ./p
cjc testcases/external/TC-GENINST-PROPERTY/main.cj -O2 -o p && ./p
```

## 预期
- getter/setter 经 WorkForMembers(自 ImplUtils.h 迁至 TypeCheckUtil.h)重排后读写值正确。
- -O0/-O2 行为一致。

## 测试步骤
1. interface prop + class 实现 prop。
2. 实例化 + 重排。
3. 断言 getter/setter 指向实例化类对应版本。
4. -O0/-O2 对照行为一致。

## 说明
抽象成员为 prop 时重排正确,属多文件用例/白盒入口,External。GAP:不属自动化模型。
