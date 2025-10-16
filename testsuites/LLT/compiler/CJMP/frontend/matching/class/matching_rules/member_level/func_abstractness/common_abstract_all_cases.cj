// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common abstract class A {
    init() {}
    public common func a(): Int{1}
    public open func b(): Int{2}
    public common open func c(): Int {3}
    public common func d(): Int
    public common abstract func e(): Int
    public common abstract func f(): Int
    public abstract func g(): Int
}

public class B <: A {
  public func b(): Int { a() + 10 }
  public func c(): Int { a() + 20 }
  public func e(): Int { a() + 30 }
  public func f(): Int { a() + 40 }
  public func g(): Int { a() + 50 }
}

public class C <: A {
  public func e(): Int { a() + 100 }
  public func f(): Int { a() + 200 }
  public func g(): Int { a() + 300 }
}

public func callFromCommon(a: A) {
  println(a.a())
  println(a.b())
  println(a.c())
  println(a.d())
  println(a.e())
  println(a.f())
  println(a.g())
  println("=")
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib
package cmp

public platform abstract class A {
    public platform func a(): Int{4}
    public platform open func c(): Int {5}
    public platform func d(): Int {6}
    public platform open func e(): Int {7}
    public platform abstract func f(): Int
}

public class D <: A {
  public func b(): Int { a() + 1000 }
  public func c(): Int { a() + 2000 }
  public func e(): Int { a() + 3000 }
  public func f(): Int { a() + 4000 }
  public func g(): Int { a() + 5000 }
}

public class E <: A {
  public func e(): Int { a() + 10000 }
  public func f(): Int { a() + 20000 }
  public func g(): Int { a() + 30000 }
}

public class F <: A {
  public func f(): Int { a() + 100000 }
  public func g(): Int { a() + 200000 }
}

public func callFromPlatform(a: A) {
  println(a.a())
  println(a.b())
  println(a.c())
  println(a.d())
  println(a.e())
  println(a.f())
  println(a.g())
  println("=")
}

// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor m_common.cj --import-path=./c -L. -lcmp -o %output
// EXEC-PIPE: %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
    callFromCommon(B())
    callFromCommon(C())
}

/* SCAN
4
14
24
6
34
44
54
=
4
2
5
6
104
204
304
=
*/

// SEPARATE-FILE: m_platform.cj
// EXEC-0: %compiler %noColor m_platform.cj --import-path=./p -L. -lcmp -o %output
// EXEC-PIPE: %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
    callFromCommon(B())
    callFromCommon(C())
    callFromCommon(D())
    callFromCommon(E())
    callFromCommon(F())
    println("===")
    callFromPlatform(B())
    callFromPlatform(C())
    callFromPlatform(D())
    callFromPlatform(E())
    callFromPlatform(F())
}

/* SCAN
4
14
24
6
34
44
54
=
4
2
5
6
104
204
304
=
4
1004
2004
6
3004
4004
5004
=
4
2
5
6
10004
20004
30004
=
4
2
5
6
7
100004
200004
=
===
4
14
24
6
34
44
54
=
4
2
5
6
104
204
304
=
4
1004
2004
6
3004
4004
5004
=
4
2
5
6
10004
20004
30004
=
4
2
5
6
7
100004
200004
=
*/
