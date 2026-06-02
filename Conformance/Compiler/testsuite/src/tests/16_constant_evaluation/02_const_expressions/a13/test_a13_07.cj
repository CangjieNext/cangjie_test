
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Comment:     This assertion is a part of the list with the heading
                "The following expressions are all const expressions."
  @Name:     16_02_a13_07

  @Level:         1

  @Assertion:   16.2(13) 10.this and super expressions in const init, or const functions.
  @Description: Check that this and super expressions in const init or const functions are const expressions.
  @Mode: run
  @Negative: no 
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

enum EE {
    A1 | B1(Int64)

    const func get() {
        match (this) {
            case A1 => 1
            case _ => 2
        }
    }   
}

main() {
    A1.get()

    return 0
}
