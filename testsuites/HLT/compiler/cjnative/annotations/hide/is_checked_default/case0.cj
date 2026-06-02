/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../hide.cj upstream.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt hide.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt -L. -lohos.labels upstream.cj
// EXEC: %compiler %cmp_opt -L. -lohos.upstream -lohos.labels %f -o %output
// RUN-EXEC: %run %run_opt %run_args %output

import ohos.upstream.*
import ohos.upstream

class D<T> <: A where T <: A {
    func xxx<R>(d: A): A where R <: A {
        var a: A = A()
        B.AA
        B.BB(1)
        E.AA
        E.BB(1)
        goo(1)
        var b: D<A>
        var c: upstream.A
        a is A
        a as A
        aaa
        a
    }
}

main() {
    let d = D<A>()
}
