// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %compile_lib_opt %f -o %output

// Regression test: a nested lambda inside the outer lambda's body, where both the outer and
// the inner lambda have omitted parameter types flowing through a tuple destructuring alias.
// The inner lambda is itself an argument to B's overloaded constructor, so it is checked
// under its own candidate set and ClearCacheForNames runs for it independently: its tuple
// alias (u from let (u, v) = (m, n)) must be collected just like the outer one (x from
// let (x, y) = (p, q)), so that add(u) is cleared rather than left as a stale negative-cache
// entry. Guards that the tuple-destructuring alias collection applies at each nested lambda level.

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
                let (x, y) = (p, q)
                B() {
                    m, n =>
                        let (u, v) = (m, n)
                        add(u)
                        return
                }
                add(x)
                return
        }
    }
}
