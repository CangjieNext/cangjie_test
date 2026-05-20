// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Coverage: invalid --cfg=APILevel_level values.
// ParseOption in PluginCustomAnnoChecker emits sema_apilevel_invalid_version_format
// for cfg values that do not match the expected format.
// The @IfAvailable below also emits sema_use_expr_without_import (error),
// guaranteeing a non-zero exit code so ERRCHECK is satisfied.
//
// Three representative bad formats are checked across three ERRCHECK steps:
//   24.5     (2-segment: minor present, patch absent - ambiguous)
//   abc      (non-numeric)
//   24.0.0.0 (4-segment: too many components)
//
// Each step produces 2 sema_apilevel_invalid_version_format occurrences:
// one from the @IfAvailable(level:"20") literal and one from the bad cfg value.

// ERRCHECK: %compiler %cmp_opt %diag_json %f -o %output --cfg=APILevel_level=24.5
// ASSERT: scan-2 sema_apilevel_invalid_version_format
// ERRCHECK: %compiler %cmp_opt %diag_json %f -o %output --cfg=APILevel_level=abc
// ASSERT: scan-2 sema_apilevel_invalid_version_format
// ERRCHECK: %compiler %cmp_opt %diag_json %f -o %output --cfg=APILevel_level=24.0.0.0
// ASSERT: scan-2 sema_apilevel_invalid_version_format

main(): Int64 {
    // sema_use_expr_without_import (error) ensures exit_code=1 for each ERRCHECK
    // sema_apilevel_invalid_version_format (error) from the "20" string literal
    @IfAvailable(level: "20", { => 1 }, { => 0 })
    0
}
