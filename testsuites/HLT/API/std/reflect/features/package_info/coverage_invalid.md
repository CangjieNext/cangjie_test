# Coverage Report: std.reflect — PackageInfo (InvalidCriterion)

## Summary

| Metric | Value |
|--------|-------|
| Total Rules | 19 |
| Covered | 17 |
| Gaps | 2 |
| Coverage Rate | 89% |

## Coverage by CriterionKind

| CriterionKind | Covered | Total | Rate |
|-------------|---------|-------|------|
| Constraint | 17 | 19 | 89% |

## Covered Features (17)

| Feature ID | Kind | Models | Methodologies |
|------------|------|--------|---------------|
| reflect/invalid/constraint/pkg_get_notfound | Constraint | std.reflect — PackageInfo (negative) | invalid |
| reflect/invalid/constraint/pkg_load_badpath | Constraint | std.reflect — PackageInfo (load) | invalid |
| reflect/invalid/constraint/pkg_load_duplicate | Constraint | std.reflect — PackageInfo (load) | invalid |
| reflect/invalid/constraint/pkg_parent_notfound | Constraint | std.reflect — PackageInfo (negative) | invalid |
| reflect/invalid/constraint/pkg_root_notfound | Constraint | std.reflect — PackageInfo (negative) | invalid |
| reflect/invalid/constraint/pkg_getfunc_notfound | Constraint | std.reflect — PackageInfo (negative) | invalid |
| reflect/invalid/constraint/pkg_getsubpackage_notfound | Constraint | std.reflect — PackageInfo (negative) | invalid |
| reflect/invalid/constraint/pkg_getsubpackage_badname | Constraint | std.reflect — PackageInfo (negative) | invalid |
| reflect/invalid/constraint/pkg_gettypeinfo_notfound | Constraint | std.reflect — PackageInfo (negative) | invalid |
| reflect/invalid/constraint/pkg_getvariable_notfound | Constraint | std.reflect — PackageInfo (negative) | invalid |
| reflect/invalid/constraint/pkg_version_empty | Constraint | std.reflect — PackageInfo (info) | invalid |
| reflect/invalid/constraint/pkg_orgname_empty | Constraint | std.reflect — PackageInfo (info) | invalid |
| reflect/invalid/constraint/pkg_subpackages_loaded_only | Constraint | std.reflect — PackageInfo (info) | invalid |
| reflect/invalid/constraint/pkg_name_no_prefix | Constraint | std.reflect — PackageInfo (info) | invalid |
| reflect/invalid/constraint/pkg_static_dynamic_conflict | Constraint | std.reflect — PackageInfo (load) | invalid |
| reflect/invalid/constraint/pkg_no_traversal_order | Constraint | std.reflect — PackageInfo (info) | invalid |
| reflect/invalid/constraint/pkg_platform_unsupported | Constraint | std.reflect — PackageInfo (info) | invalid |

## Gaps (2)

| Feature ID | Kind | Category | Description |
|------------|------|----------|-------------|
| reflect/invalid/constraint/pkg_load_fail | Constraint | invalid_reflect | load(path) 共享库加载失败抛 ReflectException |
| reflect/invalid/constraint/pkg_load_multi_package | Constraint | invalid_reflect | load(path) 动态库内部存在多个 Package 抛 ReflectException |

