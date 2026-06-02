/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_04_a06_02

  @Level:         1

  @Assertion:    11.1.4(6) It implies that the package name must be adjusted sometime to 
                 be consistent with the directory structure, as shown in the following example. 
 
  @Description:  Check that compiler throws an error if directory contains multiple packages.

  @Mode:         compileonly 

  @Negative:     yes  

  @Structure:    single
 
  @Comment:      This test uses custom driver written in `custom.py`. Compiler tries to build static lib
                 from directory with several packages. Test considered passed if compiler throws an error.
*/

main() {
    return 0
}