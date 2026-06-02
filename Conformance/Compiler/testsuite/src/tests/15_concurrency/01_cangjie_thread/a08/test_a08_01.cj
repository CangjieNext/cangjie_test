/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_01_a08_01

  @Level:         1
  @Assertion:    15.1(8) The spawn expression returns an instance of type
                 Future<T> (see 15.1.1 below for a description of Future<T>).

  @Description:  Checks that spawn expression returns Future

  @Mode:         run
  @Negative:     no
  @Structure:    single

  @Issue:        0006619

*/
import utils.assert.*

main(): Int64 {
    let th = spawn {
        25
    }
    Assert.isTrue(th is Future<Int64>, reason: "spawn must return Future")
    0
}
