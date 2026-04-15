// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macroFoo.cj
// EXEC: %compiler %cmp_macro macroFoo.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %diag_json %f -o %output
// ASSERT: scan-1 parse_expected_expression
// ASSERT: scan the error originates in the macro `Foo` (consider using `--debug-macro` for more info)

import pkg1.*

main(): Int64 {
    var a: Int64 = @Foo[1+))))](2+3)
}
