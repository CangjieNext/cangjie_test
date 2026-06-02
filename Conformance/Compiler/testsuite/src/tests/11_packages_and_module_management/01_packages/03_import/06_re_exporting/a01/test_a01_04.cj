/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:           11_01_03_06_a01_04

  @Level:         1

  @Assertion:      11.1.3.6(1) The imported content can be re-exported by using public import.  

  @Description:    Check that content can be re-exported with `public import package.contentName`
                   even if it was previously imported with `import package.*`

  @Mode:           compileonly

  @Negative:       no

  @Structure:      complex-main

  @Dependencies:   aux_test_a01_06.cj 

  @CompileWarning: Ignore

  @Comment:        CompileWarnings were explicitly ignored

 */
import p6.*

main() {
    PI
    return 0
}