// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC:%compiler %debugCHIROpt %enableO2 %disableConstPropagation %f -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC:%run %run_opt %output

func foo() {
    1 << 1
}

main() {
    let v1 = Int16(0x1122)
    let v2 = Int64(0x1122)
    let res0 = Int32(v1) == Int32(v2)

    let v3 = UInt16(0x1122)
    let v4 = UInt64(0x1122)
    let res1 = UInt32(v3) != UInt32(v4)

    let v5 = Int16(foo())
    let v6 = Int64(v5)
    let res2 = Int32(v5) == Int32(v6)

    let r1 = UInt64(0xffffffff)
    if (UInt32(r1) >= UInt32(r1) - 1) {
        print(2)
    } else {
        print(3)
    }

    let r2 = Int64(0x7fffffff)
    if (Int32(r2) < Int32(r2) - 1) {
        print(4)
    } else {
        print(5)
    }

    let a = Int8(foo())
    let b = Int16(foo())
    let c = Int32(foo())
    let d = Int64(foo())
    let res3 = Int16(a) > b // int8 min/max compared to int16 min/max
    let res4 = c > Int32(d)

    return
}

// ASSERT: scan [RangeAnalysis] The value of Equal at [17,16] has been set to true
// ASSERT: scan [RangeAnalysis] The value of NotEqual at [21,16] has been set to false
// ASSERT: regex-not \[RangeAnalysis\].*EQUAL.*\[25,16\]
// ASSERT: scan [RangeAnalysis] The value of GE at [28,9] has been set to true
// ASSERT: scan [RangeAnalysis] The value of LT at [35,9] has been set to false
// ASSERT: regex-not \[RangeAnalysis\].*GT.*\[45,16\]
// ASSERT: regex-not \[RangeAnalysis\].*\[46,16\]
// ASSERT: regex-not core dumped
