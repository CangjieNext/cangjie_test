/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_04_a10_01

  @Level:         1

  @Assertion:    11.1.4(10) It is prohibited that a package having a sub-directory 
                 with the same name as a top level declarations in that package. 
 
  @Description:  Check that packages cannot have a sub-directory with the same name as
                 top level declarations on the package.

  @Mode:         compileonly 

  @Negative:     no
 
  @Comment:      This test uses custom driver written in `custom.py`. Test considered passed if compiler 
                 throws an error during compilation since top-level declaration C1 clashes wit sub-directory
                 of the same name.  

  @Issue:        0006354

*/

main() {
    return 0
}