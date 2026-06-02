// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %diag_json %f -o %output
// ASSERT: scan parse_unexpected_declaration_in_scope
// ASSERT: scan the error originates in the macro `B3` (consider using `--debug-macro` for more info)

import test.*

enum EB2 {
    | @B3
    RR3(Int64)
}

main() {
}

