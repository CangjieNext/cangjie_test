// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_ArrayLambdaOpt.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan-not RawArrayInitByValue
// ASSERT: scan arrayInitByFunction
// ASSERT: regex %[0-9]*: \(.*\) -> .* = Lambda
// Multi-block lambda (if/else) -> CheckIfLambdaReturnConst rejects blocks.size > 1.

main() {
    let a = Array<Int64>(10, { i =>
        if (i > 5) {
            1
        } else {
            0
        }
    })
    return a[0] + a[9] - 1
}
