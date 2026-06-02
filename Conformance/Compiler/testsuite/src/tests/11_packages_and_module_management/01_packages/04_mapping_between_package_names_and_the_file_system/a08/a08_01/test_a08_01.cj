/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_04_a08_01

  @Level:         1

  @Assertion:    11.1.4(8) According to path and package name consistency rules, 
                 the folder name in which the package resides must be a valid identifier 
                 and cannot contain other symbols such as  .. 
 
  @Description:  Check that folder name in which the package resides must be a valid identifier.

  @Mode:         compileonly 

  @Negative:     no
 
  @Comment:      This test uses custom driver written in `custom.py`. Compiler tries to build static lib
                 from source files situated in root dir called `custom_src`. Test considered passed if compiler 
                 throws an error since directory name is illegal.

*/
main() {
    return 0
}