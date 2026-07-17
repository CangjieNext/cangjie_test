// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 覆盖目标: llvm-project/llvm/lib/Transforms/Scalar/CJLoopFloatOpt.cpp
// 未覆盖行: 139, 143, 146-150, 152-153, 155-156, 158, 189-198,
//           248-251, 256-276 (replaceFloatToInt select / FAdd/FSub 分支),
//           283-287 (NewPHI incoming 0/1 替换), 290-296 (eraseInsts)
// 触发说明: 在浮点循环中使用 select 表达式作为 fadd 第二操作数,
//           触发 checkFPUse 的 SelectInst 分支(146-150)与
//           replaceFloatToInt 的 select 替换(256-276)。
// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func floatSelectStep(n: Int64): Float64 {
    // %sel = select i1 %cmp, double 1.0, double 2.0;%fadd = fadd double %s, %sel
    // 触发 checkFPUse 146-150 的 SelectInst 分支与 isNoDecimalDouble 检查
    var s: Float64 = 0.0
    for (i in 0..n) {
        var step: Float64 = if (i < 5) { 1.0 } else { 2.0 }
        s = s + step
    }
    return s
}

func floatSelectSub(n: Int64): Float64 {
    // fsub + select 触发 142 FSub != LatchVal 与 153-156 isNoDecimalDouble 检查
    var s: Float64 = 100.0
    for (i in 0..n) {
        var step: Float64 = if (i < 5) { 1.0 } else { 2.0 }
        s = s - step
    }
    return s
}

func floatSelectIntConvert(n: Int64): Int64 {
    // select + fptosi 触发 225-228 Call case 与 229-247 FPToSI case
    var s: Float64 = 0.0
    for (i in 0..n) {
        var step: Float64 = if (i < 3) { 1.0 } else { 1.0 }
        s = s + step
    }
    var r: Int64 = Int64(s)
    if (r < 0) {
        return -1
    }
    return r
}

func floatNonIntegerStep(n: Int64): Float64 {
    // 小数步进触发 isNoDecimalDouble=false -> checkFPUse 返回 false (153)
    var s: Float64 = 0.0
    for (i in 0..n) {
        s = s + 0.5
    }
    return s
}

func floatNonConstRHS(n: Int64): Float64 {
    // fadd 第二操作数既不是 select 也不是 ConstantFP -> 156 return false
    var s: Float64 = 0.0
    var t: Float64 = 1.0
    for (i in 0..n) {
        t = t + 0.5
        s = s + t
    }
    return s
}

main(): Int64 {
    var r1 = floatSelectStep(10)
    if (r1 <= 0.0) {
        return 1
    }
    var r2 = floatSelectSub(10)
    if (r2 >= 100.0) {
        return 1
    }
    var r3 = floatSelectIntConvert(10)
    if (r3 < 0) {
        return 1
    }
    var r4 = floatNonIntegerStep(10)
    if (r4 <= 0.0) {
        return 1
    }
    var r5 = floatNonConstRHS(10)
    if (r5 <= 0.0) {
        return 1
    }
    return 0
}
