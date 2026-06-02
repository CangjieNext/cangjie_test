/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_04_a04_27_qm_3

  @Level:         1

  @Assertion:    1.4(4) ++ Postfix increment -- Postfix decrement ? Question mark

  @Description:  Check lexical ability of question mark operator. Variant with call

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/


import utils.assert.Assert

main() {
    let foo = {i: Int64 => i + 1}
    let f1 = Option<(Int64) -> Int64>.Some(foo)
    let f2 = Option<(Int64) -> Int64>.None
    let r3 = f1?(1) // r3 = Option<Int64>.Some(2)
    let r4 = f2?(1) // r4 = Option<Int64>.None
    Assert.isNone(f2)
    Assert.isSome(f1)
    return 0;
}

