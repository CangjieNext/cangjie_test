/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_04_a06_01

  @Level:         1

  @Assertion:    11.1.4(6) Except for the root package, the package name must be the same as the name of the directory where the package is located.
 
  @Description:  Check that compiler throws an error if package name is not consistent with the
                 directory structure.

  @Mode:         compileonly 

  @Negative:     no  

  @Structure:    single
 
  @Issue:        0006255

  @Comment:      This test uses custom driver written in `custom.py`. Compiler tries to build static lib
                 from package which name is not consistent with the directory structure. Test considered passed
                 if compiler throws an error.

*/

main() {
    return 0
}