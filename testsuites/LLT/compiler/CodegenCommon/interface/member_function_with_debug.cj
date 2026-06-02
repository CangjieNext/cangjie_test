// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Success

interface Data {
    func foo(): Int64 {
        return 1
    }

    func foo(a: Int64): Int64 {
        return a
    }

    func inside() {
        func a() {
            func b() {
                return 50
            }
            foo() + foo(2) + b()
        }

        func c() {
            return foo() * foo(30)
        }
        return a() + c()
    }
}

class Test <: Data {}

main(): Int64 {
    var res: Int64 = Test().inside()
    if (res == 83) {
        println("Success")
    } else {
        println("Fail")
    }
    return 0
}
