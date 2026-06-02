/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        11_01_03_04_a01_03

  @Level:         1

  @Assertion:   11.1.3.4(1) A package can import multiple declarations for the same 
                 package, which can be done in one of three ways. 

  @Description:  Check that package can import multiple declarations : combine multiple import ways

  @Mode:         compileonly

  @Negative:     no
  
  @Structure:    complex-main

  @CompileWarning:  yes

  @Dependencies: aux_test_a01_02.cj aux_test_a01_03.cj

 */

import {way3.packageName, way3.G, way3.AuxTestA0103, way2.packageName}

main() {
    return 0
}
