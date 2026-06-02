/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        03_02_03_01_a02_04

  @Level:         1
  @Assertion:   3.2.3.1(2) The scope of top-level functions, types (including class, interface, enum, struct, and type)
                is the entire package, and thus they are accessible in the entire package.
  @Mode:        compileOnly
  @Negative:    yes
  @Structure:   complex-main
  @Dependencies: ext_a02_04.cj

*/

package somepackage4

interface Inter1 <: Inter2 {
    func getInt(): Int64
}

main() {
  return 0
}
