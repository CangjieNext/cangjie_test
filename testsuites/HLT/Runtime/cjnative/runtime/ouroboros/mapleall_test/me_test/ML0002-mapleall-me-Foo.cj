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
bbbb
aaaa
 */

class Foo {
    public Foo() {}
    public func bar(a: String): Unit {
        print(a + "\n")
    }
}

class Bar {
    private var foo: Foo
    public Bar(a: String) {
        foo = Foo()
        foo.bar(a)
    }

    public func Foo_inter(a: String): Unit {
        foo.bar(a)
    }
}

main(): Int64 {
    var t: Bar = Bar("bbbb")
    t.Foo_inter("aaaa")
    return 0
}
