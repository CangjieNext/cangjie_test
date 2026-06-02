/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_02_a07_01

  @Level:         1

  @Assertion:    12.1.1.2(7) - If some other return e2 or throw e2 in the finally block is executed,
                               e2 will be evaluated to the result v2. Then v2 is returned or thrown immediately.

  @Description:  Checks that if e2 is returned or thrown during finally block execution, e2 is evaluated as a result v2
                 and it gets returned or thrown immediately.

  @Mode:         run

  @Negative:     no

  @CompileWarning: Ignore

  @Structure:    single

*/

import utils.assert.Assert
open class E1 <: Exception {}
open class E2 <: Exception {}
main() {
// test case #1
    func foo() {
        let y = 10
        try {
            return y * y
            Assert.fail()
        } finally {
            return y + y         
            Assert.fail()
        }
    }
    Assert.equals(20, foo())

// test case #2
    func bar() {
        try {
            throw E1() 
        } finally {
            throw E2() 
            Assert.fail()
        }
    }
    try {
        bar()
    } catch (e: Exception) {
        Assert.isTrue(e is E2)        
    }
}