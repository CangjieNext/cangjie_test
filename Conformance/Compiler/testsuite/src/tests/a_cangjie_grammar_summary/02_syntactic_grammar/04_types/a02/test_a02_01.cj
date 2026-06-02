/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_04_a02_01

  @Level:         1
  @Assertion:   A.2.4(2)
                arrowType
                    : arrowParameters NL* ARROW NL* type
                    ;
                arrowParameters
                    : LPAREN NL* (type (NL* COMMA NL* type)* NL*)? RPAREN
                    ;

  @Description: Check various arrow types
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/


main() {
    var v1: (Int8) -> Bool
    var v2: () -> Int16
    var v3: (Int32, Int64) -> IntNative
    var v4: (
        UInt8,
        UInt16,
        UInt32,
        UInt64)
        ->
        UIntNative
    return 0
}
