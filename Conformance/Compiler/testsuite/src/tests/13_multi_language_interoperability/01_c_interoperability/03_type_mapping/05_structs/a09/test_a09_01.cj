/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     13_01_03_05_a09_01

  @Level:         1

  @Assertion:    13.1.3.5(9) Structs modified by @C automatically conform to CType constraint.

  @Description:  @C struct implements CType interface.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

  @Comment:      

  @Issue: 0006421
*/

@C
struct ABC {}

main() {
    var x:CType = ABC()
}