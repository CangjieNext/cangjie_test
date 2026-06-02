/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_04_a04_01

  @Level:         1
  @Assertion:   A.2.4(4)
                prefixType
                    : prefixTypeOperator type
                    ;
                prefixTypeOperator
                    : QUEST
                    ;


  @Description: Check various prefix types
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
    var v1: ?Int8
    var v2: ?Int16
    var v3: ?Int32
    var v4: ?Int64
    var v5: ?IntNative
    var v6: ?UInt8
    var v7: ?UInt16
    var v8: ?UInt32
    var v9: ?UInt64
    var v10: ?UIntNative
    var v11: ?Float16
    var v12: ?Float32
    var v13: ?Float64
    var v14: ?Rune
    var v15: ?String
    var v16: ?Bool
    var v17: ?Class1
    var v18: ?I1
    var v19: ?() -> Bool
    var v20: ?MyType
    var v21: ?S1
    var v22: ?HandGame
    var v23: ?(Float64, Int16)
    var v24: ?(Int64)
    var v25: ?Array<Int64>
    var v26: ?Range<Int64>
    var v27: ?Unit
    var v28: ?Nothing

    return 0
}
