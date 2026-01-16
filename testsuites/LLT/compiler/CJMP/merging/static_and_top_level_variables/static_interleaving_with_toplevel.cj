// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public let x = 42

public common let a: Int = 1

public common var b: Int = 10

public common class A {
    static func foo() { 100 }

    public static common let c: Int = foo()

    public static common let d: String = "1000"

    public static common let e: Int = 10000

    public init() {}
}

func hoo() {
    100000
}

public common let f: Int = hoo()

public common class B {
    public static common var g: Int = 1000000
    public init() {}
}

public func printC() {
    println("${x} ${a} ${b} ${A.c} ${A.d} ${A.e} ${f} ${B.g}")
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
package cmp

public let y = 43

public specific let a: Int = 2

public specific var b: Int = 20

public specific class A {
    static func goo() { 200 }

    public static specific let c: Int = goo()

    public static specific let d: String = "2000"

    static func doo() { 20000 }

    public static specific let e: Int = doo()
}

public specific let f: Int = 200000

func joo() { 2000000 }

public specific class B {
    public static specific var g: Int = joo()
}

public func printP() {
    println("${x} ${y} ${a} ${b} ${A.c} ${A.d} ${A.e} ${f} ${B.g}")
}

// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor m_common.cj --import-path=./c -L./p -lcmp -o %output
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*

public let z = 44

main(): Unit {
    println(a)
    println(b)
    println(A.c)
    println(A.d)

    println(x)
    println(z)

    printC()
    println("${x} ${z} ${a} ${b} ${A.c} ${A.d} ${A.e} ${f} ${B.g}")
}

/* SCAN
2
20
200
2000
42
44
42 2 20 200 2000 20000 200000 2000000
42 44 2 20 200 2000 20000 200000 2000000
*/

// SEPARATE-FILE: m_platform.cj
// EXEC-0: %compiler %noColor m_platform.cj --import-path=./p -L./p -lcmp -o %output
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*

public let z = 44

main(): Unit {
    println(a)
    println(b)
    println(A.c)
    println(A.d)
    println(A.e)
    println(f)
    println(B.g)

    println(x)
    println(y)
    println(z)

    printC()
    printP()
    println("${x} ${y} ${z} ${a} ${b} ${A.c} ${A.d} ${A.e} ${f} ${B.g}")
}

/* SCAN
2
20
200
2000
20000
200000
2000000
42
43
44
42 2 20 200 2000 20000 200000 2000000
42 43 2 20 200 2000 20000 200000 2000000
42 43 44 2 20 200 2000 20000 200000 2000000
*/