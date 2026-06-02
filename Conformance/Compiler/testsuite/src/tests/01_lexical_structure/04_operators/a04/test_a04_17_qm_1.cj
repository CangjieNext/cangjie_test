/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_04_a04_17_qm_1

  @Level:         1

  @Assertion:    1.4(4) ++ Postfix increment -- Postfix decrement ? Question mark

  @Description:  Check lexical ability of question mark operator. Variant with struct

  @Mode:         run

  @Negative:     no

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
    var sv:Option<Rect>;
    let re  = Rect();
    let nn = Option<Rect>.None
    Assert.isNone(nn)
    sv = nn
    Assert.isNone(sv)
    let ww = sv?.wid;
    let ll = sv?.len;
    Assert.isNone(ww)
    Assert.isNone(ll)

    sv = Rect()
    Assert.isSome(sv)
    let sw = sv?.wid    
    Assert.isSome(sw)
    let sl = sv?.len
    Assert.isSome(sl)
    let ten2 = Option<Int32>.Some(20)
    Assert.equals(sl,ten2)
    Assert.equals(sw, Option<Int32>.Some(re.wid))
    return 0;

}
