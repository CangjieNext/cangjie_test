/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_a02_03

  @Level:         1

  @Assertion:    11(2) The members of a package are top-level definitions or declarations that can be 
                 defined or declared within the source files in the package.
 
  @Description:  Check that Cangjie cannot use members of other packages if packages are not
                 explicitly imported

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: aux_test_a02_01.cj

 */

main() {
    foo()
    return 0
}
