// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common let c1: Int = 1

func f1() { return c1 }

public let x2 = f1()

public func f2() { return x2 + 10 }

let x3 = f2()

private func f3() { return x3 + 100 }

private let x4 = f3()

class A {
    static func f4() { return x4 + 1000 }

    public static let x5 = A.f4()
}

class B {
    public static func f5() { return A.x5 + 10000 }
}

class C {
    let x6 = B.f5()
}

let x7 = C().x6

class D {
    func f7() { return x7 + 100000 }
}

private let x8 = D().f7() 

let x9 = x8

public let x10 = x9

// SEPARATE-FILE: p/p_invalid.cj
// (CJNATIVE and Linux)EXEC-PIPE-1: %compiler %noColor --experimental p/p_invalid.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p 2>&1 | compare %f
package cmp

// Circular dependency must be detected: c1 <-> x10.
// In order to do it: all the dependency relations between must be saved.
// Some of them collapsed because of not all nodes are exported.
// So their dependencies propogates to near exported nodes. 
public platform let c1: Int = x10

/* SCAN
error: p_invalid.cj and c.cj might have file circular dependency
1 error generated, 1 error printed.
*/


// SEPARATE-FILE: p/p_valid.cj
// EXEC-0: %compiler %noColor --experimental p/p_valid.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
package cmp

// This one is valid
public platform let c1: Int = 2

// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor m_common.cj --import-path=./c -L./p -lcmp -o %output
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
    println(x10)
}

/* SCAN
111112
*/

// SEPARATE-FILE: m_platform.cj
// EXEC-0: %compiler %noColor m_platform.cj --import-path=./p -L./p -lcmp -o %output
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
    println(x10)
}

/* SCAN
111112
*/