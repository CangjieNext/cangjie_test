/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// RUN-EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output %cmp_utest_opt 2>&1 | compare %f
package macro_parse_error

import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

class A {
    func a() {}
    func b(i: Int64): Unit {}
    func c(str: String): Unit {}
}

func matcherError() {
    @Called(a.b(u.i))
    /* SCAN-IN
Invalid matcher expression: u.i
     */
    @On(a.b(u.k.j.y))
    /* SCAN-IN
Invalid matcher expression: u.k.j.y
     */
    @On(a.b(2 + 2))
    /* SCAN-IN
Invalid matcher expression: 2 + 2
     */
    @On(a.b(a + b / 4))
    /* SCAN-IN
Invalid matcher expression: a + b / 4
     */
    @On(a.b(Smth.c()))
    /* SCAN-IN
Invalid matcher expression: Smth.c()
     */
    @Called(a.b(a + b(3)))
    /* SCAN-IN
Invalid matcher expression: a + b(3)
     */
    @On(a.b([a, b, c]))
    /* SCAN-IN
Invalid matcher expression: [a, b, c]
     */
    @On(a.b(a = 5))
    /* SCAN-IN
Invalid matcher expression: a = 5
     */
    @On(a.b("a"(3)))
    /* SCAN-IN
Invalid matcher expression: "a"(3)
     */
    @On(a.b((x + y)(3)))
    /* SCAN-IN
Invalid matcher expression: (x + y)(3)
     */
    @On(a.b(_ + _))
    /* SCAN-IN
Invalid matcher expression: any() + any()
     */
    @On(na.foo(z().x(), a: 3 + 5, b: 3, c: [foo]))

    /* SCAN-IN
Exception: Encountered issues while processing macro:
Invalid matcher expression: z().x()
Invalid matcher expression: 3 + 5
Invalid matcher expression: [foo]
     */
    @On(na.foo(bar.foo, 100 + 200, [foo]))
    /* SCAN-IN
Invalid matcher expression: bar.foo
Invalid matcher expression: 100 + 200
Invalid matcher expression: [foo]
     */
}

func stubError() {
    @On(a { f: Int64 => 3})
    /* SCAN-IN
    Invalid stub description expression: a { f: Int64 => 3}
     */
    @On(try { a } catch(e: Exception) { b })
    /* SCAN-IN
    Invalid stub description expression: try { a } catch(e: Exception) { b }
     */
    @On()
    /* SCAN-IN
    Exception: Unable to parse macro.
     */
    /* SCAN-IN
    90 |     @On()
     */
    @On(if (g) { t } else { c })
    /* SCAN-IN
    Invalid stub description expression: if (g) { t } else { c }
     */
    @Called(a.b(,))
    /* SCAN-IN
    Exception: Unable to parse macro.
     */
    /* SCAN-IN
    101 |     @Called(a.b(,))
     */
    @On(a, b)
    /* SCAN-IN
    Invalid stub description expression: a, b
     */
    @On(a(), b())
    /* SCAN-IN
    Invalid stub description expression: a(), b()
     */
    @On(,)
    /* SCAN-IN
    Invalid stub description expression: ,
     */
    /* SCAN-IN
    116 |     @On(,)
     */
}

func tokensAfterComma_DTS2023102713267() {
    @On(foo.bar2(), 11)
    /* SCAN-IN
    Invalid stub description expression: foo.bar2(), 11
     */
    @On(foo.bar2(), something, something)
    /* SCAN-IN
    Invalid stub description expression: foo.bar2(), something, something
     */
}
