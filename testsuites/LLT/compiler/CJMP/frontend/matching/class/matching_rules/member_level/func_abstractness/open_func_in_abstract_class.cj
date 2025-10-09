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
    public open func b(): Int{1}
}

public class B <: A {
}

public class C <: A {
  public func b(): Int { 10 }
}

public func callFromCommon(a: A) {
  println(a.b())
}
// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib
package cmp

public platform abstract class A {
}

public class D <: A {
}

public class E <: A {
  public func b(): Int { 20 }
}

public func callFromPlatform(a: A) {
  println(a.b())
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
1
10
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
    callFromPlatform(B())
    callFromPlatform(C())
    callFromPlatform(D())
    callFromPlatform(E())
}

/* SCAN
1
10
1
20
1
10
1
20
*/
