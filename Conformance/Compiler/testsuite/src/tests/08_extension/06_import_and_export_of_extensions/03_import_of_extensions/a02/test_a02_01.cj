/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_06_03_a02_01

  @Level:         1

  @Assertion:       8.6.3(2) 
                    package pkg1
                    public class Foo {}

                    extend Foo {
                        public func f() {}
                    }

                    ///////

                    package pkg2
                    import pkg1.Foo // import Foo
                    
                    main() {
                        let a = Foo()
                        a.f() // ok
                    }

  @Description:     Positive example from spec.

  @Mode:            compileonly

  @Negative:        no

  @Structure:       complex-main

  @Dependencies:    aux_test_a02_01.cj

*/

package pkg2

import pkg1.AuxTestA0201 // import Foo

main() {
    let a = AuxTestA0201()
    a.f() // ok
}
