// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %compile_lib_opt %f -o %output

// Regression test: a tuple-destructuring alias with a wildcard element (e.g.
// `let (x, _) = (p, q)`). The `_` element binds no name, so only x is an alias; the
// wildcard must not confuse the pattern-name collection. Guards that `add(x)` after the
// destructuring no longer rejects the (Int64, Int64) -> Unit candidate with
// "mismatched number of parameters: expected '0', found '2'".

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
                let (x, _) = (p, q)
                add(x)
                return
        }
    }
}
