/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_02_a05_01

  @Level:         1

  @Assertion: 6.2.1.2(5)
              Of course, it is allowed to explicitly use the modifier before the interface definition

  @Description: Check that the 'open' modifier is allowed in interface definitions

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface I1 {}

interface I2<T> {}

public interface I3 {}

public interface I4<T> {}

interface I5 {
    func f(x: Int64): Int64
}

interface I6<T> {
    func f(x: Int64): Int64
}

public interface I7 {
    func f(x: Int64): Int64
}

public interface I8<T> {
    func f(x: Int64): Int64
}

interface I9 {
    func f(x: Int64) {
        return 1
    }
}

interface I10<T> {
    func f(x: Int64) {
        return 1
    }
}

public interface I11 {
    func f(x: Int64) {
        return 1
    }
}

public interface I12<T> {
    func f(x: Int64) {
        return 1
    }
}

class TypeChecker<T> {}

main() {
    let i1 = TypeChecker<I1>()
    Assert.isTrue(i1 is TypeChecker<I1>)

    let i2 = TypeChecker<I2<Unit>>()
    Assert.isTrue(i2 is TypeChecker<I2<Unit>>)

    let i3 = TypeChecker<I3>()
    Assert.isTrue(i3 is TypeChecker<I3>)

    let i4 = TypeChecker<I4<Unit>>()
    Assert.isTrue(i4 is TypeChecker<I4<Unit>>)

    let i5 = TypeChecker<I5>()
    Assert.isTrue(i5 is TypeChecker<I5>)

    let i6 = TypeChecker<I6<Unit>>()
    Assert.isTrue(i6 is TypeChecker<I6<Unit>>)

    let i7 = TypeChecker<I7>()
    Assert.isTrue(i7 is TypeChecker<I7>)

    let i8 = TypeChecker<I8<Unit>>()
    Assert.isTrue(i8 is TypeChecker<I8<Unit>>)

    let i9 = TypeChecker<I9>()
    Assert.isTrue(i9 is TypeChecker<I9>)

    let i10 = TypeChecker<I10<Unit>>()
    Assert.isTrue(i10 is TypeChecker<I10<Unit>>)

    let i11 = TypeChecker<I11>()
    Assert.isTrue(i11 is TypeChecker<I11>)

    let i12 = TypeChecker<I12<Unit>>()
    Assert.isTrue(i12 is TypeChecker<I12<Unit>>)
}