// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %compile_lib_opt %f -o %output

// Regression test: overload resolution with a lambda argument whose parameter types are omitted
// and flow through a tuple destructuring alias, with an overloaded callee add(Bool)/add(Int64).
// When the () -> Unit constructor overload is declared before (Int64, Int64) -> Unit, the lambda
// body is still checked under the 0-param candidate for diagnostics; the failures of inner nodes
// (e.g. add(x), whose type depends on the aliased lambda parameters but whose cache key does not)
// used to be written into the negative type-check cache and then hit by the 2-param candidate,
// rejecting it with "mismatched number of parameters: expected '0', found '2'". Unlike
// overload_resolution_7.cj, the callee has two overloads, so the inner call resolves through the
// multi-candidate overload loop.

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
                add(x)
                return
        }
    }
}
