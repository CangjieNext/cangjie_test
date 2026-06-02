/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_04_a19_01

  @Level:         1

  @Assertion: 4.13.4(19) Since function types are immutable, only ?. and ?[] should be considered,
              and they can both reduce to
              the basic scenarios of a?.b = c and a?[b] = c (assuming that a is of type Option<T>).

  @Description: Check that attempt to modify optional chaining expression which is a function causes a compialtion
                error.

  @Mode: compileonly

  @Negative: yes

*/

// NOTE: Checks for 'a?.b = c' and 'a?[b] = c' are tested in the previous assertions.

main() {
    var f: ?((Int64) -> Int64) = { x => x }
    f? = { x => x * x }
    return
}

