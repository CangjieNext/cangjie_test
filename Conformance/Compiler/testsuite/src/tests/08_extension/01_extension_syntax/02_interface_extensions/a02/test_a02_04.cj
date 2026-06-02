/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_01_02_a02_04

  @Level:         1

  @Assertion:   8.1.2(2) When using interface extensions, the interface being implemented
                must be declared.

  @Description: Checks that interface extensions cannot implement abstract class.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       


*/

abstract class I {
    public func foo(): String
}

extend Bool <: I {
    public func foo(): String { "bool" }
}

main() { }
