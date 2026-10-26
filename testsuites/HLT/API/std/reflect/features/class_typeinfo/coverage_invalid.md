# Coverage Report: std.reflect — ClassTypeInfo (InvalidCriterion)

## Summary

| Metric | Value |
|--------|-------|
| Total Rules | 19 |
| Covered | 13 |
| Gaps | 6 |
| Coverage Rate | 68% |

## Coverage by CriterionKind

| CriterionKind | Covered | Total | Rate |
|-------------|---------|-------|------|
| Constraint | 13 | 19 | 68% |

## Covered Features (13)

| Feature ID | Kind | Models | Methodologies |
|------------|------|--------|---------------|
| reflect/invalid/constraint/get_not_found | Constraint | ClassTypeInfo | invalid |
| reflect/invalid/constraint/get_non_class | Constraint | ClassTypeInfo | invalid |
| reflect/invalid/constraint/construct_mismatch | Constraint | ClassTypeInfo | invalid |
| reflect/invalid/constraint/construct_abstract | Constraint | ClassTypeInfo | invalid |
| reflect/invalid/constraint/get_constructor_missing | Constraint | ClassTypeInfo | invalid |
| reflect/invalid/constraint/get_instance_variable_missing | Constraint | ClassTypeInfo | invalid |
| reflect/invalid/constraint/get_static_variable_missing | Constraint | ClassTypeInfo | invalid |
| reflect/invalid/constraint/constructors_public_only | Constraint | ClassTypeInfo | invalid |
| reflect/invalid/constraint/no_inherited_members | Constraint | ClassTypeInfo | invalid |
| reflect/invalid/constraint/sealed_subclasses_self | Constraint | ClassTypeInfo | invalid |
| reflect/invalid/constraint/object_only_no_super | Constraint | ClassTypeInfo | invalid |
| reflect/invalid/constraint/abstract_has_open_semantics | Constraint | ClassTypeInfo | invalid |
| reflect/invalid/constraint/macos_ios_unsupported | Constraint | ClassTypeInfo | invalid |

## Gaps (6)

| Feature ID | Kind | Category | Description |
|------------|------|----------|-------------|
| reflect/invalid/constraint/of_any_not_found | Constraint | invalid_ClassTypeInfo | ClassTypeInfo.of(Any) 无法获取运行时类型 → InfoNotFoundException |
| reflect/invalid/constraint/of_any_non_class | Constraint | invalid_ClassTypeInfo | ClassTypeInfo.of(Any) 运行时类型不是 class → IllegalTypeException |
| reflect/invalid/constraint/of_object_not_found | Constraint | invalid_ClassTypeInfo | ClassTypeInfo.of(Object) 无法获取运行时类型 → InfoNotFoundException |
| reflect/invalid/constraint/of_t_not_found | Constraint | invalid_ClassTypeInfo | ClassTypeInfo.of<T>() 无法获取 T 类型 → InfoNotFoundException |
| reflect/invalid/constraint/of_t_non_class | Constraint | invalid_ClassTypeInfo | ClassTypeInfo.of<T>() T 不是 class 类型 → IllegalTypeException |
| reflect/invalid/constraint/construct_invocation | Constraint | invalid_ClassTypeInfo | ClassTypeInfo.construct 构造体内部异常 → InvocationTargetException |

