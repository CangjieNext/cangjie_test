/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_02_02_01_a05_02

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

  @Description:     negative example from spec: Part 2.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       complex-main

  @Dependencies:    aux_test_a05_01.cj

  @Issue:           6124

*/
package p2

import utils.assert.Assert
import p1.*

class Bar <: AuxTestA0501 {
    func f() {
        v2 // ok
        v3 // ok
    }
}

main() {
    let a = Bar()
    Assert.equals(0, a.v2)
    Assert.equals(0, a.v3)
}
