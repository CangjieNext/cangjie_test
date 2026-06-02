/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_04_a04_22_qm_1_neg_5

  @Level:         1

  @Assertion:    1.4(4) ++ Postfix increment -- Postfix decrement ? Question mark

  @Description:  Attempt to use question w/o Option type

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment: if var has type  Option<Int32>.Some - it is unclear how to get Int32 arg from it
            So in assert we should to fold integer into Option<Int32>.Some()

*/


import utils.assert.Assert


struct Rect {
    var wid: Int32 = 10
    var len: Int32 = 20
}


main() {
    var sv:Rect;
    sv = Rect()
   
    let sw = sv?.wid    
    Assert.isSome(sw)
    0
}
