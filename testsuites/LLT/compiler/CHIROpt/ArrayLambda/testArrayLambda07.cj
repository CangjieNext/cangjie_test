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
// Extra expressions / side effects in lambda body -> should not rewrite.

main() {
    let a = Array<Int64>(5, { i =>
        println(i)
        1
    })
    return a[0] - 1
}
