
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_26_a01_01

  @Level:         1

  @Assertion:   4.26(1) The macro call expression is used to invoke the macro defined by cangjie. It is mainly used
                for metaprogramming. For details, see chapter 14.
  @Description: Checks compilation and execution of a program that uses macro call expressions.
  @Mode: run
  @Negative: no
  @Structure: complex-main
  @Dependencies: aux_a01.cj
  @CompileWarning: no

  @Issue: 0006421

*/

import aux_a01.*

import utils.assert.Assert

@OverflowWrapping
func f(x : Int64, y : Int64) { x + y }

@letDecl[Int32](i32)

@funcDecl[f1]("123")
@funcDecl[f2](123)

main() {
    Assert.equals(-2, f(Int64.Max, Int64.Max))
    Assert.equals(123, i32)
    Assert.isTrue(i32 is Int32)
    Assert.equals("123", f1())
    Assert.equals(123, f2())
}
