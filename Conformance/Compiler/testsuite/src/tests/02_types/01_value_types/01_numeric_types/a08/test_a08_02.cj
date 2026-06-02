/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_a08_02

  @Level:         1

  @Assertion:   2.1.1(8) Int32 −2^31 ~ 2^31 − 1 (-2147483648 to 2147483647)

  @Description: Checks that variable declared with integer type Int32 cannot be assigned 
                by value that is less than minimal Int32 value;

  @Mode:        compileonly

  @Negative:    yes

  @Structure:   single

*/

main() {
    let intVar: Int32 = -2147483649;

    return 0;
}

