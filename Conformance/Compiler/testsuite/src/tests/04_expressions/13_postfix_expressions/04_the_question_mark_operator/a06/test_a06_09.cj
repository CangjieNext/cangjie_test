/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_04_a06_09

  @Level:         1

  @Assertion: 4.13.4(6) For optional chaining expressions, we have the following rules.
  
              1. For the expression e, delete all ? in e and replace the type of the expression immediately before ?
                 (i.e., Option<T>) by T to give the expression e1. If the type of e1 is an option type, then you need
                 to add a ? after e when use ., (), {} or [] on it. Otherwise, you should not add ? after e when use
                 ., (), {} or [] on it.

  @Description: Check no '?' usage on option type in optional chaining expression causes a compilation error
                in '[]' case.

  @Mode: compileonly

  @Negative: yes

*/

struct S {
    var a: ?Array<Int64> = [1, 2, 3, 4, 5]
}

main() {
    let s: ?S = S()
    let r = s?.a[2]
    return
}

