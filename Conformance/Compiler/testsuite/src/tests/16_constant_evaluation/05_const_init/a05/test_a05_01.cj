
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_05_a05_01

  @Level:         1

  @Assertion:   16.5(5) The difference between const init and const functions is that const init allows assignment of
                instance member variables within const init (requires an assignment expression).
  @Description: Check that const functions cannot assign instance member variables.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

struct S {
    var v: Int64

    const init() {
        v = 1
    }

    const func f() {
        v = 1
    }
}

main() { }
