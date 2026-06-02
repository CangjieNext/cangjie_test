/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         02_02_01_01_a04_01

  @Level:         1
  @Assertion:    2.2.1.1(4) When the context does not require some specific
                 type, assume the least common supertype of all elements is T,
                 then the type of the Array literal is Array<T>.

  @Description:  Checks that when the context does not require some specific
                 type, common supertype of all elements is used as array
                 element type

  @Mode:         run
  @Negative:     no
  @Structure:    complex-main
  @Dependencies: ../../array_commons.cj

*/
import utils.assert.*
import array_commons.*

main(): Int64 {
    let a1 = [CM1(), CM2(), CM3()]

    Assert.isTrue(a1 is Array<M>)

    return 0
}
