// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: scan-not Expect Failed

import std.unittest.*
import std.unittest.testmacro.*
import std.sync.*

@Test
func test() {
    var a = (1024)
    let arr: Array<String> = ["a", "b", "c", "d", "e", "f"]
    var str = "A"
    for (i in 0..arr.size) {
        str += arr[i]
    }
    @Expect(str, "Aabcdef")
}
