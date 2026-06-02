/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_03_a07_03

  @Level:         1

  @Assertion: 4.4.1.3(7) Note that binding pattern is not allowed to be used in patterns connected by |, nor can they
              be nested in other patterns, otherwise a compiler error will be reported.

  @Description: Checks that using nested binding pattern in the enum pattern causes a compile error.
  @Mode: compileonly
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

enum E{
    A(Int64)
}

main() {
    let v = A(1)
    match (v) {
        case A(foo) => foo
    }
    return
}
