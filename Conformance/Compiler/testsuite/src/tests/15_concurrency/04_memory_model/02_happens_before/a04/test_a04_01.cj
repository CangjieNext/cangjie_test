/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_04_02_a04_01

  @Level:         1
  @Assertion:    15.4.2(4)
                var a: String
                func foo(): Unit {
                    prtinln(a)
                }
                main(): Int64 {
                    a = "hello, world"
                    let fut: Future<Unit>= spawn {
                        foo()
                    }
                    fut.get()
                    return 0
                }
                // OUTPUT:
                // hello, world

  @Description:  Checks that example from the spec works

  @Mode:         run
  @Negative:     no
  @Structure:    single

  @Issue:        0006211

*/

var a: String = ""

func foo(): Unit {
    println(a)
}

main(): Int64 {
    a = "hello, world"
    let fut: Future<Unit> = spawn {
        foo()
    }
    fut.get()
    return 0
}
// OUTPUT:
// hello, world