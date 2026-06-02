// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE: %run %output 2>&1 | compare %f
// ASSERT: scan A::g()

enum A {
    | Red | Green | Blue
    
    static func g() {
        println("A::g()")
    }

    func f(): CFunc<() -> Unit> {
        var fn: CFunc<() -> Unit> = { =>
            g
            g()
        }
        fn
    }
}

unsafe main() {
    var a = A.Red
    a.f()()
}
