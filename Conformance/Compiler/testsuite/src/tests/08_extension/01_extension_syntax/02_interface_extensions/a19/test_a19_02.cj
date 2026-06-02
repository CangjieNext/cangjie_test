/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         08_01_02_a19_02

  @Level:         1

  @Assertion:    8.1.2(19) 
                 // in package pkg1
                 public class Foo {}

                 // in package pkg2
                 public interface Bar {}

                 // in package pkg3
                 import pkg1.Foo
                 import pkg2.Bar
                 extend Foo <: Bar {} // error
                 interface Sub <: Bar {}
                 extend Foo <: Sub {} // error

  @Description:  Checks that example is compiled with error (second error line).

  @Mode:         compileonly
  @Negative:     yes
  @Structure:    complex-main
  @Dependencies: aux_test_a19_01.cj aux_test_a19_02.cj


*/

package pkg3

import pkg1.AuxTestA1901
import pkg2.AuxTestA1902

interface Sub <: AuxTestA1902 {}

extend AuxTestA1901 <: Sub {} // error

main() { }
