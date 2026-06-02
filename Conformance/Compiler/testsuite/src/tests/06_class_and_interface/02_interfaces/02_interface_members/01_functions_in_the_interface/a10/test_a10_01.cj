/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_01_a10_01

  @Level:         1

  @Assertion: 6.2.2.1(10)
              When a static member function is called directly using the interface type name,
              it will be compiled with an error if the function contains a direct 
              or indirect call to another static function that is not implemented
              in the interface (by itself or by another interface).

  @Description: Check that static functions called through the type name
                can contain calls to another static functions with a default implementation

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface I {
    // functions directly calling other functions by name
    static func chain(p1: Int64, p2: Int64, p3: Int64, p4: Int64, p5: Int64) {
        return p5 + chain(p1, p2, p3, p4)
    }
    static func chain(p1: Int64, p2: Int64, p3: Int64, p4: Int64) {
        return p4 + chain(p1, p2, p3)
    }
    static func chain(p1: Int64, p2: Int64, p3: Int64) {
        return p3 + chain(p1, p2)
    }
    static func chain(p1: Int64, p2: Int64) {
        return p2 + chain(p1)
    }
    static func chain(p1: Int64) {
        return p1
    }

    static func chain_g<T>(p1: Int64, p2: Int64, p3: Int64, p4: Int64, p5: Int64) {
        return p5 + chain_g<T>(p1, p2, p3, p4)
    }
    static func chain_g<T>(p1: Int64, p2: Int64, p3: Int64, p4: Int64) {
        return p4 + chain_g<T>(p1, p2, p3)
    }
    static func chain_g<T>(p1: Int64, p2: Int64, p3: Int64) {
        return p3 + chain_g<T>(p1, p2)
    }
    static func chain_g<T>(p1: Int64, p2: Int64) {
        return p2 + chain_g<T>(p1)
    }
    static func chain_g<T>(p1: Int64) {
        return p1
    }

    // functions calling other functions through the type
    static func real_call() {
        return 1
    }
    static func proxy() {
        return I.real_call()
    }

    static func real_call_g<T>() {
        return 2
    }
    static func proxy_g<T>() {
        return I.real_call_g<T>()
    }

    // recursive functions
    static func factorial(x: Int64): Int64 {
        if (x <= 0) {
            return 1
        } else {
            return factorial(x - 1) * x
        }
    }
    
    static func factorial_g<T>(x: Int64): Int64 {
        if (x <= 0) {
            return 1
        } else {
            return factorial_g<T>(x - 1) * x
        }
    }

    // functions calling functions that will be implemented in a subtype
    static func no_def(): Int64
    static func delayed() {
        return no_def()
    }

    static func no_def_g<T>(): Int64
    static func delayed_g<T>() {
        return no_def_g<T>()
    }

    // functions calling several functions
    static func part1() {
        return 5
    }
    static func part2() {
        return 6
    }
    static func part3() {
        return 7
    }
    static func whole() {
        return part1() + part2() - part3()
    }

    static func part1_g<T>() {
        return 8
    }
    static func part2_g<T>() {
        return 9
    }
    static func part3_g<T>() {
        return 10
    }
    static func whole_g<T>() {
        return part1_g<Bool>() + part2_g<Rune>() - part3_g<String>()
    }
}

interface J <: I {
    static func no_def() {
        return 3
    }
    static func no_def_g<T>() {
        return 4
    }
}

main() {
    Assert.equals(15, I.chain(1, 2, 3, 4, 5))
    Assert.equals(40, I.chain_g<Unit>(6, 7, 8, 9, 10))
    Assert.equals(1, I.proxy())
    Assert.equals(2, I.proxy_g<Unit>())
    Assert.equals(40320, I.factorial(8))
    Assert.equals(3628800, I.factorial_g<Unit>(10))
    Assert.equals(3, J.delayed())
    Assert.equals(4, J.delayed_g<Unit>())
    Assert.equals(4, I.whole())
    Assert.equals(7, I.whole_g<Unit>())
}