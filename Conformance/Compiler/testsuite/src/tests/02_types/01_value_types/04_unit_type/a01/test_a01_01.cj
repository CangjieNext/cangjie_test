/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
   @Name:         02_01_04_a01_01

  @Level:         1

   @Assertion:    2.1.4(1) The Unit type has only one value (). 

   @Description:  Check that Unit type has only one value

   @Mode:         run

   @Negative:     no

   @Structure:    single

 */

import utils.assert.Assert

func foo(): Unit {
  print("foo")
}

func boo(): Unit {
  print("boo")
}

main() {
  var u1: Unit = foo()
  var u2: Unit = boo()

  Assert.isTrue(() == u1)
  Assert.isTrue(() == boo())
  Assert.isTrue(foo() == boo())
  Assert.isTrue(u1 == u2)
}

