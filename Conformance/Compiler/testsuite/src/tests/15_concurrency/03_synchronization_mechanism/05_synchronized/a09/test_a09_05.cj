/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_03_05_a09_05

  @Level:         1
  @Assertion:    15.3.5(9) The syntax of the synchronized expression is as follows:
    synchronizedExpression
         : 'synchronized' '(' identifier ')' block
         ;
    The above identifier is a ReentrantMutex object.

  @Description:  Checks that synchronized expression will not work with
                 identifier of type Int64

  @Mode:         compileonly
  @Negative:     yes
  @Structure:    single

*/

main(): Int64 {
    let m:Int64 = 0x12AB34
    synchronized (m) {
        return 2
    }

    return 0
}
