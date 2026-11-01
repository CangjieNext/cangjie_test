// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_ArrayLambdaOpt.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan-not RawArrayInitByValue
// ASSERT: scan RawArray<Int64>& = Apply(@_CNatU00000003fipJc19arrayInitByFunctionIlHA0_lF0llE
// ASSERT: regex %[0-9]*: \(.*\) -> .* = Lambda

internal import std.collection.*

var a = 1

main():Int64 {
    let arr = Array<Int64>(10, { i => a = i; 10 })
    println(a)
    return a - 9
}
