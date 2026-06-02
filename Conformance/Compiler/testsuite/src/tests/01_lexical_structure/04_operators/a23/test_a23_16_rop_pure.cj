/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_04_a23_16

  @Level:         1

  @Assertion:    1.4(23) .. ..= Range operator
 
  @Description:  Using range operators w/o any context

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

  @Comment:

*/


main(ina :Array<String>) {
    0..10:1     // half-open range [0,10) (with step = 1)
    10..=0:-1   //closed range
    0
}