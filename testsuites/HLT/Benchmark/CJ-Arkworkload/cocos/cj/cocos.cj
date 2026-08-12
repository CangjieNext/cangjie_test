/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 --no-sub-pkg %f -o %output
// RUN-EXEC: %export cjHeapSize=512mb && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ms

import std.time.*
import std.collection.*

class Timer {
    private var start_time: DateTime = DateTime.now()
    private var end_time: DateTime = DateTime.now()

    public init() {}

    public func start() {
        start_time = DateTime.now()
    }

    public func stop(): Duration {
        end_time = DateTime.now()
        end_time - start_time
    }
}
var reference: Array<Int64> = [81491, 2739514]
var n: Int64 = 0

class Vec3 {
    public var x: Float64
    public var y: Float64
    public var z: Float64

    public init(x: Float64, y: Float64, z: Float64) {
        this.x = x
        this.y = y
        this.z = z
    }

    public static func set(out: Vec3, x: Float64, y: Float64, z: Float64): Vec3 {
        out.x = x
        out.y = y
        out.z = z
        return out
    }

    public static func add(out: Vec3, a: Vec3, b: Vec3): Vec3 {
        out.x = a.x + b.x
        out.y = a.y + b.y
        out.z = a.z + b.z
        return out
    }

    public static func multiplyScalar(out: Vec3, a: Vec3, b: Float64): Vec3 {
        out.x = a.x * b
        out.y = a.y * b
        out.z = a.z * b
        return out
    }

    public static func scaleAndAdd(out: Vec3, a: Vec3, b: Vec3, scale: Float64): Vec3 {
        out.x = a.x + b.x * scale
        out.y = a.y + b.y * scale
        out.z = a.z + b.z * scale
        return out
    }

    public static func copy(out: Vec3, a: Vec3): Vec3 {
        out.x = a.x
        out.y = a.y
        out.z = a.z
        return out
    }
}

class Particle {
    public var particleSystem: ParticleSystemRenderCPU
    public var position: Vec3
    public var velocity: Vec3
    public var animatedVelocity: Vec3
    public var ultimateVelocity: Vec3
    public var startSize: Vec3
    public var size: Vec3
    public var randomSeed: Int64 // uint
    public var remainingLifetime: Float64
    public var loopCount: Float64
    public var lastLoop: Float64
    public var trailDelay: Float64
    public var startLifetime: Float64
    public var emitAccumulator0: Float64
    public var emitAccumulator1: Float64
    public var frameIndex: Float64
    public var startRow: Float64

    public init(particleSystem: ParticleSystemRenderCPU) {
        this.particleSystem = particleSystem
        this.position = Vec3(0.0, 0.0, 0.0)
        this.velocity = Vec3(0.0, 0.0, 0.0)
        this.animatedVelocity = Vec3(0.0, 0.0, 0.0)
        this.ultimateVelocity = Vec3(0.0, 0.0, 0.0)
        this.startSize = Vec3(0.0, 0.0, 0.0)
        this.size = Vec3(0.0, 0.0, 0.0)
        this.randomSeed = 0
        this.remainingLifetime = 0.2
        this.loopCount = 0.0
        this.lastLoop = 0.0
        this.trailDelay = 0.0
        this.startLifetime = 1.0
        this.emitAccumulator0 = 0.0
        this.emitAccumulator1 = 0.0
        this.frameIndex = 0.0
        this.startRow = 0.0
    }
}

struct ModeType {
    public var Constant: Float64
    public var Curve: Float64
    public var TwoCurves: Float64
    public var TwoConstants: Float64

    public init(a: Float64, b: Float64, c: Float64, d: Float64) {
        this.Constant = a
        this.Curve = b
        this.TwoCurves = c
        this.TwoConstants = d
    }
}

let Mode = ModeType(0.0, 1.0, 2.0, 3.0)

func multi(t: Float64, length: Float64): Float64 {
    return t - Float64(Int64(t / length)) * length
}

func wrapMulti(time: Float64, prevTime: Float64, nextTime: Float64): Float64 {
    return prevTime + multi(time - prevTime, nextTime - prevTime)
}

func binarySearchEpsilon (array: ArrayList<Float64>, value: Float64, EPSILON!: Float64 = 1e-6): Int64 {
    var low = 0
    var high = array.size - 1
    var middle = high >> 1
    while(low <= high) {
        let test = array[middle]
        if (test > (value + EPSILON)) {
            high = middle - 1
        } else if (test < (value - EPSILON)) {
            low = middle + 1
        } else {
            return middle
        }
        middle = (low + high) >> 1
        n += 1
    }
    return !low
}

func bezierInterpolate (p0: Float64, p1: Float64, p2: Float64, p3: Float64, t: Float64): Float64 {
    n += 1
    let u = 1.0 - t
    let coeff0 = u * u * u
    let coeff1 = 3.0 * u * u * t
    let coeff2 = 3.0 * u * t * t
    let coeff3 = t * t * t
    return coeff0 * p0 + coeff1 * p1 + coeff2 * p2 + coeff3 * p3
}

class RealKeyframeValue {
    public var value: Float64 = 0.0
    public var rightTangent: Float64 = 0.0
    public var rightTangentWeight: Float64 = 0.0
    public var leftTangent: Float64 = 0.0
    public var leftTangentWeight: Float64 = 0.0

    public init(a: Float64, b: Float64, c: Float64, d: Float64, e: Float64) {
        this.value = a
        this.rightTangent = b
        this.rightTangentWeight = c
        this.leftTangent = d
        this.leftTangentWeight = e
    }
}

func evalBetweenTwoKeyFrames (
    prevTime: Float64,
	prevValue: RealKeyframeValue,
    nextTime: Float64,
    nextValue: RealKeyframeValue,
    ratio: Float64
): Float64 {
    let dt = nextTime - prevTime
    let ONE_THIRD = 1.0 / 3.0
    let prevTangentWeightEnabled = false
    let nextTangentWeightEnabled = false

    let prevTangent = prevValue.rightTangent
    let prevTangentWeightSpecified = prevValue.rightTangentWeight
    let nextTangent = nextValue.leftTangent
    let nextTangentWeightSpecified = nextValue.leftTangentWeight

    if (!prevTangentWeightEnabled && !nextTangentWeightEnabled) {
        // Optimize for the case when both x components of tangents are 1.
        // See below.
        let p1 = prevValue.value + ONE_THIRD * prevTangent * dt
        let p2 = nextValue.value - ONE_THIRD * nextTangent * dt
        return bezierInterpolate(prevValue.value, p1, p2, nextValue.value, ratio)
    }
    return 0.0
}

enum TestError {
    | ErrorOne (String)
}

func assertIsTrue (expr!: Bool, message!: String = ""):Unit {
    if (!expr) {
    }
}

class RealCurve {
    public var value: Float64 = 0.0
    public var rightTangent: Float64 = 0.0
    public var rightTangentWeight: Float64 = 0.0
    public var leftTangent: Float64 = 0.0
    public var leftTangentWeight: Float64 = 0.0

    private var _times: ArrayList<Float64> = ArrayList<Float64>.of(0.1111111, 0.555555555, 0.999999999)
    private var _values: ArrayList<RealKeyframeValue> = ArrayList<RealKeyframeValue>.of(RealKeyframeValue(0.2, 0.7, 0.0, 0.3, 0.0), RealKeyframeValue(0.3, 0.4, 0.0, 0.2, 0.0), RealKeyframeValue(0.4, 0.5, 0.0, 0.6, 0.0))

    public func evaluate(time1: Float64): Float64 {

        var time = time1
        let times = this._times
        let values = this._values

        let nFrames = times.size
        let firstTime = times[0]
        let lastTime = times[nFrames - 1]
        if (time < firstTime) {
            let preValue = values[0]
            time = wrapMulti(time, firstTime, lastTime) // 次数

        }

        let index = binarySearchEpsilon(times, time)
        if (index >= 0) {
            return values[index].value
        }

        let iNext = !index
                        // assertIsTrue(iNext !== 0 && iNext !== nFrames && nFrames > 1);

        let iPre = iNext - 1
        let preTime = times[iPre]
        let preValue = values[iPre]
        let nextTime = times[iNext]
        let nextValue = values[iNext]
        let dt = nextTime - preTime

        let ratio = (time - preTime) / dt
        return evalBetweenTwoKeyFrames(preTime, preValue, nextTime, nextValue, ratio)
    }
}

class CurveRange {
    public var mode: Float64 = Mode.Constant

    public var spline: RealCurve = RealCurve()

    public var constant: Float64 = 1.0

    public var multiplier: Float64 = 1.0

    public init(thismode: Float64) {
        this.mode = thismode
    }

    public func evaluate(time: Float64): Float64 {
        if (this.mode == Mode.Constant) {
            return this.constant
        } else if(this.mode == Mode.Curve) {
            return this.spline.evaluate(time) * this.multiplier
        } else {
            return this.constant
        }
    }
}

class SizeModule {
    public var size: CurveRange = CurveRange(Mode.Curve)

    public var x: CurveRange = CurveRange(Mode.Curve)

    public var y: CurveRange = CurveRange(Mode.Curve)

    public var z: CurveRange = CurveRange(Mode.Curve)

    public func animate(particle: Particle, dt: Float64): Unit {
        Vec3.multiplyScalar(particle.size, particle.startSize,
            this.size.evaluate(1.0 - particle.remainingLifetime / particle.startLifetime))
    }
}

class VelocityModule {
    public var x: CurveRange = CurveRange(Mode.Curve)

    public var y: CurveRange = CurveRange(Mode.Curve)

    public var z: CurveRange = CurveRange(Mode.Curve)

    public var speedModifier: CurveRange = CurveRange(Mode.Constant)

    public var space: Float64 = 0.0

    private var needTransform: Bool

    public var _temp_v3: Vec3 = Vec3(0.0, 0.0, 0.0)
    public init() {
	    this.speedModifier.constant = 1.0
        this.needTransform = false
    }

    public func animate(p: Particle, dt: Float64): Unit {
        let normalizedTime = 1.0 - p.remainingLifetime / p.startLifetime
        let vel = Vec3.set(this._temp_v3,
            this.x.evaluate(normalizedTime),
            this.y.evaluate(normalizedTime),
            this.z.evaluate(normalizedTime))
        if (this.needTransform) {
        }
        Vec3.add(p.animatedVelocity, p.animatedVelocity, vel)
        Vec3.add(p.ultimateVelocity, p.velocity, p.animatedVelocity)
        Vec3.multiplyScalar(p.ultimateVelocity, p.ultimateVelocity,
            this.speedModifier.evaluate(1.0 - p.remainingLifetime / p.startLifetime))
    }
}

class ParticleSystemRenderCPU {
    private var _particles: ArrayList<Particle>
    private var _sizeModule: SizeModule
    private var _velocityModule: VelocityModule

    public init() {
        let size = 50
        this._sizeModule = SizeModule()
        this._velocityModule = VelocityModule()
        this._particles = ArrayList<Particle>()
        for (i in 0..size) {
            this._particles.add(Particle(this))
        }
    }

    public func UpdateParticles(dt: Float64): Unit {
        for (i in 0..this._particles.size) {
            let p = this._particles[i];
            Vec3.set(p.animatedVelocity, 0.0, 0.0, 0.0)

            Vec3.copy(p.ultimateVelocity, p.velocity)

            this._sizeModule.animate(p, dt)
            this._velocityModule.animate(p, dt)
            Vec3.scaleAndAdd(p.position, p.position, p.ultimateVelocity, dt) // apply velocity.
        }
    }
}

func runCocos(): Int64{
    var systems: ArrayList<ParticleSystemRenderCPU> = ArrayList<ParticleSystemRenderCPU>(18, { index => ParticleSystemRenderCPU() })
    let timer = Timer()
    timer.start()
    for (x in 0..600) {
        for (i in 0..18) {
            systems[i].UpdateParticles(0.5)
        }
    }
    let time = timer.stop()
    println("Cocos - RunCocos:\t${Float64(time.toNanoseconds())/1000000.0}\tms")
    return 0

}

main(): Int64 {
    runCocos()
    0
}
