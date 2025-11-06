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

func foo() { 100 }

public common let c: Int = foo()

public common let d: String = "1000"

public common let e: Int = 10000

func hoo() {
    100000
}

public common let f: Int = hoo()

public common var g: Int = 1000000

public func printC() {
    println("${x} ${a} ${b} ${c} ${d} ${e} ${f} ${g}")
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
package cmp

public let y = 43

public platform let a: Int = 2

public platform var b: Int = 20

func goo() { 200 }

public platform let c: Int = goo()

public platform let d: String = "2000"

func doo() { 20000 }

public platform let e: Int = doo()

public platform let f: Int = 200000

func joo() { 2000000 }

public platform var g: Int = joo()

public func printP() {
    println("${x} ${y} ${a} ${b} ${c} ${d} ${e} ${f} ${g}")
}

// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor m_common.cj --import-path=./c -L./p -lcmp -o %output
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*

public let z = 44

main(): Unit {
    println(a)
    println(b)
    println(c)
    println(d)

    println(x)
    println(z)

    printC()
    println("${x} ${z} ${a} ${b} ${c} ${d} ${e} ${f} ${g}")
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
    println(c)
    println(d)
    println(e)
    println(f)
    println(g)

    println(x)
    println(y)
    println(z)

    printC()
    printP()
    println("${x} ${y} ${z} ${a} ${b} ${c} ${d} ${e} ${f} ${g}")
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