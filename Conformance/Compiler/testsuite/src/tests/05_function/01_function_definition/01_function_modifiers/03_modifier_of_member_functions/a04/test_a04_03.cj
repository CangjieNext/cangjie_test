/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_01_03_a04_03

  @Level:         1

  @Assertion:     5.1.1.3(4) The modifiers of the enum member function include public, private, and static. 
                  For details, see Enum Type.

  @Description:   Check that enum member function definition can't use mut function modifier.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

enum myEnum {
  A

  mut func myEnumProtectedFunc(): Unit {}
} 

main() {
}
