/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:      04_03_a15_25

  @Level:         1

  @Assertion: 4.3(15) When the context does not require some specific type, if
              the two branch types of ifexpression are T1 and T2, then the type
              of the if expression is the least common supertype T of T1 and T2.
              If the least common super type does not exist, a compilation 
              error is reported.
  @Description: Checks that compile error occurs if common supertype does not 
                exists for T1 and T2. Tests instances of the custom struct and 
                class which implements the same interface.
  @Mode: compileonly
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 0006376

*/

interface I {}

class A <: I {}

struct B <: I {}

var x = 0

main() {
    var v  =
        if (x == 0) {
            A()
        } else {
            B()
        }
    return 
}
