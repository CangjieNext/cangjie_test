// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %f -o %output
// ASSERT : scan expected declaration here

internal import test.*

main(): Int64 {
    var fsum = @callTest {a:Int32, b:Int32 => a + b}
    var sum = fsum(2,3)
    if (sum != 5) {
        return 1
    }
    print("test lambda expr call macro success\n")
    return 0
}
