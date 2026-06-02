/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_01_01_a03_01

  @Level:         1
  @Assertion:    15.1.1(3)
                    func foo(): Int64 {...}
                    func bar(): String {...}
                    // The return type of foo() is Int64.
                    let f1: Future<Int64> = spawn {
                        foo()
                    }
                    // The return type of bar() is String.
                    let f2: Future<String> = spawn {
                        bar()
                    }
                    // Waiting for the threads' execution results.
                    let r1: Int64 = f1.get()
                    let r2: String = f2.get()

  @Description:  Checks that example from the spec works

  @Mode:         run
  @Negative:     no
  @Structure:    single

*/

import utils.assert.Assert

func foo(): Int64 {
    return 0x29A
}

func bar(): String {
    return "شیطان"
}

// The return type of foo() is Int64.
let f1: Future<Int64> = spawn {
    foo()
}

// The return type of bar() is String.
let f2: Future<String> = spawn {
    bar()
}

// Waiting for the threads' execution results.
let r1: Int64 = f1.get()
let r2: String = f2.get()

main(): Int64 {
    Assert.equals(0x29A, r1)
    Assert.equals("شیطان", r2)

    0
}
