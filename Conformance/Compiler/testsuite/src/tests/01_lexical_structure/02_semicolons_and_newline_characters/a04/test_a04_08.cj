/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_02_a04_08

  @Level:         1

  @Assertion:    1.2(4) A newline character may appear between any two tokens.

  @Description:  Using the newline character as a separator for incorrect list of generic function arguments (String).

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @CompileWarning: Ignore

*/

func foo<T>(a : T, b : T): T { return b }
main() {
    let v6 = foo<String>(
    "argument #1"

    "argument #2"
    )
}