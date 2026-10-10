// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %compile_lib_opt %f -o %output

// Regression test: an inner lambda whose parameter name shadows an outer lambda parameter must
// not let a destructured binding inside it erase the outer parameter's own alias entry. The
// inner lambda `{p: Int64 => ...}` makes shadowName move p out of the alias set; `let p = q`
// (q is an alias) inside the for-in body then registers p again. Climbing the ancestor stack
// to the enclosing IfExpr for a non-let-pattern declaration would cross the lambda boundary
// and register p to the outer IfExpr, whose post-action erases the outer parameter p after the
// shadowName restore point -- so `add(p)` after the if no longer clears the stale negative
// cache and the (Int64, Int64) -> Unit candidate is rejected with "mismatched number of
// parameters: expected '0', found '2'". Guards that alias registration stays in the lambda it
// belongs to.

class B {
    init(list: () -> Unit) {}
    init(list: (Int64, Int64) -> Unit) {}
}

class C {
    func add(arg: Bool): Unit {}
    func add(arg: Int64): Unit {}

    func f() {
        B() {
            p, q =>
                if (true) {
                    let g = {p: Int64 =>
                        for (i in [q]) {
                            let p = q
                            add(p)
                        }
                        return
                    }
                    g(q)
                }
                add(p)
                return
        }
    }
}
