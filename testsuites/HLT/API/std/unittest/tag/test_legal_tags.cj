/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

@Test
class Test_Tag_legal {
    @Tag[Test]
    @TestCase
    func case01() {}

    @Tag[a, b, c, d, e, f, g, h, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, a0, b0, c0, d0, e0, f0, g0, h0, k0, l0,
        m0, n0, o0, p0, q0, r0, s0, t0, u0, v0, w0, x0, y0, z0, a1, b1, c1, d1, e1, f1, g1, h1, k1, l1, m1, n1, o1, p1,
        q1, r1, s1, t1, u1, v1, w1, x1, y1, z1, a2, b2, c2, d2, e2, f2, g2, h2, k2, l2, m2, n2, o2, p2, q2, r2, s2, t2,
        u2, v2, w2, x2, y2, z2]
    @TestCase
    func case02() {}

    @Tag[abcd, ABCD, aBcD]
    @TestCase
    func case03() {}

    @Tag[仓颉语言, java语言, c语言]
    @TestCase
    func case04() {}

    @Tag[aa, bb, b_b]
    @TestCase
    func case06() {}

    @Tag[MixedCaseIdentifier_WithNumbers123and456More789CharactersABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_]
    @TestCase
    func case08() {}
}
