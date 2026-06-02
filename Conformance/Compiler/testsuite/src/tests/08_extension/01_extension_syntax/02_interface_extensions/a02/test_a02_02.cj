/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_01_02_a02_02

  @Level:         1

  @Assertion:   8.1.2(2) When using interface extensions, the interface being implemented
                must be declared.

  @Description: Checks that undeclared interface is not allowed for interface extensions.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       


*/

extend Bool <: I {
    public func foo(): String { "bool" }
}

main() { }
