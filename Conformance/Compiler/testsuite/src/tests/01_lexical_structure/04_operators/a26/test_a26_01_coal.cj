/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_04_a26_01_coal

  @Level:         1

  @Assertion:    1.4(26) ?? coalescing

  @Description:  Check lexical ability coalescing operator (??)

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment: 

*/


import utils.assert.Assert


struct Rect {
    var wid: Int32 = 10
    var len: Int32 = 20
}


main() {
    var r2 : Rect = Rect();
    var sv = Option<Rect>.None
    var re = sv ?? r2
    Assert.equals(re.wid,10)
    Assert.equals(re.len,20)
    0
}

