// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %diag_json %f -o %output
// ASSERT: scan-1 parse_expected_character
// ASSERT: scan the error originates in the macro `callTest` (consider using `--debug-macro` for more info)

import test.*

main(): Int64 {
    // test vardecl initializer callmacro return binaryexpr tokens
    var a: Int32 = @callTest(1 + 2)
    if (a != 3) {
        print("test vardecl init call macro failed\n")
        return 1
    }

    // test assign expr callmacro return two expr tokens
    a = @callTest(1 2)
    if (a != 1) {
        print("test assign expr call macro failed\n")
        return 1
    }

    return 0
}
