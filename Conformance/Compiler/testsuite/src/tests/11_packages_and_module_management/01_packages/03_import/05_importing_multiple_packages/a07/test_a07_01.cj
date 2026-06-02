/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_05_a07_01

  @Level:         1

  @Assertion:    11.1.3.5(7) Conflicting definitions or declarations cannot be accessed 
                 through packageName.declName or declName, because neither of these two
                 methods can distinguish which definition or declaration is used. 

  @Description:  Check that conflicting definitions or declarations cannot be accessed 
                 through packageName.declName

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: aux_test_a07_01.cj aux_test_a07_02.cj

  @Module:       mod3
 */

import mod1.p.*
import mod2.p.*

main() {
    p.moduleName()
    return 0
}

