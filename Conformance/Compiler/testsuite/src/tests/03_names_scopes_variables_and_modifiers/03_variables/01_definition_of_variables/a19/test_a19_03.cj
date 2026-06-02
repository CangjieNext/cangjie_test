/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_01_a19_03

  @Level:         1

  @Assertion:    3.3.1(19) The type of the pattern needs to match the type after the colon.

  @Description:  Check that tuple variable defined with specific type can't be initialized with wrong type

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

main() {
    let (a, b, c): (Int32, Float32, String) = (12, 20.35, true)
}
