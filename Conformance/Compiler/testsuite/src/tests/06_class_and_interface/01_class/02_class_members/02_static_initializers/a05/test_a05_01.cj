
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a05_01

  @Level:         1

  @Assertion:   6.1.2.2(5) - A static initializer is called when the package it belongs to is loading, like an
                initializer expression for a static variable on the right hand side; 
  @Description: Checks that static initializer is called when the package it belongs to is loading.
  @Mode: run
  @Negative: no
  @Structure: complex-main
  @Dependencies: aux_a05_c_import.cj aux_a05_c0.cj aux_a05_c1.cj aux_a05_p1.cj aux_a05_p2.cj
  @CompileWarning: no
  @Issue: 6136

*/

import p1.*
import p2.*

class C {
    static let t : Duration

    static init() { t = getTime() }
}

var assertC0 = Assert.isTrue(C0.t < C.t)
var assertC1 = Assert.isTrue(C1.t < C.t)
var assertP2 = Assert.isTrue(AuxA05P2.t < C0.t && AuxA05P2.t < C1.t)

main() { }
