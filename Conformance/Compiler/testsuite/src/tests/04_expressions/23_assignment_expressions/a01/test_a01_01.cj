
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_23_a01_01

  @Level:         1

  @Assertion:   4.23(1) Assignment expressions are expressions that contain assignment operators. An assignment
                expression can update the value of the left operand to the value of the right operand.
  @Description: Checks that value of left operand is equal to the value of right operand after assignment for various
                types.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore

*/

import utils.assert.Assert
import std.random.Random
import std.math.*

class C {
    let x : Int64
    init(y : Int64) { x = y }

    operator func ==(other : C) { x == other.x }
}

main() {
    let rnd = Random(123)

    var i8 = 1i8
    var i16 = 1i16
    var i32 = 1i32
    var i64 = 1i64
    var u8 = 1u8
    var u16 = 1u16
    var u32 = 1u32
    var u64 = 1u64
    var f16 = 1.0f16
    var f32 = 1.0f32
    var f64 = 1.0f64
    var b = true
    var c = r'1'
    var s = "1"
    var a: Array<UInt8> = [12]
    var r = 1..2
    var t = (1, r'2')
    var o = C(1)

    for (_ in 0..1024) {
        let ri8 = rnd.nextInt8()
        i8 = ri8
        Assert.equals(ri8, i8)

        let ri16 = rnd.nextInt16()
        i16 = ri16
        Assert.equals(ri16, i16)

        let ri32 = rnd.nextInt32()
        i32 = ri32
        Assert.equals(ri32, i32)

        let ri64 = rnd.nextInt64()
        i64 = ri64
        Assert.equals(ri64, i64)

        let ru8 = rnd.nextUInt8()
        u8 = ru8
        Assert.equals(ru8, u8)

        let ru16 = rnd.nextUInt16()
        u16 = ru16
        Assert.equals(ru16, u16)

        let ru32 = rnd.nextUInt32()
        u32 = ru32
        Assert.equals(ru32, u32)

        let ru64 = rnd.nextUInt64()
        u64 = ru64
        Assert.equals(ru64, u64)

        let rf16 = rnd.nextFloat16()
        f16 = rf16
        Assert.equals(rf16, f16)

        let rf32 = rnd.nextFloat32()
        f32 = rf32
        Assert.equals(rf32, f32)

        let rf64 = rnd.nextFloat64()
        f64 = rf64
        Assert.equals(rf64, f64)

        let rb = ri8 % 2 == 0
        b = rb
        Assert.equals(rb, b)

        let rs = ru64.toString()
        s = rs
        Assert.equals(rs, s)

        let rc = Rune(rs[0])
        c = rc
        Assert.equals(rc, c)

        let ra = rs.toArray()
        a = ra
        Assert.equals(ra, a)
        
        let begin = min(Int64(i32), i64)
        let end = max(Int64(i32), i64)
        let rr = begin..end
        r = rr
        Assert.equals(rr, r)

        let rt = (ri64, rc)
        t = rt
        Assert.isTrue(rt == t)

        let ro = C(ri64)
        o = ro
        Assert.isTrue(ro == o)
    }

    return 0
}
