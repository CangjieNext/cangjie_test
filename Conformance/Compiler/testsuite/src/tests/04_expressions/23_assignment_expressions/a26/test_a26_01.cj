
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_23_a26_01

  @Level:         1

  @Assertion:   4.23(26) Finally, if the user overloads the **, *, /, %, +, -, <<, >>, &, ^, and | operators,
                then Cangjie will provide default implementation of their corresponding compound assignment operators
                **=, *=, /=, %=, +=, -=, <<=, >>=, &=, ^=, and |=.
  @Description: Checks compilation and execution of a program that uses the given compound assignment expressions.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
*/

import utils.assert.Assert

class C {
    let s : String

    C(str : String) { s = str }

    operator func +(str : String) {
        C("+")
    }

    operator func -(str : String) {
        C("-")
    }

    operator func *(str : String) {
        C("*")
    }

    operator func /(str : String) {
        C("/")
    }

    operator func %(str : String) {
        C("%")
    }

    operator func **(str : String) {
        C("**")
    }

    operator func <<(str : String) {
        C("<<")
    }

    operator func >>(str : String) {
        C(">>")
    }

    operator func &(str : String) {
        C("&")
    }

    operator func |(str : String) {
        C("|")
    }

    operator func ^(str : String) {
        C("^")
    }
}

main() {
    var obj = C("")
    let s = "1"
    obj += s
    Assert.equals("+", obj.s)
    obj -= s
    Assert.equals("-", obj.s)
    obj *= s
    Assert.equals("*", obj.s)
    obj /= s
    Assert.equals("/", obj.s)
    obj %= s
    Assert.equals("%", obj.s)
    obj **= s
    Assert.equals("**", obj.s)
    obj <<= s
    Assert.equals("<<", obj.s)
    obj >>= s
    Assert.equals(">>", obj.s)
    obj &= s
    Assert.equals("&", obj.s)
    obj |= s
    Assert.equals("|", obj.s)
    obj ^= s
    Assert.equals("^", obj.s)
}

