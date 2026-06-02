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

enum TimeUnit {
    Year(Float32)
    | Month(Float32, Float32)
    | Day(Float32, Float32, Float32)
    | Hour(Float32, Float32, Float32, Float32)
}

@Test
func test() {
    match {
        case true => "true"
        case _ => "false"
    }
    var result = match (80) {
        case 60 => "pass"
        case good => "pass"
        case _ => "other"
    }
    @Expect(result, "pass")

    let a = (1, (), (), 3)
    var result1 = match (a) {
        case (b, c, d, e) => "b=${b} e=${e}"
        case _ => ""
    }
    @Expect(result1, "b=1 e=3")

    var result2: String = match (TimeUnit.Year(1.0)) {
        case a => "Yes"
        case Year(y) => "Yes2"
        case _ => "None"
    }
    @Expect(result2, "Yes")

    var i: Int8 = 0
    var res = match (i) {
        case _: Int8 => 0
        case _ => 1
    }
    @Expect(res, 0)
}
