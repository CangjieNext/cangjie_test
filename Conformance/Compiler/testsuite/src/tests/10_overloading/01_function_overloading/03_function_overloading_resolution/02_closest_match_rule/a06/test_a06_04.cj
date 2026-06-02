/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_03_02_a06_04

  @Level:         1

  @Assertion:    10.1.3.2(6) The following are some examples of function overloading resolutions:    
  
  @Description:   Selected  foo3. foo3 is the only function in candidate set.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

open class A {}
class B <: A {}
func foo<X>(a: X, b: X): Int32 {
	Assert.fail()
} // foo1
func foo(a: A, b: B): Int32 {
	Assert.fail()
} // foo2
func foo<X>(a: A, b: X): Int32 {
	return Int32(0)
} // foo3

main() {
	foo(A(), 1) // foo3. foo3 is the only function in candidate set.
}