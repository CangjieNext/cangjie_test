/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_04_02_a07_01

  @Level:         1
  @Assertion:    15.4.2(7)
                var a: String
                func foo(): Unit {
                    a = "hello, world"
                }
                main(): Int64 {
                    let t: Future<Unit> = spawn {
                        foo()
                    }
                    t.get()
                    println(a)
                    return 0
                }
                // OUTPUT:
                // hello, world

  @Description:  Checks that example from the spec works

  @Mode:         run
  @Negative:     no
  @Structure:    single

  @Issue:        0006210

*/

var a: String = ""
func foo(): Unit {
    a = "hello, world"
}
main(): Int64 {
    let t: Future<Unit> = spawn {
        foo()
    }
    t.get()
    println(a)
    return 0
}
// OUTPUT:
// hello, world
