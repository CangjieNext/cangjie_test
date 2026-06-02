/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_01_a04_02

  @Level:         1

  @Assertion:    3.3.1(4) Local variables cannot be modified with modifiers.

  @Description:  Check that local variable declaration can not include modifiers.
                 Case: local-level immutable variable can't be defined using 'private' modifier

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

main() {
    private let myLocalVar: String = "AAA"
}