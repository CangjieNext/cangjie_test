// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 覆盖目标: llvm-project/llvm/lib/Transforms/Scalar/CJLoopFloatOpt.cpp
// 未覆盖行: 54, 67, 79, 82, 86-89, 91-92, 95, 99, 103, 107, 111, 117, 123, 131,
//           139, 143, 152-153, 155-156, 162, 174, 177, 196-197, 200, 211,
//           226-228, 241-242, 263, 268, 279, 286, 362, 374-377, 390
// 触发说明: Float64 循环变量 + 整数步进 + 整数转换触发
//           loopFPComputationOpt;checkFPUse 各 case(86-160);
//           replaceFloatToInt 各 case(225-288);getConstIntByDouble 等。
// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func floatLoopBasic(n: Int64): Float64 {
    // 整数初值 + fadd 常量 1.0 + fptosi 触发 loopFPComputationOpt
    var s: Float64 = 1.0
    for (i in 0..n) {
        s = s + 1.0
    }
    var r: Int64 = Int64(s)
    return Float64(r)
}

func floatLoopFSub(n: Int64): Float64 {
    // FSub 步进触发 131-160 FSub 分支与 replaceFloatToInt 267-268
    var s: Float64 = 100.0
    for (i in 0..n) {
        s = s - 1.0
        if (s < 50.0) {
            break
        }
    }
    return s
}

func floatLoopLargeN(): Float64 {
    // 大循环计数触发 362 (PHI != 2 incoming) / 374-377 else if 分支 / 390 checkIntOverflow
    var s: Float64 = 0.0
    var i: Int64 = 0
    while (i < 1000000) {
        s = s + 2.0
        i += 1
    }
    return s
}

func floatLoopIntConvert(n: Int64): Int64 {
    // fptosi + cj.get.fp.state 链触发 93-120 FPToSI case
    var s: Float64 = 0.0
    for (i in 0..n) {
        s = s + 1.0
    }
    var x: Int64 = Int64(s)
    if (x < 0) {
        return -1
    }
    return x
}

func floatLoopBound(n: Int64): Float64 {
    // 跨 int32 边界触发 67 isNoDecimalDouble false
    var s: Float64 = 2147483648.0
    for (i in 0..n) {
        s = s + 1.0
    }
    return s
}

main(): Int64 {
    var r1 = floatLoopBasic(10)
    if (r1 <= 0.0) {
        return 1
    }
    var r2 = floatLoopFSub(60)
    if (r2 >= 100.0) {
        return 1
    }
    var r3 = floatLoopLargeN()
    if (r3 <= 0.0) {
        return 1
    }
    var r4 = floatLoopIntConvert(10)
    if (r4 < 0) {
        return 1
    }
    var r5 = floatLoopBound(5)
    if (r5 <= 0.0) {
        return 1
    }
    return 0
}
