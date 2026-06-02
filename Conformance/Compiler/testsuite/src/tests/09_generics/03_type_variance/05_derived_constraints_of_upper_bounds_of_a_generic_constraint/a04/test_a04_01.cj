/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_03_05_a04_01

  @Level:         1

  @Assertion: 9.3.5(4) When a constraint is declared, constraints of its upper bound also need to be introduced to the
              constraint. 

  @Description: Check that not introduced upper bound constraint causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

interface Eq<T> { 
    func eq(other: T): Bool 
}

interface Ord<T> where T <: Eq<T> { 
    func lt(other: T): Bool 
} 

// Eq<Number> is not introduced as constraint. Compilation error.
class Number <: Ord<Number> {
    init(arg: Int64) {
        value = arg
    }

    public func eq(other: Number): Bool {
        return value == other.value
    }

    public func lt(other: Number): Bool {
        return value < other.value
    }

    func get() {
        return value
    }

    var value: Int64
}

main() {}

