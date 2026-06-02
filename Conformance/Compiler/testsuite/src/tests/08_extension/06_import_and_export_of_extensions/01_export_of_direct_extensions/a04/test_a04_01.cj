/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_06_01_a04_01

  @Level:         1

  @Assertion:       8.6.1(4)
                    package pkg1
                    public class Foo {}

                    ///////

                    package pkg2
                    import pkg1.*

                    extend Foo {
                        public func f() {}
                    }

                    func g() {
                        let a = Foo()
                        a.f() // ok
                    }

                    ///////

                    package pkg3

                    import pkg1.*
                    import pkg2.*
                    
                    main() {
                        let a = Foo()
                        a.f() // error
                    }

  @Description:     Negative example from spec.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       complex-main

  @Dependencies:    aux_test_a04_01.cj aux_test_a04_02.cj

*/

package pkg3

import pkg1.*
import pkg2.*

main() {
    let a = AuxTestA0401()
    a.f() // error
}
