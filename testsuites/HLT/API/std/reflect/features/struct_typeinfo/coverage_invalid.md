# Coverage Report: std.reflect — StructTypeInfo (InvalidCriterion)

## Summary

| Metric | Value |
|--------|-------|
| Total Rules | 14 |
| Covered | 11 |
| Gaps | 3 |
| Coverage Rate | 78% |

## Coverage by CriterionKind

| CriterionKind | Covered | Total | Rate |
|-------------|---------|-------|------|
| Constraint | 11 | 14 | 78% |

## Covered Features (11)

| Feature ID | Kind | Models | Methodologies |
|------------|------|--------|---------------|
| reflect/invalid/constraint/get_not_found | Constraint | StructTypeInfo | invalid |
| reflect/invalid/constraint/get_non_struct | Constraint | StructTypeInfo | invalid |
| reflect/invalid/constraint/of_any_non_struct | Constraint | StructPhysical | invalid |
| reflect/invalid/constraint/of_t_non_struct | Constraint | StructPhysical | invalid |
| reflect/invalid/constraint/construct_mismatch | Constraint | StructTypeInfo | invalid |
| reflect/invalid/constraint/construct_invocation | Constraint | StructPhysical | invalid |
| reflect/invalid/constraint/get_constructor_missing | Constraint | StructTypeInfo | invalid |
| reflect/invalid/constraint/get_instance_variable_missing | Constraint | StructTypeInfo | invalid |
| reflect/invalid/constraint/get_static_variable_missing | Constraint | StructTypeInfo | invalid |
| reflect/invalid/constraint/constructors_public_only | Constraint | StructTypeInfo | invalid |
| reflect/invalid/constraint/struct_member_box_unbox | Constraint | StructPhysical | invalid |

## Gaps (3)

| Feature ID | Kind | Category | Description |
|------------|------|----------|-------------|
| reflect/invalid/constraint/of_any_not_found | Constraint | invalid_StructTypeInfo | StructTypeInfo.of(Any) 无法获取运行时类型 → InfoNotFoundException |
| reflect/invalid/constraint/of_t_not_found | Constraint | invalid_StructTypeInfo | StructTypeInfo.of<T>() 无法获取 T 类型 → InfoNotFoundException |
| reflect/invalid/constraint/macos_ios_unsupported | Constraint | invalid_StructTypeInfo | macOS/iOS 平台不支持反射 |

