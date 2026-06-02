/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
   @Name:        02_01_07_a07_01

  @Level:         1
   @Assertion:   2.1.7(7) The syntax of Tuple Type is defined as:
                 tupleType
                    : '(' type (',' type)+ ')'
                    ;
   @Description: Check Tuple type syntax with simple types
   @Mode:        compileOnly
   @Negative:    no
   @Structure:   single
 */

main() {
    var t1: ((Rune, Rune, Float16, UInt64, UIntNative, ((Rune, Rune, Rune, Int64), ((Float64, Rune, Float64, Rune, 
        Float64, Int64), UInt8, UInt64, (Rune, Int64, (Rune, Float32, Rune)), UIntNative, Rune), UIntNative, Float16, (Rune, 
        (Float32, UIntNative, UInt8, ((Float16, (((Float64, (Float64, (UInt32, Float16, Float16, (UInt8, Int64, Rune, 
        Int16, (Float64, Rune, Float64, Float32)), ((Float64, UInt8, Float64, Float32, Float64, Rune), Float32, Int8, ((Rune, 
        IntNative, ((Rune, (Float32, Rune, ((Rune, (Rune, Float16), Float16), Rune, ((Float16, UInt8, UInt64, Float32, 
        Rune, Int64), Float64, (Float32, (Rune, (Rune, Int8, (UInt16, Float16, Float32, Float16, Rune)), Rune), ((Int16, 
        Rune, Float16, Rune), Float16, Float16, Rune), Float32, Int64, Float16)), (UInt32, Float64, ((UInt64, ((Rune, 
        UInt32, Float16), (Rune, UInt16, Float64), Rune, Int8, Rune, Float64), Rune, Float64, Rune), (Rune, UInt8, 
        UIntNative, Float64, ((Rune, UInt8, Float32, (UInt8, Rune)), Rune, UInt64, Int8), Rune)), UInt8), Float64), (Rune, 
        Rune)), Float16, Rune, (Int32, (Rune, UInt16))), Int32, Float32), (Rune, ((Float64, (UInt32, UInt64, Float16), (Float64, 
        (Rune, (Rune, Int8, (Rune, Rune, Float16, Float16, (Float64, Float32, UIntNative)), UIntNative), UInt64, Rune, 
        Float16, Rune), Float16), IntNative, (Float32, String, UInt16, UInt32, Int64), UInt8), ((Float32, Float64, Int8), 
        Float64, UInt32, Rune, Float64, Float32), Float32, (((Float64, (Float16, Float64, Rune, (Rune, Rune, Rune, Rune, 
        (Int16, Int32, UInt64, Float16), (Float16, Float16)), (((Int64, Float64), UInt8, Int32), (Float32, Float64, 
        Float32, (Rune, Float64, Float16, UInt16, Float16, Rune)), (Rune, ((Float64, IntNative, Int64, UInt16, Rune, 
        IntNative), Rune, Rune, Int8, (Rune, UInt64, (Int32, (Float16, Rune, Int16, UIntNative), UIntNative, Float64, (UInt64, 
        Float32, (Rune, (Float64, Rune), Int64, UInt64, UInt64, UInt32))), Rune, Rune), ((Float64, Float64, Float64, 
        Float64), (IntNative, Rune, Float32, Int64, Int16, (Rune, Float32)), UInt8, (UInt64, Float64, Float64, Rune, 
        Rune, UInt16))), Rune, Float32, Unit, Float16), Rune), Float64)), Rune, Float64, Float64, Int32), (Float64, 
        Float16, Rune, Rune), Rune), Rune), Rune, UInt8, (Float32, (Int8, (Float32, Rune, Rune)), (Rune, (Int16, Rune, ((Float16, 
        Float16, Rune, Float16, Float32), Rune, (UInt16, UInt64)), IntNative), Rune, Float64, IntNative, (Float64, 
        Float32, UInt8, (Int32, Float32, Float64, (Float32, Rune, ((Rune, Rune, Rune, Rune, Rune, (Rune, Rune)), (UIntNative, 
        Rune, Rune), (UInt32, (Int16, Int8, (UIntNative, (Rune, Rune), (String, Rune, Float16), Int16, Float64, Rune)), 
        Float32, Int16, (Float64, Rune, Rune, Rune), Int16))), (Rune, (Float32, (Rune, (Rune, Rune, Float16, Float32), 
        Int16, Float32, Rune)))), Rune, Int32)), UInt64, Float32, UInt64)), Float16, Rune), Rune, UInt8, Float64, UInt8, 
        UIntNative), UIntNative, Float64)), Float64, Float64, Float16), Float32, (UInt8, ((Int16, Rune, (Rune, Rune, 
        Rune, UInt32), ((Rune, Rune, Float64, Rune, (Rune, (IntNative, Rune, (UInt32, Rune, UIntNative, ((Rune, Rune, 
        Float16, Float16), (Float32), Float64, Int8)), ((UInt8, Rune, Float16), Float32), Float32))), (Int8, UInt64, Int8), 
        Rune), Float64), Rune, Float64), (Rune, Float32, ((Int8, Rune, (Rune, (Float16, (Int8, Float64, Float32, Float16, 
        Rune, ((Int16, ((Float32, IntNative, Float16, Float32), UInt8, UInt64, UInt16, (Rune, UInt64), Rune), Float32, 
        Float16), Rune, (Rune, Float32)))), Int16)), Float32), UInt32), Float32, UInt64), Float16, Rune), Float32, 
        Float64), Rune, Rune, ((Rune, (Rune, UIntNative, (Rune, Float32, Float16, UInt16), Float32, Int32, Int64), 
        Float16), Int32), (Float16, Rune, Float64, Int8)), (UInt8, (UInt32, (Float16, Rune, Rune)), ((Rune, Float64, 
        Float64), (Float64, Int64, (Rune, Rune, UIntNative, (Float16, Int64, UInt64, UIntNative), Rune), Rune, Float16, 
        Int32), Rune, ((UInt8, (((Rune, Float16, ((UInt16, Float64, ((((Float32, UInt8), UInt8, Rune, Float64, Float64, 
        Float16), (Rune, Int32, (Rune, UInt64, ((Rune, UInt32, Float16, Rune, Float64), ((Float16, Int64, UInt64), (Float32, 
        (Int64, Float64, Float16, Float32, Float64, Rune), Rune, (Rune, (Rune, Rune), IntNative, (UInt8, UInt32), 
        Float16), Int64)))), Rune), UInt8, Rune), (Rune, (Int16, Rune, Rune, Float64, Int64))), Rune), Float16, Float16, 
        Float32, UIntNative, Rune)), Float32), (Rune, Rune, (Int8, Rune, Float32, (Float16, Rune, Float16)), Int32, Rune), 
        ((Float64, (Float32, Rune, Rune, Float64), Float16), (Rune, Float32, ((Int32, Rune, IntNative, ((((Float64, 
        Float64, ((Int32, Rune), Rune, Float32, Rune, (Rune, Rune), (Float64, Int32))), Rune), UInt64), Rune), Rune, (Float64, 
        Float16)), (Int8, (Float64, UInt32, Rune, Float64, Int8, UInt8), UInt8, Rune, (IntNative, (Float64, (UIntNative, 
        ((Float32, (Int8, Rune, Float16, Float16, Float32, Rune), (Int64, Float32, Rune, UIntNative, Float64, (Int8, (UInt16, 
        Float64), Rune, Float16, Rune))), Rune), Rune, (Rune, Rune, (Rune, Float16, UInt16), (((UIntNative, Rune, Rune, 
        Float16, Float16), Float32, Int16), Float32, Rune, IntNative), (Rune, Rune, UInt8), Int8)), (Rune, Float64, 
        UInt16, (Rune, (Rune, UInt16, UInt8, Rune, Rune, Int64), UInt8, Rune, Float64), Int16)), (Rune, UInt16, (Rune, 
        Float32, Rune)), Float16), (Int16, (Rune, UIntNative, UInt8, Rune, UIntNative), IntNative, UInt64, ((Rune, Rune, 
        Float64, (UIntNative, Float64, Float64)), Float64, Rune, Rune))), (Rune, Rune, UIntNative, Int32, Rune), Int64))), 
        Rune), (Rune, Rune, Rune)), Int8, Float64, Float32, Rune, (Rune, ((Rune, (Float64, Float32, Float32)), (Rune, (Rune, 
        Rune, UInt64, Rune, Int64, Float16)), (Float64, Rune, (IntNative, Float16, Rune, (Float32, Float16, Rune, Rune, 
        UInt8), Int16, Rune), Int8, Float16), Rune, (Float64, Rune, Int8)), (Int8, Rune, Rune, (Float64, (Float64, 
        Float16, (Rune, Float32, (Float32, UInt16, ((Float32, (Int8, Float16), Int16, Rune, Rune), (Float64, Float32), 
        Float64, Float16), ((Float32, Float32, Float16, Int32, Float32, Rune), UIntNative, ((Rune, UInt64, Rune, Rune, (UIntNative, 
        Rune, Rune, UInt8)), Int8, (Rune, Rune, Float64, Rune, (Rune, Float32, (((Int64, Float32, UInt8, Float16, 
        Float16, (Float16, UInt16, Float32, Float32)), Float32, Int64, Rune), Int8), (((Float64, Rune), ((((Float64, 
        Float32, Rune), UInt64), Rune, Float64, Rune, (Int8, Rune)), Float32, Float16, UIntNative, IntNative), Float64), 
        Float32, Rune, UInt8, Int8, Int8)), ((Float16, Float32, UInt16, Rune), UInt32)), Float64, UInt16)), Rune), Rune, 
        (Int32, Rune, (Float32, Rune, UInt32, UInt16), (((UInt64, Rune, (Float32, Rune)), Float16, UInt32, Float16), 
        Float64, Rune, ((Rune, Rune, Float16, Float64, Int32), ((Float16, (Float16, IntNative, Rune, Float16, Float32, 
        Rune), UInt8), Rune, Float32, Rune, Rune, UInt8), UInt64, (((Float32, (Int8, Float16), Int16, Rune, Float32, 
        Rune), Float64, Rune, Int8), UInt16, Rune)), Float64), Int64, Rune), Float32)), Rune), Float32, Rune)))), 
        UIntNative), ((Float64, Rune, IntNative), UInt16, (Rune, Rune, Float64, Rune, Float64)), Rune), (Float16, UInt16, 
        Int8), Float64, Rune, Rune)), (Rune, Int64, ((Rune, Float32, Float64, ((Float16, Float64, Rune, Float64, Rune, 
        Rune), Rune, IntNative, Rune), Int32, Rune), ((Rune, Rune, Int64, ((Rune, Rune, UInt64), (Rune, Int16, Int16), 
        Float64), Float32, Float16), UInt16), ((Float64, Rune, UInt16, UInt64, Float16, Int8), (Int64, Rune, Float32, 
        Rune, ((Rune, Rune, Rune, (((Rune, Int8), Float16, Rune, (Float64, UInt64, Float64, Rune, (Float16, Rune), Rune)), 
        Int16)), UInt16, IntNative, Rune, Float16, (Float32, Rune, UInt64, Int64, Rune))), (Rune, UInt64, Rune, (Rune, (Int64, 
        Float64, Float32), Float16, Float32, Rune, UInt32), Rune)), (UInt8, Float64, Rune, Rune, UInt32), (UInt16, Int32, 
        Float64, (Rune, Rune, Float64, (Rune, (Rune, (((UInt32, (UInt64, UInt64, (Rune, Int16, Rune, Rune), ((Float32, 
        Int8), (Rune, Float16, Float64, (UInt16, (Float64, Float32, (Float64, IntNative, Rune), Rune, Rune, Float64)), (Rune, 
        Rune, UInt64, Rune)), UInt16), ((UInt16, (Float16, Rune), Rune, (Float64, Rune, ((Int16, Rune), Rune), 
        UIntNative), (((Float32, Rune, (((Float64, (Float64, UInt64, UInt16, Rune, (Float64, Int16, Float32, Float16, ((UInt64, 
        Int64, Int16, ((Int64, Float16, (Rune, (Int16, Float32, Int32, Int8, (Rune, ((Rune, Rune, UInt16, Int8, Int32), 
        Int32), Rune)), Rune, (Rune, Rune, Int32, (Rune, Float32, ((Rune, Int16), (Float16, Rune), Rune, Rune), UInt8, 
        Float64, Rune), (Rune, ((Rune, Int32, Float32, (Float32, Rune, Rune, Int8, Rune), Float64), Rune, Rune, Float16, 
        Float32), Float64), Int8))), (UIntNative, (UInt16, Int64, UIntNative, Float16, Rune, UInt32)), UInt32), UInt32), 
        (Float32, (Rune, UInt32, Float32)), ((UInt64, Int64, UInt32), Rune, Int16, Float32, (Float32, Float64, Rune, 
        Float32, Float64), Int16), UInt16), ((Rune, Rune, (Float16, UInt8, Rune, UInt64, UInt8), Int32, UIntNative, 
        Float16), (UInt64, Float64), Float32, Rune, (UIntNative, Float16, (UInt8, Float32, Float64, Rune), IntNative)))), 
        (Float32, (Float32, (Float32, (UIntNative, (UInt8, Int32, Float16), Float64), (Float64, UInt32, Int16, Float64)), 
        UInt16, Rune, Float16), (Rune, (Int8, UInt64), Int32, IntNative, Rune, Float32), Int8)), Float32), Float32, (UInt8, 
        Float64, Float16, Rune, UInt8)), Int32), Rune, (Float16, Float32, Int64, Rune, IntNative), IntNative, Int16), 
        Rune, UInt64, UInt64, Rune)), Rune, Float64, ((UInt64, Rune, Rune), UInt32), Float32), (Rune, Float16, Rune)), 
        UInt16, Rune, Rune, UInt64), UInt8, Int64, Rune, (Int64, Rune, UInt64), Rune), Rune, Float32, ((Rune, Rune, 
        UInt16, UInt16), Rune, (Float16, Float64, Rune), ((UInt16, Float32, (UIntNative, Rune, (Int64, Float32, Float32, 
        (Float32, Rune, Int64, (Float64, Rune, IntNative, Int16)), Float64, (Float32, (Rune, Int32, Rune, Rune, Rune), 
        Rune, Rune, (Rune, Float64, Rune, UIntNative, Rune, (((((Float32, (Rune, Int8, IntNative, Float64), Rune, (Rune, 
        (Float64, (Float16, Rune, Float64, Float64)), Rune, Rune, UIntNative), Int8, Float64), (Rune, Rune, Rune, 
        Float16), Float64, IntNative, Rune), Float32, (UInt8, Int16, Rune, IntNative, Rune, (Rune, Int16, UInt64, Rune, 
        Int16)), Rune), Float32, IntNative, Float64, Int8, Rune), Rune, (((Rune, (UInt8, Float16, IntNative, Int64), (Float64, 
        UInt64, Float64), UInt32, UIntNative, UIntNative), UIntNative), UIntNative, Float16), Rune)))), Float64, Float16, 
        Int16), Rune, Int32), Int8, UInt8, Float32, (UInt16, Rune, ((Int64, Rune, Float16), Float16, Float64))), Float32, 
        IntNative), UInt16, UInt32), Float64, (Rune, Float64, Float64, UInt32), Float16), Float64, Rune), (Rune, Float32, 
        Float16)), (Rune, Rune, Float32, UInt64, (((Rune, Float16), Float32, Float16, IntNative, Float16, Float32), (Rune, 
        (Float64, Int8, UInt8, ((Float64, Int8, Rune, (Rune, Int32, Rune, Rune, UIntNative, Int32), Float16, Float16), 
        Rune, ((Float32, UInt32, Rune, (Float64, Rune, ((Rune, Rune, Float16, (UInt16, UInt16, Rune, ((UInt16, Rune), 
        Float16, UInt16), Int32)), Rune), Float64, Rune), Rune), Rune, Rune), UIntNative, Float32), UIntNative, Rune), 
        Int8, Float16), Rune, (Rune, UInt8), (Rune, Float64, Float32, Int8, Float32))), ((Rune, Float16), (Rune, Rune, (Rune, 
        Int64, ((Rune, Rune, (Int64, Int16)), (Float16, Float16, UIntNative, Rune), Int16, Rune), Float64, UInt64), Rune)))))), 
        (Rune, Rune))), Rune, (Int16, Rune, Rune, Rune, UIntNative, (Rune, Rune, Int32)), Nothing)
    return 0
}
