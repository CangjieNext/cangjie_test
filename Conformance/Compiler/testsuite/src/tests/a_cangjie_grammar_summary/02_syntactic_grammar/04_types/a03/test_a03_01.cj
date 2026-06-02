/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_04_a03_01

  @Level:         1
  @Assertion:   A.2.4(3)
                tupleType
                    : LPAREN NL* type (NL* COMMA NL* type)+ NL* RPAREN
                    ;
  @Description: Check some tuple types
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
    var v1: (Int16, Int64, Int8, IntNative)
    var v2: (
            UInt8,
            UInt16,
            UInt32,
            UInt64,
            UIntNative
        )
    var v3: (Float16, Float32, Float64,
            Rune, String, Bool)
    var v4: (Class1, I1, () -> Bool, (MyType, S1, HandGame))
    var v5: (Rune, Bool, Float32, ((Bool, (UIntNative, Float16), IntNative, Float64, Rune,
            Float64), Float32, (UIntNative, Float32), Rune, Float64), Bool)
    return 0
}
