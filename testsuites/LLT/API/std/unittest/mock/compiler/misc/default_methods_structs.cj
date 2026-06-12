/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt -Woff=all %f -o %output --mock=on 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f

public interface I {
    func bar(s: String): Unit
    func foo(s: String): Unit {
        bar(s)
    }
}

public struct C <: I {
    public override func bar(s: String) {
        println("C::bar (${s})")
    }
}

func foo<T>(s: T) where T <: I {
    let f = s.foo
    f("generic_ma_ref")
    s.foo("generic_ma_call")
}

extend C {
    func gg() {
        let f = foo
        f("ref_ref")

        foo("ref_call")
    }
}

main() {
    var s: C = C()

    foo(s)

    let f = s.foo
    f("ma_ref")
    s.foo("ma_call")

    s.gg()
}

/* SCAN-IN
C::bar (generic_ma_ref)
C::bar (generic_ma_call)
C::bar (ma_ref)
C::bar (ma_call)
C::bar (ref_ref)
C::bar (ref_call)
*/
