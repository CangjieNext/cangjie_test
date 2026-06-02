/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_01_a01_01

  @Level:         1

  @Assertion: 6.2.1.1(1)
              Interfaces are declared with the interface keyword.

  @Description: Check that interfaces can be declared with the 'interface' keyword

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface I1 {}

public interface I2 {}

interface I3 {}

interface I4<T> {}

interface I5<T> {}

interface I6 <: I1 & I2 {}

public interface I7<T> {}

interface I8<T> where T <: Any {}

public interface I9<T> <: I2 {}

public interface I10<T> <: I2 where T <: Any {}

class TypeTester<T> {}

main() {
    // Check that interface types were successfully created
    let t1 = TypeTester<I1>()
    Assert.isTrue(t1 is TypeTester<I1>)

    let t2 = TypeTester<I2>()
    Assert.isTrue(t2 is TypeTester<I2>)

    let t3 = TypeTester<I3>()
    Assert.isTrue(t3 is TypeTester<I3>)

    let t4 = TypeTester<I4<Unit>>()
    Assert.isTrue(t4 is TypeTester<I4<Unit>>)

    let t5 = TypeTester<I5<String>>()
    Assert.isTrue(t5 is TypeTester<I5<String>>)

    let t6 = TypeTester<I6>()
    Assert.isTrue(t6 is TypeTester<I6>)

    let t7 = TypeTester<I7<Bool>>()
    Assert.isTrue(t7 is TypeTester<I7<Bool>>)

    let t8 = TypeTester<I8<String>>()
    Assert.isTrue(t8 is TypeTester<I8<String>>)

    let t9 = TypeTester<I9<Object>>()
    Assert.isTrue(t9 is TypeTester<I9<Object>>)

    let t10 = TypeTester<I10<Rune>>()
    Assert.isTrue(t10 is TypeTester<I10<Rune>>)
}