/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_04_a29_02_assign_neg_diff_types

  @Level:         1

  @Assertion:    1.4(29) = Assignment

  @Description:  Emit error if source and destination have differnt types

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/


struct Rect {
    var wid: Int32 = 0
    var len: Int32 = 0
}

struct Rect2 {
    var wid: Int32 = 2
    var len: Int32 = 2
}


main() {
    var sv : Rect = Rect();
    var sv2 : Rect2 = Rect2();
    sv = sv2;
    sv.wid
}
