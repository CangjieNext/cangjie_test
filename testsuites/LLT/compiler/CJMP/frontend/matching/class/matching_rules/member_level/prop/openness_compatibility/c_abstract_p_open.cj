// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public abstract common class A {
  init() {}
  public common abstract prop foo: Int64
}

public class B <: A {
  public prop foo: Int { get() { 1 } }
}

public func callFoo(a: A) {
  println(a.foo)
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib
package cmp

public abstract specific class A {
    public specific open prop foo: Int64 { get() { 0 } }
}

public class C <: A {
  public prop foo: Int { get() { 2 } }
}

public class D <: A {}

// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor m_common.cj --import-path=./c -L. -lcmp -o %output
// EXEC-PIPE: %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
    println(B().foo)
    callFoo(B())
}

/* SCAN
1
1
*/

// SEPARATE-FILE: m_platform.cj
// EXEC-0: %compiler %noColor m_platform.cj --import-path=./p -L. -lcmp -o %output
// EXEC-PIPE: %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
    println(B().foo)
    callFoo(B())
    println(C().foo)
    callFoo(C())
    println(D().foo)
    callFoo(D())
}

/* SCAN
1
1
2
2
0
0
*/
