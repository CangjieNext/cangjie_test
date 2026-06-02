/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_02_a04_01

  @Level:         1

  @Assertion: 4.5.2(4) For while expressions that contain let, we call them while-let expressions.
              We can use while-let expressions to do some simple deconstruction operations
  @Description: Check that deconstruction operations can be done with while-let
  @Mode: run
  @Negative: no
  @Issue: 6473

*/

import utils.assert.Assert

enum E { Foo(Int32, Int32) }

var count: Int32 = 0

func f() {
    if (count == 5) {
        return ("Found", Foo(5, 25))
    } else {
        count++
        return ("In progress", Foo(count, count))
    }
}

main() {
    while(let ("In progress", Foo(x, y)) <- f()) {
        Assert.isTrue(x == y)
    }
    let (_, Foo(result_x, result_y)) = f()
    Assert.equals(5, result_x)
    Assert.equals(25, result_y)
}
