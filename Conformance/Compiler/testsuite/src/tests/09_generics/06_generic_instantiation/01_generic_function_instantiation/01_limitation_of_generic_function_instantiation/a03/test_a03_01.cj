/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_06_01_01_a03_01

  @Level:         1

  @Assertion: 9.6.1.1(3) The following generic function definitions are legal: 

              class Foo {
                  static func foo<T>(a: T) {...} // generic static function in class
                  func bar<T>(a: T) {...} // generic non-open function in class
              }

              abstract class Bar {
                  func bar<T>(a: T) {...} // generic non-open function in abstract class
              }

              struct R {
                  func foo<T>(a: T) {...} // generic function in struct
              }

              enum E {
                  A | B | C
                  func e<T>(a: T) {...} // generic function in enum
              }

  @Description: Check the example provided.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class Foo {
    // generic static function in class
    static func foo<T>(a: T) {
        return "foo"
    }

    // generic non-open function in class
    func bar<T>(a: T) {
        return "bar"
    }
}

abstract class Bar {
    // generic non-open function in abstract class
    func bar<T>(a: T) {
        return "bar"
    }
}

struct R {
    // generic function in struct
    func foo<T>(a: T) {
        return "foo"
    }
}

class BBar <: Bar {}

enum E {
    A | B | C

    // generic function in enum
    func e<T>(a: T) {
        return "e"
    }
}

main() {
    let s = "hello world"
    Assert.equals("foo", Foo.foo<String>(s))
    Assert.equals("bar", Foo().bar<String>(s))
    Assert.equals("bar", BBar().bar<String>(s))
    Assert.equals("foo", R().foo<String>(s))
    Assert.equals("e", E.A.e<String>(s))
}

