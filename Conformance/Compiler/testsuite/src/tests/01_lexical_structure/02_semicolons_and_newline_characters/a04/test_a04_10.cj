/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_02_a04_10

  @Level:         1

  @Assertion:    1.2(4) A newline character may appear between any two tokens.

  @Description:  Using the newline character as a separator for generic function arguments
                 passed as incomplete expresssion and variable.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @CompileWarning: Ignore

*/

func foo<T>(a : T, b : T): T { return b }
main() {
    let arg : Float64 =
    3.11
    **
    2

    let v8 = foo<Float64>(
    1.11
    **
    ,
 
    arg
    )
}