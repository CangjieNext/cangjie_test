/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_06_03_a04_03

  @Level:         1

  @Assertion:       8.6.3(4) 
                    package pkg1
                    public class Foo {}

                    ///////

                    package pkg2
                    import pkg1.Foo

                    public interface I1 {
                        func f(): Unit {}
                    }

                    extend Foo <: I1 {} // ok, external

                    ///////

                    package pkg3
                    import pkg1.Foo

                    public interface I2 {
                        func f(): Unit {}
                    }

                    extend Foo <: I2 {} // ok, external

                    ///////
                    
                    package pkg4
                    import pkg1.Foo
                    import pkg2.I1 // error
                    import pkg3.I2 // error

  @Description:     Negative example from spec: case 2.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       complex-main

  @Dependencies:    aux_test_a04_02.cj

*/

package pkg4

import pkg3.AuxTestA0402 // error

main() {
}
