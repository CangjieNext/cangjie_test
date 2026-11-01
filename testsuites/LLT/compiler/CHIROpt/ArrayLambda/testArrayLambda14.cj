// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_ArrayLambdaOpt.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan RawArrayInitByValue
// ASSERT: scan-not arrayInitByFunction
// ASSERT: regex %[0-9]*: \(.*\) -> .* = Lambda
// Rewrite triggers, but lambda stays because it is still used after init.

internal import std.collection.*

main() {
    var sum = 0
    var f = {i: Int64 => 2}
    for (i in 0..100) {
        var a = ArrayList<Int64>(100000, f)
        sum += a[i]
    }
    f(1)
    return sum - 200
}
