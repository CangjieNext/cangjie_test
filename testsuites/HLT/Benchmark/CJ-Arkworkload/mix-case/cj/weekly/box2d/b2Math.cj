/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.convert.*
import std.collection.*
import std.time.*
import std.math.*
import std.regex.*
import std.core.*
import std.convert.*
import std.convert.*

func b2IsValid( x: Float64) : Bool {
    return x.isNaN() == false && x.isInf() == false
}

func b2Sqrt( x: Float64) : Float64 {
    return sqrt(x)
}

func b2Atan2( y: Float64,  x: Float64) : Float64 {
    return atan(y/x)
}

public class B2Vec2 {
    public var x: Float64
    public var y: Float64
    public init( x0! : ?Float64 = 0.0,  y0! : ?Float64 = 0.0) {
        if ((x0.isSome() && y0.isSome())) {
            x = x0.getOrThrow()
            y = y0.getOrThrow()
        } else {
            x = 0.0
            y = 0.0
        }
    }

    public func setZero() {
        x = 0.0
        y = 0.0
    }
    public func gety():Float64 {
        return y
    }
    
    public func set( x0 : Float64,  y0 : Float64) {
        x = x0
        y = y0
    }
    public func getSubscript( index: Int64) : Float64 {
        if (index == 0) {
            return x
        } else {
            return y
        }
    }
    public func setSubscript( index: Int64,  newValue: Float64) {
        if (index == 0) {
            x = newValue
        } else {
            y = newValue
        }
    }
    public func length() : Float64 {
        return sqrt(x * x + y * y)
    }
    public func lengthSquared() : Float64 {
        return x * x + y * y
    }
    public func normalize() : Float64 {
        let length = this.length()
        if (length < b2Epsilon) {
            return 0.0
        }
        let invLength = 1.0 / length
        x *= invLength
        y *= invLength
        return length
    }
    public func isValid() : Bool {
        return b2IsValid(x) && b2IsValid(y)
    }
    public func skew() : B2Vec2 {
        return B2Vec2(x0: -y, y0: x)
    }
}

public func minus( v: B2Vec2) : B2Vec2 {
    let mv = B2Vec2(x0: -v.x, y0: -v.y)
    return mv
}

public func addEqual( a: B2Vec2,  b: B2Vec2): B2Vec2 {
    a.x += b.x
    a.y += b.y
    return a
}

public func subtractEqual( a: B2Vec2,  b: B2Vec2): B2Vec2{
    a.x -= b.x
    a.y -= b.y
    return a
}

public func mulEqual( a!: B2Vec2,  b!: Float64) : B2Vec2{
    a.x *= b
    a.y *= b
    return a
}

public class B2Vec3 {
    var x : Float64
    var y : Float64
    var z : Float64
    init( x1! : ?Float64 = 0.0,  y1! : ?Float64 = 0.0,  z1! : ?Float64 = 0.0) {
        if ((x1.isSome() && y1.isSome() && z1.isSome())) {
            x = x1.getOrThrow()
            y = y1.getOrThrow()
            z = z1.getOrThrow()
        } else {
            x = 0.0
            y = 0.0
            z = 0.0
        }
    }
    
    func setZero() {
        x = 0.0
        y = 0.0
    }
    
    func set( x1: Float64,  y1: Float64,  z1: Float64) {
        x = x1
        y = y1
        z = z1
    }
}

public func minus3( v: B2Vec3) : B2Vec3 {
    let mv = B2Vec3(x1: -v.x, y1: -v.y, z1: -v.z)
    return mv
}

public func addEqual3( a: B2Vec3,  b: B2Vec3): B2Vec3 {
    a.x += b.x
    a.y += b.y
    a.z += b.z
    return a
}

public func mulMEqual3( a: B2Vec3,  b: Float64): B2Vec3 {
    a.x *= b
    a.y *= b
    a.z *= b
    return a
}

public class B2Mat22 {
    public var ex : B2Vec2
    public var ey : B2Vec2
    public func setMat( angle: Float64) {
        let c = cos(angle)
        let s = sin(angle)
        ex.set(c, s)
        ey.set(-s, c)
    }
    
    public init( c1!: ?B2Vec2 = Option<B2Vec2>.None,  c2!: ?B2Vec2 = Option<B2Vec2>.None) {
        if ((c1.isSome() && c2.isSome())) {
            ex = c1.getOrThrow()
            ey = c2.getOrThrow()
        } else {
            ex = B2Vec2(x0: 0.0, y0: 0.0)
            ey = B2Vec2(x0: 0.0, y0: 0.0)
        }
    }
    
    public func set( c1: B2Vec2,  c2: B2Vec2) {
        ex = c1
        ey = c2
    }
    public func setIdentity() {
        ex.x = 1.0
        ey.x = 0.0
        ex.y = 0.0
        ey.y = 1.0
    }
    public func setZero() {
        ex.x = 0.0
        ey.x = 0.0
        ex.y = 0.0
        ey.y = 0.0
    }
    public func getInverse() : B2Mat22 {
        let a = ex.x
        let b = ey.x
        let c = ex.y
        let d = ey.y
        let mB = B2Mat22()
        var det = a * d - b * c
        if (det != 0.0) {
            det = 1.0 / det
        }
        mB.ex.x =  det * d
        mB.ey.x = -det * b
        mB.ex.y = -det * c
        mB.ey.y =  det * a
        return mB
    }
    public func solve( b: B2Vec2) : B2Vec2 {
        let a11 = ex.x
        let a12 = ey.x
        let a21 = ex.y
        let a22 = ey.y
        var det = a11 * a22 - a12 * a21
        if (det != 0.0) {
            det = 1.0 / det
        }
        var x = B2Vec2()
        x.x = det * (a22 * b.x - a12 * b.y)
        x.y = det * (a11 * b.y - a21 * b.x)
        return x
    }
}

public class B2Mat33 {
    public var ex : B2Vec3
    public var ey : B2Vec3
    public var ez : B2Vec3
    public init( c1!: ?B2Vec3 = Option<B2Vec3>.None,  c2!: ?B2Vec3 = Option<B2Vec3>.None, c3!: ?B2Vec3 = Option<B2Vec3>.None) {
        if ((c1.isSome() && c2.isSome() && c3.isSome())) {
            ex = c1.getOrThrow()
            ey = c2.getOrThrow()
            ez = c3.getOrThrow()
        } else {
            ex = B2Vec3()
            ey = B2Vec3()
            ez = B2Vec3()
        }
    }
    public func setZero() {
        ex.setZero()
        ey.setZero()
        ez.setZero()
    }
    public func solve33( b: B2Vec3) : B2Vec3 {
        var det = b2Dot33(ex, b2Cross33(ey, ez))
        if (det != 0.0) {
            det = 1.0 / det
        }
        let x = B2Vec3()
        x.x = det * b2Dot33(b, b2Cross33(ey, ez))
        x.y = det * b2Dot33(ex, b2Cross33(b, ez))
        x.z = det * b2Dot33(ex, b2Cross33(ey, b))
        return x
    }
    public func solve22( b: B2Vec2) : B2Vec2 {
        let a11 = ex.x
        let a12 = ey.x
        let a21 = ex.y
        let a22 = ey.y
        var det = a11 * a22 - a12 * a21
        if (det != 0.0) {
            det = 1.0 / det
        }
        var x = B2Vec2()
        x.x = det * (a22 * b.x - a12 * b.y)
        x.y = det * (a11 * b.y - a21 * b.x)
        return x
    }
    public func getInverse22() : B2Mat33 {
        let a = ex.x
        let b = ey.x
        let c = ex.y
        let d = ey.y
        var det = a * d - b * c
        if (det != 0.0) {
            det = 1.0 / det
        }
        let mM = B2Mat33()
        mM.ex.x =  det * d
        mM.ey.x = -det * b
        mM.ex.z = 0.0
        mM.ex.y = -det * c  
        mM.ey.y =  det * a
        mM.ey.z = 0.0
        mM.ez.x = 0.0
        mM.ez.y = 0.0
        mM.ez.z = 0.0
        return mM
    }
    
    public func getSymInverse33() : B2Mat33 {
        var det = b2Dot33(ex, b2Cross33(ey, ez))
        if (det != 0.0) {
            det = 1.0 / det
        }
        let a11 = ex.x
        let a12 = ey.x
        let a13 = ez.x
        let a22 = ey.y
        let a23 = ez.y
        let a33 = ez.z
        let mM = B2Mat33()
        mM.ex.x = det * (a22 * a33 - a23 * a23)
        mM.ex.y = det * (a13 * a23 - a12 * a33)
        mM.ex.z = det * (a12 * a23 - a13 * a22)
        mM.ey.x = mM.ex.y
        mM.ey.y = det * (a11 * a33 - a13 * a13)
        mM.ey.z = det * (a13 * a12 - a11 * a23)
        mM.ez.x = mM.ex.z
        mM.ez.y = mM.ey.z
        mM.ez.z = det * (a11 * a22 - a12 * a12)
        return mM
    }
}

public class B2Rot {
    public var s: Float64
    public var c: Float64
    public init( angle! : ?Float64 = Option<Float64>.None) {
        if ((angle.isSome())) {
            s = sin(angle.getOrThrow())
            c = cos(angle.getOrThrow())
        } else {
            s = 0.0
            c = 0.0
        }
    }
    
    public func set( angle : Float64) {
        s = sin(angle)
        c = cos(angle)
    }
    public func setIdentity() {
        s = 0.0
        c = 1.0
    }
    public prop angle: Float64 {
        get(){
            b2Atan2(s, c)
        }
    }
    public prop xAxis: B2Vec2 {
        get(){
            B2Vec2(x0:c,y0: s)
        }
    }
    public prop yAxis: B2Vec2 {
        get(){
            B2Vec2(x0:-s, y0:c)
        }
    }
}

public class B2Transform  {
    public var p: B2Vec2
    public var q: B2Rot
    public init( position!: ?B2Vec2 = Option<B2Vec2>.None,  rotation!: ?B2Rot = Option<B2Rot>.None) {
        if ((position.isSome() && rotation.isSome())) {
            p = position.getOrThrow()
            q = rotation.getOrThrow()
        } else {
            p = B2Vec2()
            q = B2Rot()
        }
    }
    public func setIdentity() {
        p.setZero()
        q.setIdentity()
    }
    public func set( position: B2Vec2,  angle: Float64) {
        p = position
        q.set(angle)
    }
}

public class B2Sweep {
    public var localCenter = B2Vec2()
    public var mc0 = B2Vec2()
    public mut prop c0 : B2Vec2 {
        get() {
            mc0
        }
        set(newValue) {
            mc0 = newValue
        }
    }
    public var c = B2Vec2()
    public var a0: Float64 = 0.0
    public var a: Float64 = 0.0
    public var alpha0: Float64 = 0.0
    public init() {}
    public func getTransform( beta: Float64) : B2Transform {
        let xf = B2Transform()
        xf.p = add(multM(c0, 1.0 - beta), multM(c, beta))
        let angle = (1.0 - beta) * a0 + beta * a
        xf.q.set(angle)
        xf.p = subtractEqual(xf.p, b2MulR2(xf.q, localCenter))
        return xf
    }
    public func advance( alpha: Float64) {
        let beta = (alpha - alpha0) / (1.0 - alpha0)
        addEqual(c0, multM(subtract(c, c0), beta))
        a0 += beta * (a - a0)
        alpha0 = alpha
    }
    public func normalize() {
        let twoPi = float2 * b2PI
        let d =  twoPi * floor(a0 / twoPi)
        a0 -= d
        a -= d
    }
}

public let b2Vec2Zero = B2Vec2(x0:0.0,y0: 0.0)
public func b2Dot22( a : B2Vec2,  b : B2Vec2) : Float64 {
    return a.x * b.x + a.y * b.y
}

public func b2Cross( a : B2Vec2,  b : B2Vec2) : Float64 {
    return a.x * b.y - a.y * b.x
}

public func b2Cross12( a : B2Vec2,  s : Float64) : B2Vec2 {
    return B2Vec2(x0:s * a.y, y0:-s * a.x)
}

public func b2Cross21( s : Float64,  a : B2Vec2) : B2Vec2 {
    return B2Vec2(x0:-s * a.y, y0:s * a.x)
}

public func b2Mul22( a : B2Mat22,  v : B2Vec2) : B2Vec2 {
    return B2Vec2(x0:b2Dot22(v, a.ex),y0: b2Dot22(v, a.ey))
}

public func b2MulTM2( a : B2Mat22,  v : B2Vec2) : B2Vec2 {
    return B2Vec2(x0:b2Dot22(v, a.ex),y0: b2Dot22(v, a.ey))
}

public func add( a: B2Vec2,  b: B2Vec2) : B2Vec2 {
    return B2Vec2(x0:a.x + b.x, y0:a.y + b.y)
}

public func subtract( a: B2Vec2,  b: B2Vec2) : B2Vec2 {
    return B2Vec2(x0:a.x - b.x,y0: a.y - b.y)
}

public func multM( a: B2Vec2,  b: Float64) : B2Vec2 {
    return B2Vec2(x0:a.x * b, y0:a.y * b)
}

public func b2Distance( a : B2Vec2,  b : B2Vec2) : Float64 {
    let c = B2Vec2(x0:a.x - b.x,y0: a.y - b.y)
    return c.length()
}

public func b2DistanceSquared( a : B2Vec2,  b: B2Vec2) : Float64 {
    let c = B2Vec2(x0:a.x - b.x,y0: a.y - b.y)
    return b2Dot22(c, c)
}

public func multM3 ( s : Float64,  a : B2Vec3) : B2Vec3 {
    return B2Vec3(x1:s * a.x,y1: s * a.y, z1:s * a.z)
}

public func add3 ( a : B2Vec3,  b : B2Vec3) : B2Vec3 {
    return B2Vec3(x1:a.x + b.x, y1:a.y + b.y, z1:a.z + b.z)
}

public func subtract3 ( a : B2Vec3,  b : B2Vec3) : B2Vec3 {
    return B2Vec3(x1:a.x - b.x, y1:a.y - b.y,z1: a.z - b.z)
}

public func b2Dot33( a : B2Vec3,  b : B2Vec3) : Float64 {
    return a.x * b.x + a.y * b.y + a.z * b.z
}

public func b2Cross33( a : B2Vec3,  b : B2Vec3) : B2Vec3 {
    return B2Vec3(x1:a.y * b.z - a.z * b.y,y1: a.z * b.x - a.x * b.z,z1: a.x * b.y - a.y * b.x)
}

public func b2Mul( a : B2Mat22,  b : B2Mat22) : B2Mat22 {
    return B2Mat22(c1:b2Mul22(a, b.ex), c2:b2Mul22(a, b.ey))
}

public func b2Mul33( a : B2Mat33,  v : B2Vec3) : B2Vec3 {
    return add3(add3(multM3(v.x, a.ex), multM3(v.y, a.ey)), multM3(v.z, a.ez))
}

public func b2Mul32( a : B2Mat33,  v : B2Vec2) : B2Vec2 {
    return B2Vec2(x0:a.ex.x * v.x + a.ey.x * v.y,y0: a.ex.y * v.x + a.ey.y * v.y)
}

public func b2MulTRR( q : B2Rot,  r : B2Rot) : B2Rot {
    let qr = B2Rot()
    qr.s = q.c * r.s - q.s * r.c
    qr.c = q.c * r.c + q.s * r.s
    return qr
}

public func b2MulR2( q : B2Rot,  v : B2Vec2) : B2Vec2 {
    return B2Vec2(x0:q.c * v.x - q.s * v.y,y0: q.s * v.x + q.c * v.y)
}

public func b2MulTR2( q : B2Rot,  v : B2Vec2) : B2Vec2 {
    return B2Vec2(x0:q.c * v.x + q.s * v.y, y0:-q.s * v.x + q.c * v.y)
}

public func b2MulT2( t : B2Transform,  v : B2Vec2) : B2Vec2 {
    let x = t.q.c * v.x - t.q.s * v.y + t.p.x
    let y = t.q.s * v.x + t.q.c * v.y + t.p.y
    return B2Vec2(x0:x, y0:y)
}

public func b2MulTT2( t : B2Transform,  v : B2Vec2) : B2Vec2 {
    let px = v.x - t.p.x
    let py = v.y - t.p.y
    let x = t.q.c * px + t.q.s * py
    let y = -t.q.s * px + t.q.c * py
    return B2Vec2(x0:x,y0: y)
}

public func b2MulT( a : B2Transform,  b : B2Transform) : B2Transform {
    let mC = B2Transform()
    mC.q = b2MulTRR(a.q, b.q)
    let ma = B2Vec2(x0:b.p.x - a.p.x, y0:b.p.y - a.p.y)
    mC.p = b2MulTR2(a.q, ma)
    return mC
}

public func b2Abs2( a : B2Vec2) : B2Vec2 {
    return B2Vec2(x0:abs(a.x), y0:abs(a.y))
}

public func b2Min( a : B2Vec2,  b : B2Vec2) : B2Vec2 {
    return B2Vec2(x0:min(a.x, b.x), y0:min(a.y, b.y))
}

public func b2Max( a : B2Vec2,  b : B2Vec2) : B2Vec2 {
    return B2Vec2(x0:max(a.x, b.x), y0:max(a.y, b.y))
}

public func b2ClampF( a : Float64,  low : Float64,  high : Float64) : Float64 {
    return max(low, min(a, high))
}

public func b2NextPowerOfTwo( x0 : Int64) : Int64 {
    var x = x0
    x = x | (x >> 1)
    x = x | (x >> indexTwo)
    x = x | (x >> int4)
    x = x | (x >> b2MaxSubSteps)
    x = x | (x >> int16)
    return x + 1
}

