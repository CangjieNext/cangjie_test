/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// (Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 1>log.txt && bash -c "dos2unix log.txt" && bash -c "cat log.txt" | compare %f
/* SCAN-IN
Base.foo()
Base.foo()
Inter.foo()
Inter.foo()
 */

interface Inter {
    func foo(): Unit {
        print("Inter.foo()\n")
    }
}

open class Base <: Inter {
    public func foo(): Unit {
        print("Base.foo()\n")
    }
}

class Derived1 <: Inter {}

class Derived2 <: Base {}

main(): Int64 {
    var o1: Derived2 = Derived2()
    o1.foo()
    var o2: Base = Derived2()
    o2.foo()
    var o3: Derived1 = Derived1()
    o3.foo()
    var o4: Inter = Derived1()
    o4.foo()
    return 0
}
