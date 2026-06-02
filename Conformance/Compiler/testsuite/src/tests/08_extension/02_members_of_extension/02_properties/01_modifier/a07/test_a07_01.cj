/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_02_02_01_a07_01

  @Level:         1

  @Assertion:       8.2.2.1(7) 
                    class Foo {}
                    extend Foo {
                        static prop i: Int64 {
                            get() { 0 }
                        }
                    }

  @Description:     Positive example from spec.

  @Mode:            run

  @Negative:        no

  @Structure:       single

  @Issue:           6124

*/

import utils.assert.Assert

class Foo {}

extend Foo {
    static prop i: Int64 {
        get() { 0 }
    }
}

main(): Unit { 
    Assert.equals(0, Foo.i)
} 
