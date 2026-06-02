/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a03_10

  @Level:         1

  @Assertion:    3.4.2(3) override means overriding a member of the parent class, See class for details

  @Description:  Check that variables cannot be overriden.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single
*/

open class C1 {
    var currentYear = 2023
}

class C2 <: C1 {
    override currentYear = 2024
}

main() {
    return 0
}
