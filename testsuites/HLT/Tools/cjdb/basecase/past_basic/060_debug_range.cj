/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class rangec{
    let ra1=0..10 : 2
    let ra2:Range<Int64>=0..10 : 2
    let ra3=0..=10 : 2
    let ra4:Range<Int64>=0..=100 : 2
    let ra5=0..10
    let ra6:Range<Int64>=0..10
    let ra7=10..=0 : -2
    let ra8: Range<Int64> =10..=0:-2
    var ra9=1..10 : 2
    var ra10: Range<Int64> = Range<Int64>(0,10, 2, true, true, true)
    private var ra11=1..10 : 2
    private var ra12: Range<Int64> = Range<Int64>(0,10, 2, true, true, true)
    public var ra13: Range<Int64> = 1..10 : 2
    public var ra14: Range<Int64> = Range<Int64>(0,10, 2, true, true, true)
    protected var ra15=1..10 : 2
    protected var ra16: Range<Int64> = Range<Int64>(0,10, 2, true, true, true)
    let r6: Range<Rune> = r'z'..r'a':-1
    let r7: Range<UInt8> = 0..10:1
    let r8: Range<UInt16> = 0..10:1
    let r9: Range<UInt32> = 0..10:1
    let r10: Range<UInt64> = 0..10:1
    let r111: Range<UIntNative> = 0..10:1
    let r12: Range<Int8> = 0..10:1
    let r13: Range<Int16> = 0..10:1
    let r14: Range<Int32> = 0..10:1
    let r15: Range<Int64> = 0..10:1
    let r16: Range<IntNative> = 0..10:1
    var rc = 0
}
struct ranges {
    let ra1=0..10 : 2
    let ra2:Range<Int64>=0..10 : 2
    let r6: Range<Rune> = r'z'..r'a':-1
    let r7: Range<UInt8> = 0..10:1
    let r8: Range<UInt16> = 0..10:1
    let r9: Range<UInt32> = 0..10:1
    let r10: Range<UInt64> = 0..10:1
    let r111: Range<UIntNative> = 0..10:1
    let r12: Range<Int8> = 0..10:1
    let r13: Range<Int16> = 0..10:1
    let r14: Range<Int32> = 0..10:1
    var sc = 0
}
let globals_r1 = 0..10 : 1
let globals_r2: Range<Int64> =  0..20:2
main(): Int64 {
    let n = 10
    let r0 = 0..10 // r0 contains 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    let r1 = 0..10 : 1 // r1 contains 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    let r2 = 0..=n : 1 // r2 contains 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    let r3 = n..0 : -2 // r3 contains 10, 8, 6, 4, 2
    let r4 = 10..=0 : -2 // r4 contains 10, 8, 6, 4, 2, 0
    let r5: Range<Rune> = r'A'..r'Z':1
    let r6: Range<Rune> = r'z'..r'a':-1
    let r7: Range<UInt8> = 0..10:1
    let r8: Range<UInt16> = 0..10:1
    let r9: Range<UInt32> = 0..10:1
    let r10: Range<UInt64> = 0..10:1
    let r111: Range<UIntNative> = 0..10:1
    let r12: Range<Int8> = 0..10:1
    let r13: Range<Int16> = 0..10:1
    let r14: Range<Int32> = 0..10:1
    let r15: Range<Int64> = 0..10:1
    let r16: Range<IntNative> = 0..10:1
    var r00: Range<Int64> = Range<Int64>(0, 10, 2, true, true, false)
    var r11: Range<Int64> = Range<Int64>(0, 10, 2, true, false, false)
    var r22: Range<Int64> = Range<Int64>(0, 10, 2, true, false, true)
    var r33: Range<Int64> = Range<Int64>(0, 10, 2, false, true, true)
    var r44: Range<Int64> = Range<Int64>(0, 10, 2, false, true, false)
    var sc = rangec()
    var cs = ranges()
    return 0
}
