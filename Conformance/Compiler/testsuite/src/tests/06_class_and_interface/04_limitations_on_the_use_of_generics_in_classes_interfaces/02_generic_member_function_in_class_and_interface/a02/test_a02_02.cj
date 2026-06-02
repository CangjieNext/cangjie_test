/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_04_02_a02_02

  @Level:         1

  @Assertion: 6.4.2(2)
              For example:
              interface Bar {
                  func bar<T>(a: T): Unit // OK
              }
              abstract class Foo {
                  public func foo<T>(a: T): Unit // OK
                  public open func goo<T>(a: T) {} // OK
              }
              class Boo {
                  public open func Boo<T>(a: T) {} // OK
              }

  @Description: Check the second negative case from the example

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006467

*/

abstract class Foo {
    public func foo<T>(a: T): Unit // OK
}

main() {
}