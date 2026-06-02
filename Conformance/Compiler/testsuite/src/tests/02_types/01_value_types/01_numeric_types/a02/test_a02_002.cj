/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_a02_002

  @Level:         1

  @Assertion:   2.1.1(2) The integer types can be further divided into signed and unsigned
                integer types.

  @Description: Checks that variable of unsigned integer type (e.g. UInt16) cannot be assigned
                by negative interger value;

  @Mode:        compileonly 

  @Negative:    yes

  @Structure:   single

*/

main() {
    let unsignedIntegerVar: UInt16 = -1;

    return 0
}