// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %enableCompileDebug %f -o %n.%suffix
// RUN-EXEC-0: %run %run_opt %output %run_args

interface I {
    func foo() {}
}

class C <: I {
    var a: Int64
    init(x: Int64) {
        a = x
    }
}

func foo() {
    let x: I = C(2) // no box

    match (x) {
        case v: C => v.a // no unbox
        case _ => C(1).a
    }
    return 0
}

main() {
    foo()
    0
}
