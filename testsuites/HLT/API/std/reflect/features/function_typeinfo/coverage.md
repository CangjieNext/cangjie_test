# FunctionTypeInfo 覆盖率报告

| 规格 | 内容 |
|------|------|
| 被测类 | std.reflect.FunctionTypeInfo |
| variant 总数 | 52 |
| design criterion 总数 | 28 |
| 已覆盖 criterion | 28（对账见下表） |

## criterion 覆盖明细

| Criterion | 状态 | 覆盖 variant 数 |
|---|---|---|
| reflect/ec/FunctionTypeInfo/parameters | ✅ | 38 |
| reflect/ec/FunctionTypeInfo/returnType | ✅ | 38 |
| reflect/ec/FunctionTypeInfo/of | ✅ | 52 |
| reflect/ec/FunctionTypeInfo/apply | ✅ | 39 |
| reflect/ec/FunctionTypeInfo/name | ✅ | 37 |
| reflect/ec/FunctionTypeInfo/qualifiedName | ✅ | 37 |
| reflect/ec/FunctionTypeInfo/annotations | ✅ | 37 |
| reflect/ec/FunctionTypeInfo/modifiers | ✅ | 37 |
| reflect/ec/FunctionTypeInfo/superInterfaces | ✅ | 37 |
| reflect/ec/FunctionTypeInfo/instanceFunctions | ✅ | 37 |
| reflect/ec/FunctionTypeInfo/instanceProperties | ✅ | 37 |
| reflect/ec/FunctionTypeInfo/staticFunctions | ✅ | 37 |
| reflect/ec/FunctionTypeInfo/staticProperties | ✅ | 37 |
| reflect/ec/FunctionTypeInfo/findAnnotation | ✅ | 37 |
| reflect/ec/FunctionTypeInfo/findAllAnnotations | ✅ | 37 |
| reflect/ec/FunctionTypeInfo/getAllAnnotations | ✅ | 37 |
| reflect/ec/FunctionTypeInfo/isSubtypeOf | ✅ | 37 |
| reflect/ec/FunctionTypeInfo/hashCode | ✅ | 37 |
| reflect/ec/FunctionTypeInfo/toString | ✅ | 37 |
| reflect/ec/FunctionTypeInfo/== | ✅ | 37 |
| reflect/ec/FunctionTypeInfo/!= | ✅ | 37 |
| reflect/invalid/constraint/fti_of_non_function | ✅ | 2 |
| reflect/invalid/constraint/fti_apply_argcount_mismatch | ✅ | 1 |
| reflect/invalid/constraint/fti_apply_argtype_mismatch | ✅ | 1 |
| reflect/invalid/constraint/fti_params_is_typeinfo | ✅ | 37 |
| reflect/invalid/constraint/fti_params_decl_order | ✅ | 37 |
| reflect/invalid/constraint/fti_no_members | ✅ | 37 |
| reflect/invalid/constraint/fti_platform_unsupported | ✅ | 37 |

## 对账结论

✅ 全部 28 个 criterion 已覆盖，无缺口。

## 各 model 覆盖概览

| Model | 输出目录 | variant 数 |
|---|---|---|
| std.reflect — FunctionTypeInfo (无参) | test_fti_zero | 8 |
| std.reflect — FunctionTypeInfo (单参) | test_fti_single | 13 |
| std.reflect — FunctionTypeInfo (多参) | test_fti_multi | 11 |
| std.reflect — FunctionTypeInfo (复合/嵌套) | test_fti_comp | 5 |
| std.reflect — FunctionTypeInfo (函数引用) | test_fti_ref | 6 |
| std.reflect — FunctionTypeInfo (泛型) | test_fti_generic | 4 |
| std.reflect — FunctionTypeInfo (泛型helper) | test_fti_ghelper | 1 |
| std.reflect — FunctionTypeInfo (异常) | test_fti_exc | 4 |
