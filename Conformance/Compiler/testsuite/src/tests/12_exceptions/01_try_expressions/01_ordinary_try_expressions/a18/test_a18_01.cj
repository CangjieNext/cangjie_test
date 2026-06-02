/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_a18_01

  @Level:         1

  @Assertion:    12.1.1 (18) Afterwards, the instance is bound to the variable identifier so that it can be accessed
                             through identifier in the catch block. 

  @Description:  Checks that the exception identifier can be accessed in the catch-block in the expression
                 or declaration.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
open class MyException <: Exception {}
open class Exc1 <: MyException {}
open class Exc2 <: ArithmeticException {}
main() {
// test case #1
    try {
        try {
            throw MyException()
        } catch (e: Exception) {
            let exc = e
            throw exc
        }
    } catch (e1: Exception) {
        Assert.isTrue(e1 is MyException)    
    }
// test case #2
    try {
        try {
            throw Exc1()
        } catch (e: Exception) {
            let exc = e
            throw exc
        }
    } catch (e2: Exc1) {
        Assert.isTrue(e2 is Exc1)    
    }
// test case #3
    try {
        try {
            throw Exc2()
        } catch (e: Exception) {
            let exc = e
            throw exc
        }
    } catch (e3: Exc2) {
        Assert.isTrue(e3 is Exc2)    
    }
}