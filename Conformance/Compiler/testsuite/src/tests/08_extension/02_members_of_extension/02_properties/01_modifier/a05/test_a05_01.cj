/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_02_02_01_a05_01

  @Level:         1

  @Assertion:       8.2.2.1(5) 
                    // file1 in package p1
                    package p1

                    public open class Foo {}

                    extend Foo {
                        private prop v1: Int64 { // ok
                            get() { 0 }
                        }
                        public prop v2: Int64 { // ok
                            get() { 0 }
                        }
                        protected prop v3: Int64 { // ok
                            get() { 0 }
                        }
                        prop v4: Int64 { // visible in the package
                            get() { 0 }
                        }
                    }

                    main() {
                        let a = Foo()
                        a.v1 // error, can not access private property
                        a.v2 // ok
                        a.v3 // ok
                        a.v4 // ok
                    }

                    // file2 in package p2
                    package p2

                    import p1.*

                    class Bar <: Foo {
                        func f() {
                            v1 // error, can not access private function
                            v2 // ok
                            v3 // ok
                            v4 // error, can not access default function
                        }
                    }

  @Description:     Positive example from spec: Part 1.

  @Mode:            run

  @Negative:        no

  @Structure:       single

  @Issue:           6124

*/

// file1 in package p1
package p1

import utils.assert.Assert

public open class TestA0501 {}

extend TestA0501 {
    private prop v1: Int64 { // ok
        get() { 0 }
    }
    public prop v2: Int64 { // ok
        get() { 0 }
    }
    protected prop v3: Int64 { // ok
        get() { 0 }
    }
    prop v4: Int64 { // visible in the package
        get() { 0 }
    }
}

main() {
    let a = TestA0501()
    a.v2 // ok
    a.v3 // ok
    a.v4 // ok

    Assert.equals(0, a.v2)
    Assert.equals(0, a.v3)
    Assert.equals(0, a.v4)
}
