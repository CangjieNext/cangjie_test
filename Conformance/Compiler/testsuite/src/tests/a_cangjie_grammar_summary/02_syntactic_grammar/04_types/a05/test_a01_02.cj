/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_04_a05_01

  @Level:         1
  @Assertion:   A.2.4(5)
                atomicType
                    : charLangTypes
                    | userType
                    | parenthesizedType
                    ;

  @Description: Check some atomic types
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/

open class Class1 { }
interface I1 { }
struct S1 { }
type MyType = Int16
enum HandGame {
    ROCK | PAPER | SCISSORS
}


main() {
    var v1: Int8
    var v2: UInt32
    var v3: Float64
    var v4: Rune
    var v5: String
    var v6: Bool
    var v7: Unit
    var v8: Nothing
    var v9: Class1
    var v10: I1
    var v11: MyType
    var v12: S1
    var v13: HandGame
    var v14: (HandGame)

    return 0
}
