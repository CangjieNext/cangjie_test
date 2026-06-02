/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:      04_02_a08_01

  @Level:         1

  @Assertion: 4.2(8) Also, it supports generics functions (See chapter 9) to
              declare type parameters. In this situation, generic function 
              names can be used as expressions if type arguments are given.
  @Description: Checks that generic functions are supported in Cangjie and can
                be used as expressions if type argiments are specified.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

func f<T1, T2>(a: T1, b: T2): (T1, T2) {   
    Assert.isTrue(a is T1)
    Assert.isTrue(b is T2)
    (a, b)
}

main() {
    var x1 = f<String, String>
    Assert.isTrue(x1 is (String, String) -> (String, String))
    var res1 = x1("Hello", "World")
    Assert.isTrue(res1 is (String, String))
    if(res1 != ("Hello", "World")) {
        Assert.fail(reason: "Should be equal.")
    }

    var x2 = f<Int64, Int16>
    Assert.isTrue(x2 is (Int64, Int16) -> (Int64, Int16))
    var res2 = x2(Assert.getRuntimeZero(), Int16(7))
    Assert.isTrue(res2 is (Int64, Int16))
    if(res2 != (0, Int16(7))) {
        Assert.fail(reason: "Should be equal.")
    }

    var x3 = f<Unit, Bool>
    Assert.isTrue(x3 is (Unit, Bool) -> (Unit, Bool))
    var res3 = x3((), false)
    Assert.isTrue(res3 is (Unit, Bool))
    if(res3 != ((), false)) {
        Assert.fail(reason: "Should be equal.")
    }
}
