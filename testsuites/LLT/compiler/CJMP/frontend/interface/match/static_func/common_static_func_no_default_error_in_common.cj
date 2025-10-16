// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-PIPE-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common interface I {
    common static func f(): Int
}

public class A <: I {
    public static func f(): Int { 1 }
}

public func foo<T>() where T <: I {
    println(T.f())
}

// SEPARATE-FILE: p/p.cj
// EXEC: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib
package cmp

public platform interface I {
    platform static func f(): Int { 2 }
}

// SEPARATE-FILE: m_common.cj
// EXEC-PIPE-1: %compiler %noColor m_common.cj --import-path=./c -L. -lcmp -o %output 2>&1 | compare %f
import cmp.*

main() {
    foo<A>() // ok
    foo<I>() // error, NOTE: linked against common part CJO
}

/* SCAN
error: can not instantiate 'Generics-T' by interface or abstract class 'Interface-I' for it has unimplemented static member
 ==> m_common.cj:6:9:
  | 
6 |     foo<I>() // error, NOTE: linked against common part CJO
  |         ^ 
  | 

1 error generated, 1 error printed.
*/