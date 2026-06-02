/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a01_05

  @Level:         1

  @Assertion:    3.4.2(1) Cangjie provides a number of non-access modifiers to support other rich features.

  @Description:  Checks that a typo in a non-access modifier results in a compile error (static modifier).

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:
*/

class C1 {
    stat var defaultVariable = 2023
}

main() {
    return 0
}
