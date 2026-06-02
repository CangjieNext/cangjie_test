/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_04_a04_29_qm_3_neg_2

  @Level:         1

  @Assertion:    1.4(4) ++ Postfix increment -- Postfix decrement ? Question mark

  @Description:  Check question mark operator. Variant with call. Using ? for non Optional

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/


import utils.assert.Assert

main() {
    let foo = {i: Int64 => i + 1}
    let f1 = foo
    let f2 = Option<(Int64) -> Int64>.None
    let r3 = f1?(1)
    let r4 = f2?(1) // r4 = Option<Int64>.None
    Assert.isNone(f2)
    Assert.isSome(f1) //Checked Some for non optional type
    return 0;
}

