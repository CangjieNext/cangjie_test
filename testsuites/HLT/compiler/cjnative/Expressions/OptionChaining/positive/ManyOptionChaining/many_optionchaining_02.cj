/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
class A {
    var a = Some(B())
}

class B {
    var b = Some(C())
}

class C {
    let c = Some((Some(D()), 300))
}

class D {
    var d = Some(E())
}

class E {
    var e = Some(F())
}

class F {
    let f = Some({i: Int64 => Some(G())})
}

class G {
    var g: ?H = None<H>
}

class H {
    var h = Some(I())
}

class I {
    let i = Some({i: (Int64) -> Int64 => Some(J())})
}

class J {
    var j = Some(K())
}

class K {
    var k = 1
}

main() {
    var oa = Some(A())
    if ((oa?.a?.b?.c?[0]?.d?.e?.f?(0)?.g?.h?.i? {i => i + 1}?.j?.k ?? -1) != -1) {
        return 1
    }
    return 0
}
