// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %compile_lib_opt %f -o %output

// Regression test: nested lambdas inside an incompatible overload candidate's body. The
// incompatible-parameter inhibition of negative-cache writes (see ASTContext::inhibitNegCache)
// is a counter because the body of an incompatible candidate can contain another overloaded
// lambda call, which re-enters ChkLamExpr and increments the counter again. Both the outer and
// the inner 0-param candidates used to poison the negative cache; this case guards the pairing
// of the increments and decrements: overwriting the counter instead of decrementing it makes
// the inner candidate's failures leak into the cache and this case fail again.

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

main() {}
