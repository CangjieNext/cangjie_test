// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class A {
    private let m_a: Int32 = 123
    public func test(a!: Bool = (m_a > 0)): Bool {
        a
    }
}

var outside: (Bool, Bool) = (true, true)

func nestCall(): Bool {
    if (true) {
        func inside(): A {
            A()
        }
        inside()
    } else if ({=> outside}()[1]) {
        var i: Int64 = 1
        while (i > 0) {
            i = i - 1
        }
        A()
    } else {
        let x: A = A();
        {
            =>
            outside;
            x
        }()
    }.test()
}

main(): Int64 {
    if (nestCall() != true) {
        return 1
    }
    return 0
}
