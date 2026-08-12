/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


public class B2MassData {
    public var mass: Float64 = 0.0
    public var center = B2Vec2()
    public var aI: Float64 = 0.0
}

public enum B2ShapeType{
    | CIRCLE
    | EDGE
    | POLYGON
    | CHAIN
    | TYPECOUNT
    public func getValue(){
        match(this){
            case CIRCLE => 0
            case EDGE => 1
            case POLYGON => 2
            case CHAIN => 3
            case TYPECOUNT => 4
            case _=> throw Exception("invalid value for input of get getRawValue")
        }
    }

}

public open class B2Shape {
    var mType: B2ShapeType
    var mRadius: Float64

    init() {
        mType = B2ShapeType.CIRCLE
        mRadius = 0.0
    }
    
    public open func clone() : B2Shape {
        throw Exception("must override")
    }
    
    public func getType():B2ShapeType {
        return mType
    
    }
    
    public open func childCount(): Int64{
        throw Exception("must override")            
    }
    
    public open func testPoint( transform: B2Transform,  point: B2Vec2) : Bool {
        throw Exception("must override")
    }
    
    public open func rayCast( output: B2RayCastOutput,  input: B2RayCastInput,  transform: B2Transform,  childIndex: Int64) : Bool {
        throw Exception("must override")
    }
    
    public open func computeAaBb( aabb: B2AaBb,  transform: B2Transform,  childIndex: Int64): B2AaBb {
        throw Exception("must override")
    }
    
    public open func computeMass( density: Float64) : B2MassData {
        throw Exception("must override")
    }
    
    public open mut prop radius: Float64 {
        get() {
            mRadius
        }
        set(newValue) {
            mRadius = newValue
        }
    }
}

public class B2CircleShape <: B2Shape {
    public init(){
        super()
        mType = B2ShapeType.CIRCLE
        mRadius = 0.0
        mPoint = B2Vec2(x0: 0.0, y0: 0.0)
    }
    
    public override func clone(): B2Shape {
        let clone = B2CircleShape()
        clone.mRadius = mRadius
        clone.mPoint = mPoint
        return clone
    }
    
    public func childCount(): Int64 {
        return 1
    }
    
    public override func testPoint( transform: B2Transform,  point: B2Vec2) : Bool {
        let center = add(transform.p, b2MulR2(transform.q, mPoint))
        let d = subtract(p, center)
        return b2Dot22(d, d) <= mRadius * mRadius
    }
    
    public override func rayCast( output: B2RayCastOutput,  input: B2RayCastInput, transform: B2Transform, childIndex: Int64) : Bool {
        let position = add(transform.p, b2MulR2(transform.q, mPoint))
        let s = subtract(input.p1, position)
        let b = b2Dot22(s, s) - mRadius * mRadius
        let r = subtract(input.p2, input.p1)
        let c =  b2Dot22(s, r)
        let rr = b2Dot22(r, r)
        let sigma = c * c - rr * b
        if ((sigma < 0.0 || rr < b2Epsilon)) {
            return false
        }
        var a = -(c + b2Sqrt(sigma))
        if ((0.0 <= a && a <= input.maxFraction * rr)) {
            a /= rr
            output.fraction = a
            output.normal = add(s, multM(r, a))
            output.normal.normalize()
            return true
        }
        return false
    }
    
    public override func computeAaBb( aabb: B2AaBb,  transform: B2Transform,  childIndex: Int64): B2AaBb {
        let p = add(transform.p, b2MulR2(transform.q, mPoint))
        aabb.lowerBound.set(p.x - mRadius, p.y - mRadius)
        aabb.upperBound.set(p.x + mRadius, p.y + mRadius)
        return aabb
    }
    
    public open override func computeMass( density: Float64) : B2MassData {
        let massData = B2MassData()
        massData.mass = density * b2PI * mRadius * mRadius
        massData.center = mPoint
        massData.aI = massData.mass * (half * mRadius * mRadius + b2Dot22(mPoint, mPoint))
        return massData
    }
    
    open func getSupport( direction: B2Vec2) : Int64 {
        return 0
    }
    
    open func getSupportVertex( direction: B2Vec2) : B2Vec2 {
        return mPoint
    }
    
    open prop vertexCount: Int64 {
        get(){
            1
        }
    }
    
    open func vertex( index: Int64) : B2Vec2 {
        return mPoint
    }
    
    open mut prop p: B2Vec2 {
        get() {
            mp.get(index:0)
        }
        set(newValue) {
            mp.set(index:0, newValue:newValue)
        }
    }
    
    var mp = B2Array<B2Vec2>(count:1, repeatedValue:B2Vec2())

    mut prop mPoint: B2Vec2 {
        get() {
            mp.get(index:0)
        }
        set(newValue) {
            mp.set(index:0, newValue:newValue)
        }
    }
}

public open class B2EdgeShape <: B2Shape {
    var mVertex0 : B2Vec2
    var mVertex3 : B2Vec2
    var mHasVertex0 : Bool
    var mHasVertex3 : Bool
    var mVertices = B2Array<B2Vec2>(count:indexTwo, repeatedValue:B2Vec2())

    public init() {
        super()
        mVertex0 = B2Vec2(x0: 0.0, y0: 0.0)
        mVertex3 = B2Vec2(x0: 0.0, y0: 0.0)
        mHasVertex0 = false
        mHasVertex3 = false
        mType = B2ShapeType.EDGE
        mRadius = b2PolygonRadius
    }
    
    public open func set( v1: B2Vec2,  v2: B2Vec2) {
        mVertex1 = v1
        mVertex2 = v2
        mHasVertex0 = false
        mHasVertex3 = false
    }
    
    public open override func clone() : B2Shape {
        let clone = B2EdgeShape()
        clone.mRadius = mRadius
        clone.mVertices = mVertices
        clone.mVertex0 = mVertex0
        clone.mVertex3 = mVertex3
        clone.mHasVertex0 = mHasVertex0
        clone.mHasVertex3 = mHasVertex3
        return clone
    }
    
    public open override func childCount(): Int64 {
        return 1
    }
    
    public open override func testPoint( transform: B2Transform,  point: B2Vec2) : Bool {
        return false
    }
    
    public override func computeAaBb( aabb: B2AaBb,  transform: B2Transform,  childIndex: Int64) : B2AaBb {
        let v1 = b2MulT2(transform, mVertex1)
        let v2 = b2MulT2(transform, mVertex2)
        let lower = b2Min(v1, v2)
        let upper = b2Max(v1, v2)
        let r = B2Vec2(x0: mRadius, y0: mRadius)
        aabb.lowerBound = subtract(lower, r)
        aabb.upperBound = add(upper, r)
        return aabb
    }
    
    public open override func computeMass( density: Float64) : B2MassData {
        let massData = B2MassData()
        massData.mass = 0.0
        massData.center = multM(add(mVertex1, mVertex2), half)
        massData.aI = 0.0
        return massData
    }
    
    public open mut prop vertex1 : B2Vec2 {
        get() {
            mVertices.get(index:0)
        }
        set(newValue) {
            mVertices.set(index:0,newValue: newValue)
        }
    }
    
    public open mut prop vertex2 : B2Vec2 {
        get() {
            mVertices.get(index:1)
        }
        set(newValue) {
            mVertices.set(index:1,newValue: newValue)
        }
    }
    
    public open mut prop vertex0: B2Vec2 {
        get() {
            return mVertex0
        }
        set(newValue) {
            mVertex0 = newValue
        }
    }
    
    public open mut prop vertex3: B2Vec2 {
        get() {
            mVertex3
        }
        set(newValue) {
            mVertex3 = newValue
        }
    }
    
    public open mut prop hasVertex0: Bool {
        get() {
            mHasVertex0
        }
        set(newValue) {
            mHasVertex0 = newValue
        }
    }
    
    public open mut prop hasVertex3: Bool {
        get() {
            mHasVertex3
        }
        set(newValue) {
            mHasVertex3 = newValue
        }
    }
    
    mut prop mVertex1 : B2Vec2 {
        get() {
            mVertices.get(index:0)
        }
        set(newValue) {
            mVertices.set(index:0,newValue: newValue)
        }
    }
    
    mut prop mVertex2 : B2Vec2 {
        get() {
            return mVertices.get(index:1)
        }
        set(newValue) {
            mVertices.set(index:1,newValue: newValue)
        }
    }

}

public class B2PolygonShape <: B2Shape {
    public init() {
        super()
        mCentroid = B2Vec2(x0: 0.0, y0: 0.0)
        mType = B2ShapeType.POLYGON
        mRadius = b2PolygonRadius
    }
    
    public override func clone() : B2Shape {
        let clone = B2PolygonShape()
        clone.mCentroid = mCentroid
        clone.mVertices = mVertices
        clone.mNormals = mNormals
        clone.mRadius = mRadius
        return clone
    }
    
    public override func childCount(): Int64 {
        return 1
    }
    
    public func setAsEdge( v1: B2Vec2,  v2: B2Vec2) {
        mVertices.append(newElement:v1)
        mVertices.append(newElement:v2)
        mCentroid.x = half * (v1.x + v2.x)
        mCentroid.y = half * (v1.y + v2.y)
        mNormals.append(newElement:crossVF(subtractVV(v2, v1), 1.0))
        var mn0 = mNormals.get(index:0)
        mn0.normalize()
        mNormals.append(newElement:B2Vec2(x0:(-mNormals.get(index:0).x), y0:(-mNormals.get(index:0).y)))
    }
    
    open func setAsBox( hx: Float64,  hy: Float64) {
        mVertices.removeAll()
        mVertices.append(newElement:B2Vec2(x0:-hx, y0:-hy))
        mVertices.append(newElement:B2Vec2( x0:hx, y0:-hy))
        mVertices.append(newElement:B2Vec2( x0:hx, y0: hy))
        mVertices.append(newElement:B2Vec2(x0:-hx, y0: hy))
        mNormals.removeAll()
        mNormals.append(newElement:B2Vec2( x0:0.0,  y0:-1.0))
        mNormals.append(newElement:B2Vec2( x0:1.0,  y0: 0.0))
        mNormals.append(newElement:B2Vec2( x0:0.0,  y0: 1.0))
        mNormals.append(newElement:B2Vec2(x0:-1.0,   y0:0.0))
        mCentroid.setZero()
    }

    public func subtractVV( a: B2Vec2,  b: B2Vec2) : B2Vec2 {
        let v = B2Vec2(x0: a.x - b.x, y0: a.y - b.y)
        return v
    }
    
    public func crossVV( a: B2Vec2,  b: B2Vec2) : Float64 {
        return a.x * b.y - a.y * b.x
    }
    
    public func crossVF( a: B2Vec2,  s: Float64) : B2Vec2 {
        let v = B2Vec2(x0: s * a.y,  y0:-s * a.x)
        return v
    }
    
    public override func computeAaBb( aabb: B2AaBb,  transform: B2Transform,  childIndex: Int64): B2AaBb {
        var lower = b2MulT2(transform, mVertices.get(index:0))
        var upper = lower
        for (i in 1 .. mCount) {
            let v = b2MulT2(transform, mVertices.get(index:i))
            lower = b2Min(lower, v)
            upper = b2Max(upper, v)
        }
        let r = B2Vec2(x0: mRadius, y0: mRadius)
        aabb.lowerBound = subtract(lower, r)
        aabb.upperBound = add(r, upper)
        return aabb
    }
    
    public open override func computeMass( density: Float64) : B2MassData {
        var center = B2Vec2(x0: 0.0,  y0:0.0)
        var area: Float64 = 0.0
        var mI: Float64 = 0.0
        var s = B2Vec2(x0: 0.0, y0: 0.0)
        for (i in 0 .. mCount) {
            addEqual(s, mVertices.get(index:i))
        }
        mulEqual(a:s, b:1.0 / Float64(mVertices.count))
        let inv3: Float64 = 1.0 / float3
        for (i in 0 .. mCount) {
            let e1 = subtract(mVertices.get(index:i), s)
            var e2 = subtract(mVertices.get(index:0), s)
            if (i + 1 < mCount)
            {
                e2 = subtract(mVertices.get(index:i + 1), s)
            }         
            let aD = b2Cross(e1, e2)
            let triangleArea = half * aD
            area += triangleArea
            addEqual(center, multM(add(e1, e2), inv3 * triangleArea))
            let ex1 = e1.x
            let ey1 = e1.y
            let ex2 = e2.x
            let ey2 = e2.y
            let intx2 = ex1*ex1 + ex2*ex1 + ex2*ex2
            let inty2 = ey1*ey1 + ey2*ey1 + ey2*ey2
            mI += float025 * inv3 * aD * (intx2 + inty2)
        }
        let massData = B2MassData()
        massData.mass = density * area
        mulEqual(a:center,b: 1.0 / area)
        massData.center = add(center, s)
        massData.aI = density * mI
        massData.aI += massData.mass * (b2Dot22(massData.center, massData.center) - b2Dot22(center, center))
        return massData
    }
    
    open prop vertexCount: Int64 {
        get(){
            mCount
        }
    }
    
    public open func vertex(index :Int64): B2Vec2  {
        
        return mVertices.get(index:index)
        
    }
    
    open func validate() : Bool {
        for (i in 0 .. mVertices.count) {
            let i1 = i
            var i2 = 0
            if (i < mVertices.count - 1) {
	        i2 = i1 + 1
	    } else {
	        i2 = 0
	    }
            let p = mVertices.get(index:i1)
            let e = subtract(mVertices.get(index:i2), p)
            for (j in 0 .. mCount) {
                if (j == i1 || j == i2) {
                    continue
                }
                let v = subtract(mVertices.get(index:j), p)
                let c = b2Cross(e, v)
                if (c < 0.0) {
                    return false
                }
            }
        }
        return true
    }
    
    open prop vertices: B2Array<B2Vec2> {
        get(){
            mVertices
        }
    }
    
    open prop count: Int64 {
        get(){
            mCount
        }
    }
    
    var mCentroid = B2Vec2()
    var mVertices = B2Array<B2Vec2>()
    var mNormals = B2Array<B2Vec2>()
    open prop mCount: Int64 {
        get(){
            mVertices.count
        }
    }
}
