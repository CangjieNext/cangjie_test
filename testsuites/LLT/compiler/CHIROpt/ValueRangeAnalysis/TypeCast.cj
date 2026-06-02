// (DEBUG_OPTION)EXEC:%compiler %debugCHIROpt %cmp_opt %enableO2 %disableConstPropagation %f -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC:%run %run_opt %output

main(): Unit {
    let a = Int32(7)
    let b = Int64(18)
    let x1 = Int64(a) <= b // true 
    UInt16(UInt8(Int32(Int64(a)))) == UInt16(Int32(UInt32(Int8(UInt64(b)))))
    let f1 = Float32(15.0)
    let f2 = Float64(Int32(UInt16(Float32(1.0))))
    let x2 = f1 >= Float32(f2)
    ()
}

// ASSERT: scan [RangeAnalysis] The value of LE at [7,14] has been set to true
// ASSERT: scan [RangePropagation] The LE at [7,14] has been rewrited to a constant
// ASSERT: regex-not \[RangeAnalysis\].*\[11,14\]

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
