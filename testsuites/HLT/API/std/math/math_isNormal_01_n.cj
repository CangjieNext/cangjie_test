/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: caserunner.cj
// EXEC: %compiler %cmp_opt %f caserunner.cj -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not AssertionError
// ASSERT: scan-not Exception
import std.math.*

main() {
    var m1: Float16 = 3.876575
    var m2: Float32 = 3.876575
    var m3: Float64 = 3.876575
    CaseRunner<Bool>().runCases(
        [
            (m1.isNormal(), true),
            (m2.isNormal(), true),
            (m3.isNormal(), true)
        ],
        description: "入参既不是0,无穷,也不是nan"
    )
    CaseRunner<Bool>().runCases(
        [
            (Float16(0).isNormal(), false),
            (Float16(-0).isNormal(), false),
            (Float32(0).isNormal(), false),
            (Float32(-0).isNormal(), false),
            (Float64(0).isNormal(), false),
            (Float64(-0).isNormal(), false)
        ],
        description: "入参是0，返回false",
        checktype: "AssertFalse"
    )
    CaseRunner<Bool>().runCases(
        [
            (nan16.isNormal(), false),
            ((-nan16).isNormal(), false),
            (nan32.isNormal(), false),
            ((-nan32).isNormal(), false),
            (nan64.isNormal(), false),
            ((-nan64).isNormal(), false)
        ],
        description: "入参是nan，返回false",
        checktype: "AssertFalse"
    )
    CaseRunner<Bool>().runCases(
        [
            (inf16.isNormal(), false),
            ((-inf16).isNormal(), false),
            (inf32.isNormal(), false),
            ((-inf32).isNormal(), false),
            (inf64.isNormal(), false),
            ((-inf64).isNormal(), false)
        ],
        description: "入参是inf，返回false",
        checktype: "AssertFalse"
    )
    return 0
}
