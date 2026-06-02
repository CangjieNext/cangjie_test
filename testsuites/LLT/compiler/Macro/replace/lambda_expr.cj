// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import test.*

main(): Int64 {
    let sum = {a: Int64, b: Int64 => @callTest(a + b)}
    if (sum(3, 4) != 7) {
        print("test lambda expr call macro failed\n")
        return 1
    }
    print("test lambda expr call macro success\n")
    return 0
}
