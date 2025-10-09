/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

main() {
    var i8:Int8 = 10
    var i16:Int16 = 10
    var i32:Int32 = 10
    var i64:Int64 = 10
    var iin:IntNative = 10
    var u8:UInt8 = 10
    var u16:UInt16 = 10
    var u32:UInt32 = 10
    var u64:UInt64 = 10
    var uun:UIntNative = 10
    let r0 = 0..i8
    let r1 = 0..i16
    let r2 = 0..i32
    let r3 = 0..i64
    let r4 = 0..iin
    var r5 = 0..u8:1
    var r6 = 0..u16:2
    var r7 = 0..u32:3
    var r8 = 0..u64:4
    var r9 = 0..uun:1
    let r10 = 0..i8:-1
    let r11 = 0..i16:-2
    let r12 = 0..i32:-1
    let r13 = 0..i64:-1
    let r14 = 0..iin:-2
    var r15 = 0..=u8
    var r16 = 0..=u16
    var r17 = 0..=u32
    var r18 = 0..=u64
    var r19 = 0..=uun
    let r20 = 0..=u8:1
    let r21 = 0..=u16:2
    let r22 = 0..=u32:1
    let r23 = 0..=u64:2
    let r24 = 0..=uun:1
    let r25 = 0..=i8:-1
    let r26 = 0..=i16:-2
    let r27 = 0..=i32:-1
    let r28 = 0..=i64:-1
    let r29 = 0..=iin:-2
    var r30 = 0..u8:-1
    var r31 = 0..u16:-2
    var r32 = 0..u32:-3
    var r33 = 0..u64:-4
    var r34 = 0..uun:-1
    var test_lambda =
            {
            a:Range<UInt8>,
            b:Range<UInt16>,
            c:Range<UInt32>,
            d:Range<UInt64>,
            e:Range<UIntNative>
                    =>
            print("cangjie\n")
            }(r5, r6, r7,r8,r9)
    var test_lambda1 =
            {
            a:Range<UInt8>,
            b:Range<UInt16>,
            c:Range<UInt32>,
            d:Range<UInt64>,
            e:Range<UIntNative>
                    =>
            print("cangjie\n")
            }(r15, r16, r17,r18, r19)
    var test_lambda2 =
            {
            a:Range<Int8>,
            b:Range<Int16>,
            c:Range<Int32>,
            d:Range<Int64>,
            e:Range<IntNative>
                    =>
            print("cangjie\n")
            }(r25, r26, r27,r28, r29)
    var varu8 = VArray<Range<UInt8>, $3>(repeat: 0..10)
    var varu16 = VArray<Range<UInt16>, $3>(repeat: 0..10)
    var varu32 = VArray<Range<UInt32>, $3>(repeat: 0..10)
    var varu64 = VArray<Range<UInt64>, $3>(repeat: 0..10)
    var varuun = VArray<Range<UIntNative>, $3>(repeat: 0..10)
    var varu8z = VArray<Range<UInt8>, $3>(repeat: 0..10:1)
    var varu16z = VArray<Range<UInt16>, $3>(repeat: 0..10:1)
    var varu32z = VArray<Range<UInt32>, $3>(repeat: 0..10:1)
    var varu64z = VArray<Range<UInt64>, $3>(repeat: 0..10:1)
    var varuunz = VArray<Range<UIntNative>, $3>(repeat: 0..10:1)
    var vari8 = VArray<Range<Int8>, $3>(repeat: 0..10:-1)
    var vari16 = VArray<Range<Int16>, $3>(repeat: 0..10:-2)
    var vari32 = VArray<Range<Int32>, $3>(repeat: 0..10:-1)
    var vari64 = VArray<Range<Int64>, $3>(repeat: 0..10:-2)
    var variin = VArray<Range<IntNative>, $3>(repeat: 0..10:-1)
    var test_lambda3 =
            {
            a:VArray<Range<Int8>, $3>,
            b:VArray<Range<Int16>, $3>,
            c:VArray<Range<Int32>, $3>,
            d:VArray<Range<Int64>, $3>,
            e:VArray<Range<IntNative>, $3>
                    =>
            print("cangjie\n")
            }(vari8, vari16, vari32,vari64, variin)
    var tuplemi8:(Range<Int8>, Range<Int8>) = (r0, r0)
    var tuplemi16:(Range<Int16>, Range<Int16>) = (r1, r1)
    var tuplemi32:(Range<Int32>,Range<Int32>) = (r2,r2)
    var tuplemi64:(Range<Int64>,Range<Int64>) = (r3,r3)
    var tuplemiin:(Range<IntNative>,Range<IntNative>) = (r4, r4)
    let tuplemu8:(Range<UInt8>, Range<UInt8>) = (r5, r5)
    let tuplemu16:(Range<UInt16>, Range<UInt16>) = (r6, r6)
    let tuplemu32:(Range<UInt32>,Range<UInt32>) = (r7,r7)
    let tuplemu64:(Range<UInt64>,Range<UInt64>) = (r8,r8)
    let tuplemuin:(Range<UIntNative>,Range<UIntNative>) = (r9, r9)
    var tuplemu81:(Range<UInt8>, Range<UInt8>) = (r30, r30)
    var tuplemu161:(Range<UInt16>, Range<UInt16>) = (r31, r31)
    var tuplemu321:(Range<UInt32>,Range<UInt32>) = (r32,r32)
    var tuplemu641:(Range<UInt64>,Range<UInt64>) = (r33,r33)
    var tuplemuin1:(Range<UIntNative>,Range<UIntNative>) = (r34, r34)
    var test_lambda4 =
            {
            a:(Range<UInt8>, Range<UInt8>),
            b:(Range<UInt16>, Range<UInt16>),
            c:(Range<UInt32>,Range<UInt32>),
            d:(Range<UInt64>,Range<UInt64>),
            e:(Range<UIntNative>,Range<UIntNative>)
                    =>
            print("cangjie\n")
            }(tuplemu8, tuplemu16, tuplemu32, tuplemu64, tuplemuin)
    var test_lambda5 =
            {
            a:(Range<Int8>, Range<Int8>),
            b:(Range<Int16>, Range<Int16>),
            c:(Range<Int32>,Range<Int32>),
            d:(Range<Int64>,Range<Int64>),
            e:(Range<IntNative>,Range<IntNative>)
                    =>
            print("cangjie\n")
            }(tuplemi8, tuplemi16, tuplemi32, tuplemi64, tuplemiin)
    var r44: Range<Int64> = Range<Int64>(0, 10, 2, false, true, false)
    var r55: Range<Int8> = Range<Int8>(0, 10, 2, true, true, false)
    var r66: Range<Int16> = Range<Int16>(0, 10, 2, true, true, false)
    var r77: Range<Int32> = Range<Int32>(0, 10, 2, true, true, false)
    var r88: Range<IntNative> = Range<IntNative>(0, 10, 2, true, true, false)
    var r99: Range<UInt8> = Range<UInt8>(0, 10, 2, true, true, false)
    var r91: Range<UInt16> = Range<UInt16>(0, 10, 2, true, true, false)
    var r92: Range<UInt32> = Range<UInt32>(0, 10, 2, true, true, false)
    var r93: Range<UInt64> = Range<UInt64>(0, 10, 2, true, true, false)
    var r94: Range<IntNative> = Range<IntNative>(0, 10, 2, true, true, false)
    var r551: Range<Int8> = Range<Int8>(0, 10, -2, true, true, false)
    var r661: Range<Int16> = Range<Int16>(0, 10, -2, true, true, false)
    var r771: Range<Int32> = Range<Int32>(0, 10, -2, true, true, false)
    var r441: Range<Int64> = Range<Int64>(0, 10, -2, false, true, false)
    var r881: Range<IntNative> = Range<IntNative>(0, 10, -2, true, true, false)
    var r991: Range<UInt8> = Range<UInt8>(0, 10, 2, true, true, true)
    return 0
}
