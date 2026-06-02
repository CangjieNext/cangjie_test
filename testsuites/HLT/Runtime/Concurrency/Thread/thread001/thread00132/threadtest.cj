/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f

// ASSERT: scan in class C\n

interface A {
    func f(): Unit {
        print("in interface A\n")
    }
}

class B <: A {
    public func f(): Unit {
        print("in class B\n")
    }
}

class C <: A {
    public func f(): Unit {
        print("in class C\n")
    }
}

var a: A = B()

main(): Int64 {
    let fut1: Future<A> = spawn {
        a = C()
        return a
    }
    sleep(Duration.second)
    a.f()
    return 0
}
