// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix | compare %f
// ASSERT: scan operator func () in A implements ICallable
// ASSERT: scan operator func () in ICallable, get 1
// ASSERT: scan operator func () in A, get hello

interface ICallable {
    operator func ()(): Unit {
        print("operator func () in ICallable\n")
    }

    operator func ()(x: Int32) {
        print("operator func () in ICallable, get ${x}\n")
    }
}

class A <: ICallable {
    public operator func ()(): Unit {
        print("operator func () in A implements ICallable\n")
    }

    public operator func ()(x: String) {
        print("operator func () in A, get ${x}")
    }
}

func run() {
    var a = A()
    a()
    a(1)
    a("hello")
    return 0
}

main(): Int64 {
    let res = run()
    return res
}

// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
