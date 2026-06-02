/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a01_03

  @Level:         1

  @Assertion:    10.1.2.1(nA) Functions in the visible set must meet the following conditions:
                 10.1.2.1(1) 1. Must be visible in the scope of the function call expression

  @Description:  Part of function(float) in ENUM are private. They are invisible.
                 Compiler must emity errors 

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/




enum ENUM {
    ZERO | ONE | TWO | THREE
    static func SCheck(arg:Int8) {
    }
    static func SCheck(arg:Int16) {
    }
    static func SCheck(arg:Int32) {
    }
    static func SCheck(arg:Int64) {
    }
    static func SCheck(arg:IntNative) {
    }
    
    static func SCheck(arg:UInt8) {
    }
    static func SCheck(arg:UInt16) {
    }
    static func SCheck(arg:UInt32) {
    }
    static func SCheck(arg:UInt64) {
    }
    static func SCheck(arg:UIntNative) {
    }
    
    static func SCheck(arg:Float64) {
    }
    static func SCheck(arg:Float32) {
    }
    static func SCheck(arg:Float16) {
    }

    func Check(arg:Int8) {
        SCheck(-1i8)
    }
    func Check(arg:Int16) {
        SCheck(-2i16)
    }
    func Check(arg:Int32) {
        SCheck(-3i32)
    }
    func Check(arg:Int64) {
        SCheck(-4i64)
    }
    func Check(arg:IntNative) {
        SCheck(IntNative(-5))
    }
    
    func Check(arg:UInt8) {
        SCheck(1u8)
    }
    func Check(arg:UInt16) {
        SCheck(2u16)
    }
    func Check(arg:UInt32) {
        SCheck(3u32)
    }
    func Check(arg:UInt64) {
        SCheck(4u64)
    }
    func Check(arg:UIntNative) {
        SCheck(UIntNative(5))
    }
    
    private func Check(arg:Float64) {
        SCheck(0.10f64)
    }
    private func Check(arg:Float32) {
        SCheck(0.2f32)
    }
    private func Check(arg:Float16) {
        SCheck(0.3f16)
    }

}

struct STRUCT {
    var o: Int32
    init() {
        this.o = 0
    }
    
    static func SCheck(arg:Int8) {
    }
    static func SCheck(arg:Int16) {
    }
    static func SCheck(arg:Int32) {
    }
    static func SCheck(arg:Int64) {
    }
    static func SCheck(arg:IntNative) {
    }
    
    static func SCheck(arg:UInt8) {
    }
    static func SCheck(arg:UInt16) {
    }
    static func SCheck(arg:UInt32) {
    }
    static func SCheck(arg:UInt64) {
    }
    static func SCheck(arg:UIntNative) {
    }
    
    static func SCheck(arg:Float64) {
    }
    static func SCheck(arg:Float32) {
    }
    static func SCheck(arg:Float16) {
    }

    func Check(arg:Int8) {
        SCheck(-1i8)
    }
    func Check(arg:Int16) {
        SCheck(-2i16)
    }
    func Check(arg:Int32) {
        SCheck(-3i32)
    }
    func Check(arg:Int64) {
        SCheck(-4i64)
    }
    func Check(arg:IntNative) {
        SCheck(IntNative(-5))
    }
    
    func Check(arg:UInt8) {
        SCheck(1u8)
    }
    func Check(arg:UInt16) {
        SCheck(2u16)
    }
    func Check(arg:UInt32) {
        SCheck(3u32)
    }
    func Check(arg:UInt64) {
        SCheck(4u64)
    }
    func Check(arg:UIntNative) {
        SCheck(UIntNative(5))
    }
    
    func Check(arg:Float64) {
        SCheck(0.10f64)
    }
    func Check(arg:Float32) {
        SCheck(0.2f32)
    }
    func Check(arg:Float16) {
        SCheck(0.3f16)
    }

}

main(ina :Array<String>) {
    var i8 : Int8    =0;
    var i16: Int16   =0;
    var i32: Int32   =0;
    var i64: Int64   =0;
    var u8 : UInt8   =0;
    var u16: UInt16  =0;
    var u32: UInt32  =0;
    var u64: UInt64  =0;
    var f16: Float16 =0.0;
    var f32: Float32 =0.0;
    var f64: Float64 =0.0;

    i8  = -1i8
    i16 = -2i16
    i32 = -3i32
    i64 = -4i64
    u8  =  1u8
    u16 =  2u16
    u32 =  3u32
    u64 =  4u64
    f16 =  0.3f16
    f32 =  0.2f32
    f64 =  0.1f64

    var kl:ENUM = ZERO;
    kl.Check(-1i8)
    kl.Check(-2i16)
    kl.Check(-3i32)
    kl.Check(-4i64)
    kl.Check(IntNative(-5))

    kl.Check(1u8)
    kl.Check(2u16)
    kl.Check(3u32)
    kl.Check(4u64)
    kl.Check(UIntNative(5))

    kl.Check(0.1f64)
    kl.Check(0.2f32)
    kl.Check(0.3f16)

    var s:STRUCT = STRUCT();
    s.Check(-1i8)
    s.Check(-2i16)
    s.Check(-3i32)
    s.Check(-4i64)
    s.Check(IntNative(-5))

    s.Check(1u8)
    s.Check(2u16)
    s.Check(3u32)
    s.Check(4u64)
    s.Check(UIntNative(5))

    s.Check(0.1f64)
    s.Check(0.2f32)
    s.Check(0.3f16)

    0
}

