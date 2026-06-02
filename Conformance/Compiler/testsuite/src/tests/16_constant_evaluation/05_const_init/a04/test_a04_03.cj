
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_05_a04_03

  @Level:         1

  @Assertion:   16.5(4) 4.const init can use assignment expressions to assign values to instance member variables, but
                no other assignment expressions are allowed.
  @Description: Check that const init cannot have compound assignment expressions with static member variables on the
                left hand side in structs.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

struct S {
    static var v = 0

    const init() {
        v += 1
    }
}

main() { }
