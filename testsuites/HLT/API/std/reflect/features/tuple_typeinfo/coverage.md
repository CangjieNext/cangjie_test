# class_TupleTypeInfo 覆盖率报告

> Rule 驱动生成（design: test_designs/std/reflect/class_TupleTypeInfo）

## 1. 汇总

| 指标 | 值 |
|---|---|
| 测试用例（TC.cj） | 30 |
| design criterion 目标 | 33（24 Valid + 9 Invalid）|
| model 覆盖 | 33 |
| 对账结果 | ✅ 全部 criterion 已覆盖（0 gap）|

## 2. 用例清单（逐 TC 覆盖 criterion 数）

### test_tuple_basic — std.reflect — TupleTypeInfo (基础)（12 TC）

| TC | 场景 | 覆盖 criterion 数 |
|---|---|---|
| TC-0 | catalog-driven full-API: tpl_2_i64_str + Acquire via TupleTypeInfo.of(tuple literal) | 24 |
| TC-1 | catalog-driven full-API: tpl_2_i64_str + Acquire via TupleTypeInfo.of<(E1, E2)>() | 24 |
| TC-2 | catalog-driven full-API: tpl_2_i64_str + Acquire via TypeInfo.get(instantiated tuple qname) | 24 |
| TC-3 | catalog-driven full-API: tpl_2_i64_i64 + Acquire via TupleTypeInfo.of(tuple literal) | 24 |
| TC-4 | catalog-driven full-API: tpl_2_i64_i64 + Acquire via TupleTypeInfo.of<(E1, E2)>() | 24 |
| TC-5 | catalog-driven full-API: tpl_2_i64_i64 + Acquire via TypeInfo.get(instantiated tuple qname) | 24 |
| TC-6 | catalog-driven full-API: tpl_3_i64_str_bool + Acquire via TupleTypeInfo.of(tuple literal) | 24 |
| TC-7 | catalog-driven full-API: tpl_3_i64_str_bool + Acquire via TupleTypeInfo.of<(E1, E2)>() | 24 |
| TC-8 | catalog-driven full-API: tpl_3_i64_str_bool + Acquire via TypeInfo.get(instantiated tuple qname) | 24 |
| TC-9 | catalog-driven full-API: tpl_4_i64_str_bool_f64 + Acquire via TupleTypeInfo.of(tuple literal) | 24 |
| TC-10 | catalog-driven full-API: tpl_4_i64_str_bool_f64 + Acquire via TupleTypeInfo.of<(E1, E2)>() | 24 |
| TC-11 | catalog-driven full-API: tpl_4_i64_str_bool_f64 + Acquire via TypeInfo.get(instantiated tuple qname) | 24 |

### test_tuple_composite — std.reflect — TupleTypeInfo (复合)（12 TC）

| TC | 场景 | 覆盖 criterion 数 |
|---|---|---|
| TC-0 | catalog-driven full-API: tpl_2_arr_i64_str + Acquire via TupleTypeInfo.of(tuple literal) | 24 |
| TC-1 | catalog-driven full-API: tpl_2_arr_i64_str + Acquire via TupleTypeInfo.of<(E1, E2)>() | 24 |
| TC-2 | catalog-driven full-API: tpl_2_arr_i64_str + Acquire via TypeInfo.get(instantiated tuple qname) | 24 |
| TC-3 | catalog-driven full-API: tpl_2_i64_point + Acquire via TupleTypeInfo.of(tuple literal) | 24 |
| TC-4 | catalog-driven full-API: tpl_2_i64_point + Acquire via TupleTypeInfo.of<(E1, E2)>() | 24 |
| TC-5 | catalog-driven full-API: tpl_2_i64_point + Acquire via TypeInfo.get(instantiated tuple qname) | 24 |
| TC-6 | catalog-driven full-API: tpl_2_nested + Acquire via TupleTypeInfo.of(tuple literal) | 24 |
| TC-7 | catalog-driven full-API: tpl_2_nested + Acquire via TupleTypeInfo.of<(E1, E2)>() | 24 |
| TC-8 | catalog-driven full-API: tpl_2_nested + Acquire via TypeInfo.get(instantiated tuple qname) | 24 |
| TC-9 | catalog-driven full-API: tpl_3_point_nested_bool + Acquire via TupleTypeInfo.of(tuple literal) | 24 |
| TC-10 | catalog-driven full-API: tpl_3_point_nested_bool + Acquire via TupleTypeInfo.of<(E1, E2)>() | 24 |
| TC-11 | catalog-driven full-API: tpl_3_point_nested_bool + Acquire via TypeInfo.get(instantiated tuple qname) | 24 |

### test_tuple_negative — std.reflect — TupleTypeInfo (负面)（6 TC）

| TC | 场景 | 覆盖 criterion 数 |
|---|---|---|
| TC-0 | of(non-tuple instance) throws IllegalTypeException | 1 |
| TC-1 | of<Int64>() throws IllegalTypeException | 1 |
| TC-2 | construct(arg count mismatch) throws IllegalArgumentException | 1 |
| TC-3 | construct(arg type mismatch) throws IllegalTypeException | 1 |
| TC-4 | destruct(non-matching instance) throws IllegalTypeException | 1 |
| TC-5 | member queries throw InfoNotFoundException | 4 |

## 3. 覆盖对账明细

全部 33 条 criterion 已被 model 覆盖，无缺口。

