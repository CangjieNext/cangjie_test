/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_02_a04_09

  @Level:         1

  @Assertion:    1.2(4) A newline character may appear between any two tokens.

  @Description:  Using the newline character as a separator for generic function arguments
                 as expresssion with Power of 2. Second argument is absent.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @CompileWarning: Ignore

*/

func foo<T>(a : T, b : T): T { return b }
main() {
    let v7 = foo<Float64>(
    (
    1.0
    +
    0.11
    )
    **
    (
    1.0
    **
    4
    )
   )
}