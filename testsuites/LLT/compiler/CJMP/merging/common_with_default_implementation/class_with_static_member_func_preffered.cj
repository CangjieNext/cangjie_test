// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

common public class A {
    common public init() {}
    common static public func foo(): Unit {
        println("From common static member func")
    }
    common static public func koo(): Unit {
        println("From common static member func koo")
    }
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
package cmp

specific public class A {
    specific static public func foo(): Unit {
        println("From specific static member func")
    }
}
// SEPARATE-FILE: m.cj
// EXEC-0: %compiler %noColor m.cj --import-path=./c -L./p -lcmp -o %output
import cmp.*

main(): Unit {
    A.foo()
    A.koo()
}

// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
/* SCAN
From specific static member func
From common static member func koo
*/
