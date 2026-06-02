/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_04_a01_02

  @Level:         1
  @Assertion:   A.2.4(1) 
                type
                    : arrowType
                    | tupleType
                    | prefixType
                    | atomicType
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
    var v1: (Int8, Int16, Int32, Int64, IntNative)
    var v2: (UInt8, UInt16, UInt32, UInt64, UIntNative)
    var v3: (Float16, Float32, Float64)
    var v4: (Rune, String, Bool)
    var v5: (Class1, I1, () -> Bool)
    var v6: (MyType, S1, HandGame)
    var v7: ((Float64, ((Float64, Int32, UIntNative, Float64, UInt8, (Float64,
     (Rune, Int32, Rune, (UInt16, UInt64, Int64, ((Rune, (Rune, Rune, Rune, (Float64,
     UInt64, Float16, Rune), UIntNative), UInt8, UInt16), Int8, UInt64, Rune, Rune))),
     Rune, (Float32, (Rune, Rune, Float64, Rune, Rune), Rune, UInt16), Float16)),
     (Rune, Rune), Float16, Float64, (Rune, IntNative, Int8, Float64, Float32, Float64)),
     Rune, Rune, ((Rune, UInt16, (UInt32, Rune, UIntNative, IntNative), Float16, (Float64,
     UInt16, Int8, (Float64, UInt16, Float64, Rune))), (Rune, (UInt64, Rune), (Int32, Float64,
     Rune, UInt8, (((Float64, Rune, (Float64, Int8, UInt8, (UIntNative, Float64, ((Float16,
     Float16, Float16, (Int8, (Float64, (Float16, Float32), Rune, Float64), Float32, Rune),
     (Float32, (Rune, Rune, UIntNative, Float16), Float64, ((Rune, (UInt32, Rune, ((Float64,
     (UInt32, (UIntNative, (UInt8, Float32, Float32, UInt64, Int32), (Rune, (Rune, IntNative,
     Float16, Rune, ((Int64, UInt32, (Float16, Rune, Float16), (Int16, Rune), Float32, UInt16),
     UInt8, (Rune, UIntNative, Float32, Int16, (UInt8, UInt16, Int64, (Rune, Rune, Float16,
     Rune, (Rune, Rune, Int16, Float64)), Int32)), (Rune, (Rune, Float64, Int32, UInt64, Rune,
     Rune), (Rune, Float32), Rune), Rune))), (Float16, Float64), Rune), Rune, Rune, Int16),
     Rune), Int32), Int16), Rune), Int8, (Float16, Rune, (Int8, Rune, (Float64, Rune, Int8,
     ((Rune, Float32), Float32, (Rune, Int8, UInt16, Rune), Rune, Rune, Int32)), (Int64,
     Float16, UInt16, Rune, Float16, Int8), (Rune, Rune, Float16, Float16, Rune, UInt64)),
     Rune, IntNative, Rune), Rune))), Rune, (Int32, Rune), Int8, (Float32, Rune, Rune,
     UIntNative, Rune, Float64), Rune), (((Rune, Float16, (Float16, Rune), Rune, Rune, Rune),
     (UInt16, Rune), Rune), Rune, Int8), (Int64, Rune, (Rune, Float32, ((Int64, UInt64, Rune,
     Rune), Float16, Rune, Rune, (Int8, Rune, UInt32)), UInt64, Int16, UInt32), Rune), ((Float32,
     UInt64, Int16, Int32), Rune, Rune, UInt64)), (Rune, (Rune, Rune, Rune, Rune, ((Int16,
     Rune, Float64, UInt32), Float16, Float32, (((Float16, (Rune, Float32, UInt16, UIntNative,
     Float32), (Int64, (UIntNative, Rune, UInt8, (Rune, (Float16, (Rune, Rune, UInt8, Rune,
     Float64, (Int16, (Float16, Rune), Int32, IntNative, Rune, (UInt8, (Rune, Rune, (Rune,
     UInt8, Rune, (Rune, UInt32, Int8, UInt32)), Float64)))), Rune)), Float64), Rune, Float64,
     (Rune, Float16, Float32, Float16, (Rune, Float64), Rune)), Rune, Rune), Int16, Float64,
     Rune), Float64, Float32), Rune, Float16), Float64), Int32)), (Float16, (Rune, UInt8),
     (IntNative, Float32, Rune, Float16, Rune, Int32), IntNative, Int32, Rune), Float64),
     (Rune, UInt16, Float16, (Float16, (Int8, Rune), Float32, Float64, Rune), (Float32, Float64,
     Rune, Float64), Rune), IntNative, (Int8, (Rune, UIntNative, Float64, Int64, Float64),
     Rune), Float64), (UInt16, UInt16, UIntNative), Int32), Float32), Rune, Rune), Float64),
     Float32), (Rune, Float32, (Float32, Rune, Float16), UInt64, UInt32, UInt64), Int64, (Int64,
     UIntNative, Float32, UInt8, Rune, (Rune, ((UIntNative, (Rune, Int32), UInt32, Float32,
     Rune, Rune), Rune, Rune, Float16), Rune, UInt16, (((UIntNative, IntNative, Float16, Int32),
     Rune, ((UInt32, Float64, Rune, Rune, Float64), Rune, Float32), Rune, Int32), (Rune, Float16),
     Float16, Float32))))

    return 0
}
