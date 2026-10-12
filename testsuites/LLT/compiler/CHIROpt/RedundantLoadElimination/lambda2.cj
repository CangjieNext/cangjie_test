// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff all %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_RedundantLoadElimination.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan srcCodeIdentifier: main

main() {
    var v2 = "Thrown"
    func foo2() {
        try {
            throw Exception()
        } finally {
            v2 = "Finally"
        }
    }
    try {
        foo2()
    } catch (e: Exception) {
        if (v2 != "Finally") {
            throw Exception()
        }
    }
}
