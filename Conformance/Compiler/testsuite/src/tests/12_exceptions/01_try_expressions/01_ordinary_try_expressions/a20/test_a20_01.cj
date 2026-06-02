/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_a20_01

  @Level:         1

  @Assertion:    12.1.1(20) Because the type of a caught instance cannot be statically determined,
                            the instance is always converted to the least common supertype of all classes connected
                            by the |, after which the instance is bound with  identifier. As a result, member variables
                            and member functions that are only defined in the least common super-type
                            of all ExceptionClass_i (1 <= i <= n) can be accessed through identifier
                            within the catch block.

  @Description:  Checks that only members defined in the the least common supertype are accessible
                 in the catch block thru exception identifier when the expected exceptions are connected with the |. 

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue: 0006124
*/

import utils.assert.Assert

extend Exception {
    public func f() : Int32 {
        return 0
    }
    prop a : Int32 {
        get() {
            return -1
        }
    }
}

open class Exc <: Exception {}

open class Exc0 <: Exception {
    public func f0() : Float64 {
        return 0.0
    }
}

open class Exc1 <: Exception {
    public func f1() : Float64 {
        return 1.0
    }
}

open class Exc2 <: Exception {
    public func f2() : Float64 {
        return 2.0
    }
}

main() {
// test case #1
    try {
        throw Exc()
    } catch (e: Exc0 | Exc1 | Exc2 | Exc) {
        Assert.equals(0, e.f())
        Assert.equals(-1, e.a)
    }

// test case #2
    try {
        throw Exc0()
    } catch (e: Exc0 | Exc1 | Exc2 | Exc) {
        Assert.equals(0, e.f())
        Assert.equals(-1, e.a)
    }

// test case #3
    try {
        throw Exc1()
    } catch (e: Exc0 | Exc1 | Exc2 | Exc) {
        Assert.equals(0, e.f())
        Assert.equals(-1, e.a)
    }

// test case #4
    try {
        throw Exc2()
    } catch (e: Exc0 | Exc1 | Exc2 | Exc) {
        Assert.equals(0, e.f())
        Assert.equals(-1, e.a)
    }
}
