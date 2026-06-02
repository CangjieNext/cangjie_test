/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         03_04_01_04_a03_01

  @Level:         1
  @Assertion:    3.4.1.4(3)
    // in package pkg1
    public open class A {
        protected var v = 0
    }
    // in package pkg2
    import pkg1.*
    func f() {
        let a = A()
        a.v = 2 // error, can not find v
    }
    class B <: A {
        func f() {
            v = 2 // ok
        }
    }

  @Description:  Tests example from the spec as-is

  @Mode:         compileonly
  @Negative:     yes
  @Structure:    complex-main
  @Dependencies: aux_test_a03.cj
*/

package pkg2

import pkg1.*

func f() {
    let a = AuxTestA03()
    a.v = 2 // error, can not find v
}

class B <: AuxTestA03 {
    func f() {
        v = 2 // ok
    }
}

main() {
}
