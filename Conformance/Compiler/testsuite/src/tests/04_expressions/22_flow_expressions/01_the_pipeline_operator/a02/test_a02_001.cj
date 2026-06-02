
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_22_01_a02_001

  @Level:         1

  @Assertion:   4.22.1(2) Here, e2 is the expression of the function type. The type of e1 matches the parameter type of
                e2. Or the type of e2 implements the operator () overloading, (see Operators that can be Overloaded),
                i.e. e1 |> e2 is the syntactic sugar of let v = e1; e2(v) and e2(v) is the function call overloading.
                See section 4.13.2 for details.
  @Description: Checks that e1 |> e2 is valid when e2 implements the operator () overloading for the type of e1 and
                e1 |> e2 = e2(e1) for expressions of various types.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

  @Issue: 0006421

*/

import utils.assert.Assert
import std.random.Random

class C { 
    var x = 0
    C(y : Int64) {
        x = y
    }
}

class F {
    @OverflowWrapping
    operator func ()(x : Int8) { x + 1 }

    @OverflowWrapping
    operator func ()(x : Int16) { x + 1 }

    @OverflowWrapping
    operator func ()(x : Int32) { x + 1 }

    @OverflowWrapping
    operator func ()(x : Int64) { x + 1 }

    @OverflowWrapping
    operator func ()(x : UInt8) { x + 1 }

    @OverflowWrapping
    operator func ()(x : UInt16) { x + 1 }

    @OverflowWrapping
    operator func ()(x : UInt32) { x + 1 }

    @OverflowWrapping
    operator func ()(x : UInt64) { x + 1 }

    operator func ()(x : Float16) { x + 1.0 }

    operator func ()(x : Float32) { x + 1.0 }

    operator func ()(x : Float64) { x + 1.0 }

    operator func ()(x : String) { x + "1" }

    operator func ()(x : Rune) { "1" + x.toString() }

    operator func ()(x : Array<Byte>) { [49u8] != x }

    operator func ()(x : Bool) { !x }

    @OverflowWrapping
    operator func()(x : (Int64, UInt64)) { (x[0] + 1, x[1] + 1) }

    @OverflowWrapping
    operator func ()(x : C) { C(x.x + 1) }
}

main() {
    let f = F()
    let rnd = Random(123)

    for (_ in 0..1024) {
        let i8 = rnd.nextInt8()
        let i16 = rnd.nextInt16()
        let i32 = rnd.nextInt32()
        let i64 = rnd.nextInt64()
        let u8 = rnd.nextUInt8()
        let u16 = rnd.nextUInt16()
        let u32 = rnd.nextUInt32()
        let u64 = rnd.nextUInt64()
        let f16 = Float16(i8) + rnd.nextFloat16()
        let f32 = Float32(i16) + rnd.nextFloat32()
        let f64 = Float64(i32) + rnd.nextFloat64()
        let s = i64.toString()
        let c = s[0]
        let a = s.toArray()
        let b = i64 % 2 == 0
        let t = (i64, u64)
        let o = C(i64)

        Assert.equals(f(i8), i8 |> f)
        Assert.equals(f(i16), i16 |> f)
        Assert.equals(f(i32), i32 |> f)
        Assert.equals(f(i64), i64 |> f)
        Assert.equals(f(u8), u8 |> f)
        Assert.equals(f(u16), u16 |> f)
        Assert.equals(f(u32), u32 |> f)
        Assert.equals(f(u64), u64 |> f)
        Assert.equals(f(f16), f16 |> f)
        Assert.equals(f(f32), f32 |> f)
        Assert.equals(f(f64), f64 |> f)
        Assert.equals(f(s), s |> f)
        Assert.equals(f(c), c |> f)
        Assert.equals(f(a), a |> f)
        Assert.equals(f(b), b |> f)
        Assert.equals(f(t)[0], (t |> f)[0])
        Assert.equals(f(t)[1], (t |> f)[1])
        Assert.equals(f(o).x, (o |> f).x)
    }
}
