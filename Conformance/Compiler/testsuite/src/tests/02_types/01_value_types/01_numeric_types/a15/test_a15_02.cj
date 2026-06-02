/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_a15_02

  @Level:         1

  @Assertion:   2.1.1(15) UIntNative platform dependent

  @Description: Checks that variable declared with integer type UIntNative cannot be assigned 
                by value that is less than minimal UIntNative value;

  @Mode:        compileonly

  @Negative:    yes

  @Structure:   single

*/

main() {
    let intVar: UIntNative = -1;

    return 0;
}

