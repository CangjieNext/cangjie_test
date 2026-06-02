/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_03_03_a02_neg_1

  @Level:         1

  @Assertion:    1.3.3(2) The syntax is:

  @Description:  Check unicod character exceeds limit

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:

*/

main() {
    r'\u{fff0ffff}' 
    return 0
}

