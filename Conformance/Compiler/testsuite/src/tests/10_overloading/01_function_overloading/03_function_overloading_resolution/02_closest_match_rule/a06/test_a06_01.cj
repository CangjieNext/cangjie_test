/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_03_02_a06_01

  @Level:         1

  @Assertion:    10.1.3.2(6) The following are some examples of function overloading resolutions:    
  
  @Description:   choose f1, because I4 <: I3

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

interface I3 {}
interface I1 <: I2 & I3 {}
interface I2 <: I4 {}
interface I4 <: I3 {}
func f(x: I4) {} // f1
func f(x: I3) {
	Assert.fail()
} // f2
class C1 <: I1 {}



main() {
	var obj = C1()
	var result = f(obj) // choose f1, because I4 <: I3
}