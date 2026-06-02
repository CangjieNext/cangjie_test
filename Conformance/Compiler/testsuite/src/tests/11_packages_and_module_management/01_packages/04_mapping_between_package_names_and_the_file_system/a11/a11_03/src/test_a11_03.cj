/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_04_a11_03

  @Level:         1

  @Assertion:    11.1.2 In particular, a subpackage cannot have the same name as a member of the current package to ensure that the name in the access path is unique.
 
  @Mode:         compileonly 

  @Negative:     no
 
  @Issue:        6354

  @Comment:      This test uses custom driver written in `custom.py`. Test considered passed if compiler 
                 throws an error during compilation since package "A.B" clashes with the top-level declaration
                 "B" in package "A".
*/

import a.*
import a.b.*
public var h = A()
public var n = B()
main() {
    return 0
}