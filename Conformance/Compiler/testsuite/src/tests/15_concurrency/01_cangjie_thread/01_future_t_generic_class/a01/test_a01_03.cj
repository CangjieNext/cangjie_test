/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_01_01_a01_03

  @Level:         1
  @Assertion:    15.1.1(1) The value of a spawn expression is a Future<T>
                 object, which can be used to get the computation result
                 of the created thread.

  @Description:  Checks that Future<T> can be created only by calling spawn

  @Mode:         compileonly
  @Negative:     yes
  @Structure:    single

*/

main(args:Array<String>): Int64 {
    let f = Future<String>()

    0
}
