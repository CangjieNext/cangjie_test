/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         03_04_01_03_a03_01

  @Level:         1
  @Assertion:    3.4.1.3 (3)
    // in package pkg1
    public var v = 0
    public class A {
        public var v = 0
    }
    // in package pkg2
    import pkg1.*
    func f() {
        v = 2 // ok
        let a = A()
        a.v = 2 // ok
    }

  @Description: Tests example from the spec

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: aux_test_a03_01.cj
*/

package pkg2

import pkg1.*

func f() {
    v = 2 // ok
    let a = A()
    a.v = 2 // ok
}

main() {
    f()
}
