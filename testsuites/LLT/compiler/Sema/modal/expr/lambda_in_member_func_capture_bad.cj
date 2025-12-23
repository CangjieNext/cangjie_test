// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %diag_json %f -o %output 2>&1 | compare %f

class F {
    var a = 1
    init() {}
    init(this @local!) { exclave { } }
    init(this @local?) { exclave { } }
}
class C {
    func f() {
        let x: F@local? = F()
        let h:(()->Unit)@~local = {
            => println(x.a)
        }
        let y: F@local! = F()
        func @local! m() {
            println(y.a)
        }
    }
}

struct S {
    func f() {
        let x: F@local? = F()
        let h:(()->Unit)@~local = {
            => println(x.a)
        }
        let y: F@local! = F()
        func @local! m() {
            println(y.a)
        }
    }
}

extend S {
    func g() {
        let x: F@local? = F()
        let h:(()->Unit)@~local = {
            => println(x.a)
        }
        let y: F@local! = F()
        func @local! m() {
            println(y.a)
        }
    }
}

main() {
}

// ASSERT: scan-6 "DiagKind": "sema_bad_capture_local",
// ASSERT: scan "Errors": 6,