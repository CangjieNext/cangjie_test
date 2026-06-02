/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_02_a07_03

  @Level:         1

  @Assertion:    12.2(7) The matching catch expression is identified in the reverse order of the function calls,
                         i.e., if it is first matched with catch blocks in the same try expression if there are
                         any and then those catch blocks of the try expression which invokes the containing function,
                         and so on.

  @Description:  Checks that matching the catch of throw expression is identified in the reverse order.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
import std.ast.*

main() {
    var tks = Tokens()
    tks += Token(TokenKind.NL)
    func foo1() : Unit {
        func foo(): Unit{
            throw SpawnException()
        }

        foo()
    }

    func foo2() : Unit {
        throw ArithmeticException()    
    }

    var throw_exception_caught : Bool
// test case #1
    throw_exception_caught = false
    try {
        try {
            try {
                throw ArithmeticException()
            } catch (e: StackOverflowError) {
                Assert.fail(reason : "Unexpected program behavior #1")
            }
        } catch (e: IndexOutOfBoundsException) {
            Assert.fail(reason : "Unexpected program behavior #2")
        }
    } catch (e: ArithmeticException) {
        throw_exception_caught = true
    }
    Assert.isTrue(throw_exception_caught, reason : "throw exception not caught #1")

// test case #2
    throw_exception_caught = false
    try {
        try {
            try {
                throw IndexOutOfBoundsException()
            } catch (e: StackOverflowError) {
                Assert.fail(reason : "Unexpected program behavior #3")
            }
        } catch (e: IndexOutOfBoundsException) {
            throw_exception_caught = true
        }
    } catch (e: ArithmeticException) {
        Assert.fail(reason : "Unexpected program behavior #4")
    }
    Assert.isTrue(throw_exception_caught, reason : "throw exception not caught #2")

// test case #3
    throw_exception_caught = false
    try {
        try {
            try {
                foo1()
            } catch (e: StackOverflowError) {
                throw_exception_caught = true
            } catch (e: SpawnException) {
                throw_exception_caught = true
            } 
        } catch (e: IndexOutOfBoundsException) {
        Assert.fail(reason : "Unexpected program behavior #5")
        }
    } catch (e: ArithmeticException) {
        Assert.fail(reason : "Unexpected program behavior #6")
    }
    Assert.isTrue(throw_exception_caught, reason : "throw exception not caught #3")

// test case #4
    throw_exception_caught = false
    try {
        try {
            try {
                foo1()
            } catch (e: StackOverflowError) {
                throw_exception_caught = true
            } catch (e: SpawnException) {
                throw_exception_caught = true
            } 
        } catch (e: StackOverflowError) {
        Assert.fail(reason : "Unexpected program behavior #7")
        }
    } catch (e: StackOverflowError) {
        Assert.fail(reason : "Unexpected program behavior #8")
    }
    Assert.isTrue(throw_exception_caught, reason : "throw exception not caught #4")

// test case #5
    throw_exception_caught = false
    try {
        try {
            try {
                foo2()
            } catch (e: ArithmeticException) {
                throw_exception_caught = true
            }
        } catch (e: ArithmeticException) {
        Assert.fail(reason : "Unexpected program behavior #9")
        }
    } catch (e: ArithmeticException) {
        Assert.fail(reason : "Unexpected program behavior #10")
    }
    Assert.isTrue(throw_exception_caught, reason : "throw exception not caught #5")
}

