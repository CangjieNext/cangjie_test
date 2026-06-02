/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_04_a04_26_qm_2_neg_3

  @Level:         1

  @Assertion:    1.4(4) ++ Postfix increment -- Postfix decrement ? Question mark

  @Description:  Attempt to use ? for non Optional var
  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment: if var has type  Option<Int32>.Some - it is unclear how to get Int32 arg from it
            So in assert we should to fold integer into Option<Int32>.Some()

*/


import utils.assert.Assert

main() {
    var arr:Array<Int32>
    arr = [0,2,4]
    Assert.isSome(arr)
    Assert.isSome(arr?[1])
    return 0;
}

