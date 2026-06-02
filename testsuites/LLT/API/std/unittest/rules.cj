/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// ERRCHECK: %compiler %cmp_opt %f -o %output %cmp_utest_opt

package pkgA

import std.unittest.* //testfame
import std.unittest.testmacro.* //macro_Defintion

func get(): Int64 {
    return 13;
}

@Test
func calcResult(): Unit {
    let a = 64
    let b = 129
    print("result:${(a + b)}\r\n")
}

@Test
public class MyTestFuncCls {
    @Test // EXPECT: scan '@Test modified function is not top level'
    func myValue(): Int64 {
        return 250
    }
}

@Test
public class MyTestCls {
    func getValue(): Int64 {
        println("getValue")
        256
    }

    override func beforeAll(): Unit {
        println("beforeAll")
    }

    @TestCase
    @Skip
    func myCase1(): Unit {
        println("This is case no.1")
    }

    @TestCase
    func myCase2(): Unit {
        print("This is case no.2")
        let s = Array<Int64>([])
        print("End of case no.2")
    }

    @TestCase
    func myCase3(): Unit {
        @Expect(get(), 11)
        @Expect(Array<Int64>([1,2,3]), Array<Int64>([1,2]))
        println("End of case no.3")
    }

    @Bench[10]
    @TestCase
    func myCase4() {
        var s: String = "hello cangjie"
        for (i in 1..1000) {
            s = s.concat(i.toString())
        }
    }
}

@Test
func myFunc() {
    var s: String = "hello cangjie"
    for (i in 1..10000) {
        s = s.concat(i.toString())
    }
}

/* SCAN
error: macro using error, '@Test modified function is not top level'
  ==> rules.cj:28:5:
   | 
28 |     @Test // EXPECT: scan '@Test modified function is not top level'
   |     ^ 
   | 

1 error generated, 1 error printed.
*/
