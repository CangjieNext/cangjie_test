/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_04_a01_04

  @Level:         1
  @Assertion:   A.2.4(1) 
                type
                    : arrowType
                    | tupleType
                    | prefixType
                    | atomicType
                    ;
  @Description: Check some atomic types
  @Mode:        run
  @Negative:    no
  @Structure:   single
*/

open class C1 { }
interface I1 { }
struct S1 { }
type MyFloat = Float16
enum E {
    | A
    | B
}


main() {
    var v1: Int16
    var v2: UInt8
    var v3: Float32
    var v4: Rune
    var v5: String
    var v6: Bool
    var v7: Unit
    var v8: Nothing
    var v9: C1
    var v10: I1
    var v11: MyFloat
    var v12: S1
    var v13: E
    var v14: (MyFloat)

    return 0
}
