/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Description:     Defines a package pkg2 for example.

  @Dependencies:    aux_test_a04_01.cj

  @Structure:       complex-aux
*/

package pkg2

import pkg1.*

extend AuxTestA0401 {
    public func f() {}
}

func g() {
    let a = AuxTestA0401()
    a.f() // ok
}
