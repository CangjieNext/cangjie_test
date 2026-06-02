/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_a13_01

  @Level:         1

  @Assertion:    11.1.3(13) It is not supported to use the fully qualified 
                 name to access the contents of other packages that are not
                 imported. 

  @Description:  Check that it's not supported to use the fully qualified name 
                 to access the contents of other packages that are not imported.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: aux_test_a13_01.cj

*/


main() {
    p1.currentYear
    return 0
}
