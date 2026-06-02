/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// (Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 1>log.txt && bash -c "dos2unix log.txt" && bash -c "cat log.txt" | compare %f
/* SCAN-IN
ddd
ddd
ddd
ddd
ddd
ddd
 */

class Foo {
    public Foo() {}

    public func bar1(a: String): Unit {
        print(a + "\n")
    }

    public func bar2(a: String): Unit {
        print(a + "\n")
    }

    public func bar3(a: String): Unit {
        print(a + "\n")
    }

    public func bar4(a: String): Unit {
        print(a + "\n")
    }

    public func bar5(a: String): Unit {
        print(a + "\n")
    }

    public func bar6(a: String): Unit {
        print(a + "\n")
    }
}

main(): Int64 {
    var t: Foo = Foo()
    t.bar1("ddd")
    t.bar2("ddd")
    t.bar3("ddd")
    t.bar4("ddd")
    t.bar5("ddd")
    t.bar6("ddd")
    return 0
}
