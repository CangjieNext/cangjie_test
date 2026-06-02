/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         02_02_01_a07_04

  @Level:         1
  @Assertion:    2.2.1(7) Only when the concrete type Type in Array<T> supports
                 using ==(! =) for equality (inequality) comparison, Array<T>
                 supports == and ! =, otherwise, Array<T> does not support ==
                 and ! = (a compilation error will be generated when using ==
                 and ! = for comparison).
                 We say two instances of Array<T> (with the same type) are
                 equal, if and only if elements in the same position (i.e.,
                 index) are all equal, which means they have the same length.

  @Description:  Checks that equality doen't works for Arrays of types NOT
                 supporting == and != operations

  @Mode:         compileonly
  @Negative:     yes
  @Structure:    complex-main
  @Dependencies: ../array_commons.cj

*/
import utils.assert.*
import array_commons.*

main(): Int64 {
    let a1: Array<I> = [C1(), C2(), C3()]
    let a2: Array<I> = [C1(), C2(), C3()]

    let b = a1 == a2

    return 0
}
