/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_04_a29_03_assign_neg_token

  @Level:         1

  @Assertion:    1.4(29) = Assignment

  @Description:  Emit error as assign have wrong token (algol)

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/


main() {
    var wid: Int32 = 0
    var len: Int32 = 1
    wid := len
}
