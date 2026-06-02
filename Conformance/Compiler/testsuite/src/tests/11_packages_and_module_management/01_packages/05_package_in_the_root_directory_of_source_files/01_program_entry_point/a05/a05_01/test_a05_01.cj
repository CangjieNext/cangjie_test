/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_05_01_a05_01

  @Level:         1

  @Assertion:    11.1.5.1(5) When a package is compiled into a library,
                 the program entry will be ignored by the compiler.
 
  @Description:  Check that package may consist of multiple source files.

  @Mode:         run 

  @Negative:     no  
 
  @Comment:      This test uses custom driver written in `custom.py`. Compiler
                 builds static library `libpkg1.a` from `a.cj`. Afterwards, compiler
                 builds executable from `test_a05_01.cj` and `libpkg1.a`. Both packages
                 (default and pkg1) have main(), but since pkg1 was compiled into a library
                 it's program entry must be ingored by the compiler.
*/

main() {
    print("Hello, world!")
    return 0
}