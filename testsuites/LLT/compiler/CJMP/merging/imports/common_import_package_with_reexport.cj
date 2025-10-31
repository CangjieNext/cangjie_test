//  Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information. 

// NOTE:
// This test checks reexport of reexported declaration in common part is visible in platform part.


// SEPARATE-FILE: ./dep0/dep0.cj
// EXEC-0: %compiler %noColor --experimental ./dep0/dep0.cj --output-type=dylib
package dep0

public func a() {"a"}
public func b() {"b"}


// SEPARATE-FILE: dep/dep.cj
// EXEC-0: %compiler %noColor --experimental dep/dep.cj --output-type=dylib
package dep

// `public` required to reexport declaration
public import dep0.a

public func f_in_dep() {
    println("dep:${a()}")
}


// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

// `public` required to be visible in other files(platform part)
public import dep.*
// direct reexport should work as well as transitive
public import std.sync.IllegalSynchronizationStateException

public func f1() {
    f_in_dep()
    println("common:${a()}")
    println("common:${IllegalSynchronizationStateException()}")
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib
package cmp

import dep0.b

public func f2() {
    f_in_dep()
    println("platform:${a()}") // visible because of public import in common part
    println("platform:${IllegalSynchronizationStateException()}")
    println("platform:${b()}")
}

// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor m_common.cj --import-path=./c -L. -L./dodep0 -lcmp -ldep0 -ldep -o %output
// EXEC-PIPE: %run %output 2>&1 | compare %f
import cmp.*

main() {
    f1()
}

/* SCAN
dep:a
common:a
common:IllegalSynchronizationStateException
*/

// SEPARATE-FILE: m_platform.cj
// EXEC-0: %compiler %noColor m_platform.cj --import-path=./p -L. -L./dodep0 -lcmp -ldep0 -ldep -o %output
// EXEC-PIPE: %run %output 2>&1 | compare %f
import cmp.*

main() {
    f1()
    f2()
}

/* SCAN
dep:a
common:a
common:IllegalSynchronizationStateException
dep:a
platform:a
platform:IllegalSynchronizationStateException
platform:b
*/ 
