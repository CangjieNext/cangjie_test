// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %compile_lib_opt %f -o %output

// Regression test: a nested tuple-destructuring alias (e.g. `let ((a, b), c) = ((p, q), p)`).
// The bound names sit under TuplePattern -> VarPattern -> VarDecl, so collecting them needs a
// recursive walk. Guards that `add(a)` (bound two levels down) no longer rejects the
// (Int64, Int64) -> Unit candidate with "mismatched number of parameters: expected '0',
// found '2'".

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
                let ((a, b), c) = ((p, q), p)
                add(a)
                return
        }
    }
}
