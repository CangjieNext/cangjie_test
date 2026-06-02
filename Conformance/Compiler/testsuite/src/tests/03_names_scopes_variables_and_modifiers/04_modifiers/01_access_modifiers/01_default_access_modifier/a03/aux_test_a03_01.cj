/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         03_04_01_01_a03_01

  @Level:         1
  @Assertion:    3.4.1.1(3)
                // in package pkg1
                class A {
                    var v = 0
                }
                let b = A().v // ok
                // in package pkg2
                import pkg1.*
                func f() {
                    b = 0 // error, can not find b
                }

  @Description:  This file defines class A definition

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
*/

package pkg1

class A {
    var v = 0
}

let b = A().v // ok
