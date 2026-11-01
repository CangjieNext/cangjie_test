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
// ASSERT: regex-not %[0-9]*: \(.*\) -> .* = Lambda
// Float64 constant lambda rewrite.

main() {
    let a = Array<Float64>(3, { i => 1.5 })
    println(a[0])
    return 0
}
