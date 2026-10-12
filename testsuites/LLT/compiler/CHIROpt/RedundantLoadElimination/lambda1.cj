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

func getNumber_Array_1(): Int64 {
    var n = [0, 0]
    func seven() {
        n = [7, 7]
    }
    func update() {
        seven()
    }
    update()
    return n[0]
}

func getNumber_Tuple_1(): Int64 {
    var n = (0, 0)
    func seven() {
        n = (7, 7)
    }
    func update() {
        seven()
    }
    update()
    return n[0]
}

main() {
    let a = getNumber_Array_1()
    let b = getNumber_Tuple_1()
    if (a != 7 || b != 7) {
        throw Exception()
    }
}
