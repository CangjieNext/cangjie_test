/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_a07_03

  @Level:         1

  @Assertion:   2.1.1(7) Int16 −2^15 ~ 2^15 − 1 (-32768 to 32767)

  @Description: Checks that variable declared with integer type Int16 cannot be assigned 
                by value that is greater than maximal Int16 value;

  @Mode:        compileonly

  @Negative:    yes

  @Structure:   single

*/

main() {
    let intVar: Int16 = 32768;

    return 0;
}

