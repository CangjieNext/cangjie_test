/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_04_a36_05_aleft_shift_f16_neg

  @Level:         1

  @Assertion:    1.4(36) <<=

  @Description:  Emit error if left shift (<<) uses float operands. Float16.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:

*/


type TestedType = Float16;
let ct_opnd1   :  TestedType  = -3.3f16
let ct_opnd2   :  TestedType  = -2.0f16


main(ina :Array<String>) {
    var shla: TestedType = ct_opnd1
    shla <<= ct_opnd2
    0
}
