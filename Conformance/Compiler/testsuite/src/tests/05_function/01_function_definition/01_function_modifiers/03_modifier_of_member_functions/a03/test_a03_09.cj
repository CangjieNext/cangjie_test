/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_01_03_a03_09

  @Level:         1

  @Assertion:     5.1.1.3(3) The modifiers of the struct member function include mut, public, private, and static. 
                  For details, see Struct Type.

  @Description:   Check that struct member function definition can't use redef function modifier inside 
                  struct body.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

struct myStruct {
  public var myStructPublicVar: Int32 = 0
  private var myStructPrivateVar: Int32 = 0

  redef func f() {
    this.myStructPublicVar
  } 
}

main() {
}
