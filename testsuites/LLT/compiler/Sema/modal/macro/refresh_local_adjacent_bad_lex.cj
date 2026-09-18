// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: %n.macro.cj
// EXEC: %compiler %cmp_macro %n.macro.cj
// EXEC-PIPE-1: %run_macro %compiler %f %diag_json -Woff all 2>&1 | compare %f

import refresh_local_adjacent_bad_lex_macro.*

@EmitSpacedSuffix
func _Placeholder() {}

// ASSERT: scan "DiagKind": "parse_expected_character",
