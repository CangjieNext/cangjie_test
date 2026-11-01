// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %compile_lib_opt %f -o %output

// Regression test: a tuple-destructuring alias that shadows a lambda parameter inside a nested
// block must not drop the parameter itself from the alias set. When the destructured name
// matches the parameter name (e.g. `let (p, y) = (p, q)`), registering it for scope-exit
// erasure unconditionally would erase the parameter's own alias entry, so `add(p)` after the
// block would no longer clear the stale negative cache and the (Int64, Int64) -> Unit candidate
// would be rejected with "mismatched number of parameters: expected '0', found '2'". Guards the
// fix itself: only names newly introduced by the destructuring are registered for scope-exit
// erasure (this case passes on the merge-base because the destructuring path was not wired up
// at all there).

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
                    let (p, y) = (p, q)
                    add(p)
                }
                add(p)
                return
        }
    }
}
