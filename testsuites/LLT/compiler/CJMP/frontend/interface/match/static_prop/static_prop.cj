// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common interface I {
    static prop p: Int { get() { 0 } }
}

public class A <: I {
    public static prop p: Int { get() { 1 } }
}

public func foo<T>() where T <: I {
    println(T.p)
}

// SEPARATE-FILE: p/p.cj
// EXEC: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib
package cmp

public platform interface I {}

public class B <: I {}

// SEPARATE-FILE: m_platform.cj
// EXEC: %compiler %noColor m_platform.cj --import-path=./p -L. -lcmp -o %output
// EXEC-PIPE-0: %run %output 2>&1 | compare %f
import cmp.*

main() {
    foo<I>()
    foo<A>()
    foo<B>()
}


/* SCAN
0
1
0
*/