// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %enableO2 %cmp_opt %n.cj -o %output
// RUN-EXEC: %run %output

interface IA {
    func test(param1: Int64, param2: IA): Unit {
        println("1")
    }
}

class CA <: IA {}

func foo() {
    try {
        var ca: IA = CA()
        ca.test(999, ca)
    // It exposes problems with closure conversion when lifting types.
    } catch (_) {
    }
}

main() {
    foo()
    0
}
