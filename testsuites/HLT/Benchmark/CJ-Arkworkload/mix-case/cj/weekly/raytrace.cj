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
import std.math.*

var checkNumber = 0

// ------------------------------------------------------------------------
// ------------------------------------------------------------------------

// The rest of this file is the actual ray tracer written by Adam
// Burmister. It's a concatenation of the following files:
//
//   flog/color.js
//   flog/light.js
//   flog/vector.js
//   flog/ray.js
//   flog/scene.js
//   flog/material/basematerial.js
//   flog/material/solid.js
//   flog/material/chessboard.js
//   flog/BaseShape/baseBaseShape.js
//   flog/BaseShape/sphere.js
//   flog/BaseShape/plane.js
//   flog/intersectioninfo.js
//   flog/camera.js
//   flog/background.js
//   flog/engine.js

let debug: Bool = false
func debugLog(msg: String) {
    if (debug) {
        print(msg)
    }
}

// Defined class Color
class Color {
    var red: Float32 = 0.0
    var green: Float32 = 0.0
    var blue: Float32 = 0.0

    init(r: ?Float32, g: ?Float32, b: ?Float32) {
        this.red = r ?? 0.0
        this.green = g ?? 0.0
        this.blue = b ?? 0.0
    }

    static func add(c1: Color, c2: Color): Color {
        let result = Color(0.0, 0.0, 0.0)
        result.red = c1.red + c2.red
        result.green = c1.green + c2.green
        result.blue = c1.blue + c2.blue
        return result
    }

    static func addScalar(c1: Color, s: Float32): Color {
        let result = Color(0.0, 0.0, 0.0)
        result.red = c1.red + s
        result.green = c1.green + s
        result.blue = c1.blue + s
        result.limit()
        return result
    }
    static func subtract(c1: Color, c2: Color): Color {
        let result = Color(0.0, 0.0, 0.0)
        result.red = c1.red - c2.red
        result.green = c1.green - c2.green
        result.blue = c1.blue - c2.blue
        return result
    }
    static func multiply(c1: Color, c2: Color): Color {
        let result = Color(0.0, 0.0, 0.0)
        result.red = c1.red * c2.red
        result.green = c1.green * c2.green
        result.blue = c1.blue * c2.blue
        return result
    }
    static func multiplyScalar(c1: Color, f: Float32): Color {
        let result = Color(0.0, 0.0, 0.0)
        result.red = c1.red * f
        result.green = c1.green * f
        result.blue = c1.blue * f
        return result
    }
    static func divideFactor(c1: Color, f: Float32): Color {
        let result = Color(0.0, 0.0, 0.0)
        result.red = c1.red / f
        result.green = c1.green / f
        result.blue = c1.blue / f
        return result
    }
    func limit() {
        if (this.red > 0.0) {
            if (this.red > 1.0) {
                this.red = 1.0
            }
        } else {
            this.red = 0.0
        }
        if (this.green > 0.0) {
            if (this.green > 1.0) {
                this.green = 1.0
            }
        } else {
            this.green = 0.0
        }
        if (this.blue > 0.0) {
            if (this.blue > 1.0) {
                this.blue = 1.0
            }
        } else {
            this.blue = 0.0
        }
    }

    func distance(color: Color): Float32 {
        let d = abs(this.red - color.red) + abs(this.green - color.green) + abs(this.blue - color.blue)
        return d
    }
    
    static func blend(c1: Color, c2: Color, w: Float32): Color {
        var result = Color(0.0, 0.0, 0.0)
        result = Color.add(Color.multiplyScalar(c1, 1.0 - w), Color.multiplyScalar(c2, w))
        return result
    }

    func brightness(): Int64 {
        let r = Int64(this.red * 255.0)
        let g = Int64(this.green * 255.0)
        let b = Int64(this.blue * 255.0)
        return (r * 77 + g * 150 + b * 29) >> 8
    }

    func toString(): String {
        let r = Int64(this.red * 255.0)
        let g = Int64(this.green * 255.0)
        let b = Int64(this.blue * 255.0)
        return "rgb(${r},${g},${b})"
    }
}

// Defined class Light
class Light {
    var position: Vector
    var color: Color
    var intensity: Float32 = 10.0
    init(pos: Vector, color: Color, intensity!: Float32 = 10.0) {
        this.position = pos
        this.color = color
        this.intensity = intensity
    }
    func toString(): String {
        return "Light [${this.position.x},${this.position.y},${this.position.z}]"
    }
}

// Defined class Vector
class Vector {
    var x: Float32 = 0.0
    var y: Float32 = 0.0
    var z: Float32 = 0.0

    init(xF: ?Float32, yF: ?Float32, zF: ?Float32) {
        this.x = xF ?? 0.0
        this.y = yF ?? 0.0
        this.z = zF ?? 0.0
    }

    func copy(vector: Vector) {
        this.x = vector.x
        this.y = vector.y
        this.z = vector.z
    }

    func normalize(): Vector {
        let m: Float32 = this.magnitude()
        return Vector(this.x / m, this.y / m, this.z / m)
    }

    func magnitude(): Float32 {
        return sqrt((this.x * this.x) + (this.y * this.y) + (this.z * this.z))
    }

    func cross(w: Vector): Vector {
        return Vector(
            -this.z * w.y + this.y * w.z,
            this.z * w.x - this.x * w.z,
            -this.y * w.x + this.x * w.y
        )
    }

    func dot(w: Vector): Float32 {
        return this.x * w.x + this.y * w.y + this.z * w.z
    }

    static func add(v: Vector, w: Vector): Vector {
        return Vector(w.x + v.x, w.y + v.y, w.z + v.z)
    }

    static func subtract(v: Vector, w: Vector): Vector {
        return Vector(v.x - w.x, v.y - w.y, v.z - w.z)
    }

    static func multiplyVector(v: Vector, w: Vector): Vector {
        return Vector(v.x * w.x, v.y * w.y, v.z * w.z)
    }

    static func multiplyScalar(v: Vector, w: Float32): Vector {
        return Vector(v.x * w, v.y * w, v.z * w)
    }

    func toString(): String {
        return "Vector [${this.x},${this.y},${this.z}]"
    }
}

// Defined class Ray
class Ray {
    var position: Vector
    var direction: Vector
    init(pos: Vector, dir: Vector) {
        this.position = pos
        this.direction = dir
    }
    func toString(): String {
        return "Ray [${this.position.toString()},${this.direction.toString()}]"
    }
}

// Defined class Scene
class Scene {
    var camera: Camera
    var shapes: ArrayList<BaseShape>
    var lights: ArrayList<Light>
    var background: Background
    init() {
        this.camera = Camera(Vector(0.0, 0.0, -5.0), Vector(0.0, 0.0, 1.0),
            Vector(0.0, 1.0, 0.0))
        this.shapes = ArrayList<BaseShape>()
        this.lights = ArrayList<Light>()
        this.background = Background(Color(0.0, 0.0, 0.5), 0.2)
    }
}

// Defined class BaseMaterial
open class BaseMaterial {
    var gloss: Float32
    var transparency: Float32
    var reflection: Float32
    var refraction: Float32
    var hasTexture: Bool

    init() {
        this.gloss = 2.0
        this.transparency = 0.0
        this.reflection = 0.0
        this.refraction = 0.50
        this.hasTexture = false
    }

    public open func getColor(u: Float32, v: Float32): Color {
        return Color(0.0, 0.0, 0.0)
    }
    func wrapUp(t: Float32): Float32 {
        var tmp = t
        if (t>=2.0 && t<=-2.0) {
            tmp = t - Float32(trunc(t))
            if (abs(Int64(t) % 2) == 1) {
                if (t > 2.0) { tmp += 1.0 }
                if (t < -2.0) { tmp -= 1.0 }
            }
        }
         
        if (tmp < -1.0) {
            tmp += 2.0
        }
        if (tmp >= 1.0) {
            tmp -= 2.0
        }
        return tmp
    }
    public open func toString(): String {
        return "Material [gloss=${this.gloss}, transparency=${this.transparency}, hasTexture=${this.hasTexture}]"
    }
}

// Defined class Solid
class Solid <: BaseMaterial {
    var color: Color
    init(color: Color, reflection: Float32, refraction: Float32, transparency: Float32, gloss: Float32) {
        super()
        this.color = color
        this.reflection = reflection
        this.transparency = transparency
        this.gloss = gloss
        this.hasTexture = false
    }

    public override func getColor(u: Float32, v: Float32): Color {
        return this.color
    }

    public override func toString(): String {
        return "SolidMaterial [gloss=${this.gloss}, transparency=${this.transparency}, hasTexture=${this.hasTexture}]"
    }
}

// Defined class Chessboard
class Chessboard <: BaseMaterial {
    var colorEven: Color
    var colorOdd: Color
    var density: Float32 = 0.5
    init(colorEven: Color, colorOdd: Color, reflection: Float32, transparency: Float32, gloss: Float32, density: Float32) {
        super()
        this.colorEven = colorEven
        this.colorOdd = colorOdd
        this.density = density
        this.reflection = reflection
        this.transparency = transparency
        this.gloss = gloss
        this.hasTexture = true
    }

    public override func getColor(u: Float32, v: Float32): Color {
        let t: Float32 = this.wrapUp(u * this.density) * this.wrapUp(v * this.density)
        if (t < 0.0) {
            return this.colorEven
        } else {
            return this.colorOdd
        }
    }

    public override func toString(): String {
        return "ChessMaterial [gloss=${this.gloss}, transparency=${this.transparency}, hasTexture=${this.hasTexture}]"
    }
}

// Defined class Shape
open class BaseShape {
    var position: Vector = Vector(0.0, 0.0, 0.0)
    var radius: Float32 = 0.0
    var material: BaseMaterial = BaseMaterial()
    init(position: Vector, material: BaseMaterial) {
        this.position = position
        this.material = material
    }

    public open func intersect(ray: Ray): IntersectionInfo {
        // fatalError("Subclasses must override the intersect method.")
        return IntersectionInfo()
    }
}

// Defined class Sphere
class Sphere <: BaseShape {
    init(pos: Vector, rad: Float32, mater: BaseMaterial) {
        super(pos, mater)
        this.radius = rad
        this.position = pos
        this.material = mater
    }

    public override func intersect(ray: Ray): IntersectionInfo {
        let info = IntersectionInfo()
        info.BaseShape = this
        let dst = Vector.subtract(ray.position, this.position)
        let B = dst.dot(ray.direction)
        let C = dst.dot(dst) - (this.radius * this.radius)
        let D = (B * B) - C
        if (D > 0.0) {
            info.isHit = true
            info.distance = (-B) - sqrt(D)
            info.position = Vector.add(ray.position, Vector.multiplyScalar(ray.direction, info.distance))
            info.normal = Vector.subtract(info.position, this.position).normalize()
            info.color = this.material.getColor(0.0, 0.0)
        } else {
            info.isHit = false
        }
        return info
    }

    func toString(): String {
        return "Sphere [position=${this.position.toString()}, radius=${this.radius}]"
    }
}

// Defined class Plane
class Plane <: BaseShape {
    var d: Float32 = 0.0

    init(pos: Vector, dF: Float32, mater: BaseMaterial) {
        super(pos, mater)
        this.position = pos
        this.d = dF
        this.material = mater
    }

    public override func intersect(ray: Ray): IntersectionInfo {
        let info = IntersectionInfo()
        let Vd = this.position.dot(ray.direction)
        if (Vd == 0.0) {
            return info
        }
        let t = -(this.position.dot(ray.position) + this.d) / Vd
        if (t <= 0.0) {
            return info
        }
        info.BaseShape = this
        info.isHit = true
        info.position = Vector.add(ray.position, Vector.multiplyScalar(ray.direction, t))
        info.normal = this.position
        info.distance = t
        if (this.material.hasTexture) {
            let vU = Vector(this.position.y, this.position.z, -this.position.x)
            let vV = vU.cross(this.position)
            let u = info.position.dot(vU)
            let v = info.position.dot(vV)
            info.color = this.material.getColor(u, v)
        } else {
            info.color = this.material.getColor(0.0, 0.0)
        }
        return info
    }

    func toString(): String {
        return "Plane [${this.position.toString()}, d=${this.d}]"
    }
}

// Defined class IntersectionInfo
class IntersectionInfo {
    var isHit: Bool
    var hitCount: Int64
    var BaseShape: ?BaseShape = Option<BaseShape>.None
    var position: Vector
    var normal: Vector
    var color: Color
    var distance: Float32

    init() {
        this.color = Color(0.0, 0.0, 0.0)
        this.position = Vector(0.0, 0.0, 0.0)
        this.normal = Vector(0.0, 0.0, 0.0)
        this.distance = 0.0
        this.isHit = false
        this.hitCount = 0
    }
    func toString(): String {
        return "Intersection [${this.position.toString()}]"
    }
}

class Camera {
    var position: Vector
    var lookAt: Vector
    var equator: Vector
    var up: Vector
    var screen: Vector

    init(pos: Vector, lookAt: Vector, up: Vector) {
        this.position = pos
        this.lookAt = lookAt
        this.up = up
        this.equator = lookAt.normalize().cross(this.up)
        this.screen = Vector.add(this.position, this.lookAt)
    }

    func getRay(vx: Float32, vy: Float32): Ray {
        let pos = Vector.subtract(this.screen, Vector.subtract(Vector.multiplyScalar(equator, vx), Vector.multiplyScalar(up, vy)))
        pos.y = pos.y * -1.0
        let dir = Vector.subtract(pos, this.position)
        let ray = Ray(pos, dir.normalize())
        return ray
    }

    func toString(): String {
        return "Ray []"
    }
}

// Defined class Background
class Background {
    var color: Color
    var ambience: Float32 = 0.0
    init(color: Color, ambience: Float32) {
        this.color = color
        this.ambience = ambience
    }
}

// Defined class Engine
class Engine {
    var options: Options

    init(options: Options) {
        this.options = options
        this.options.canvasHeight /= this.options.pixelHeight
        this.options.canvasWidth /= this.options.pixelWidth
    }

    func setPixel(x: Int64, y: Int64, color: Color) {
        if (x == y) {
            checkNumber += color.brightness()
        }
    }

    func renderScene(scene: Scene) {
        checkNumber = 0
        let canvasHeight = this.options.canvasHeight
        let canvasWidth = this.options.canvasWidth
        for (y in 0..canvasHeight) {
            for (x in 0..canvasWidth) {
                let yp = Float32(y) * 1.0 / Float32(canvasHeight) * 2.0 - 1.0
                let xp = Float32(x) * 1.0 / Float32(canvasWidth) * 2.0 - 1.0
                let ray = scene.camera.getRay(xp, yp)
                let color = this.getPixelColor(ray, scene)
                this.setPixel(x, y, color)
                
                
                
            }
        }
        
        if (checkNumber != 2321) {
            println("Scene rendered incorrectly")
        }
    }
    func getPixelColor(ray: Ray, scene: Scene): Color {
        let info = this.testIntersection(ray, scene, Option<BaseShape>.None)
        if (info.isHit) {
            let color = this.rayTrace(info, ray, scene, 0)
            return color
        }
        return scene.background.color
    }
    func testIntersection(ray: Ray, scene: Scene, exclude: ?BaseShape): IntersectionInfo {
        var hits: Int64 = 0
        var best = IntersectionInfo()
        best.distance = 2000.0
        for (BaseShape in scene.shapes) {
            if (exclude.isNone()) {
                let info = BaseShape.intersect(ray)
                if (info.isHit && info.distance >= 0.0 && info.distance < best.distance) {
                    best = info
                    hits += 1
                }
            } else if (!refEq(BaseShape, exclude.getOrThrow())) {
                let info = BaseShape.intersect(ray)
                if (info.isHit && info.distance >= 0.0 && info.distance < best.distance) {
                    best = info
                    hits += 1
                }
            }
        }
        best.hitCount = hits
        return best
    }
    func getReflectionRay(P: Vector, N: Vector, V: Vector): Ray {
        let c1 = -N.dot(V)
        let R1 = Vector.add(Vector.multiplyScalar(N, 2.0 * c1), V)
        return Ray(P, R1)
    }

    func rayTrace(info: IntersectionInfo, ray: Ray, scene: Scene, depth: Int64): Color {
        // Calc ambient
        var color = Color.multiplyScalar(info.color, scene.background.ambience)
        let oldColor = color
        let shininess = pow(10.0, info.BaseShape.getOrThrow().material.gloss + 1.0)
        for (light in scene.lights) {
            // Calc diffuse lighting
            let v = Vector.subtract(light.position, info.position).normalize()
            if (this.options.renderDiffuse) {
                let L = v.dot(info.normal)
                if (L > 0.0) {
                    color = Color.add(color, Color.multiply(info.color, Color.multiplyScalar(light.color, L)))
                }
            }
            // The greater the depth the more accurate the colours, but
            // this is exponentially (!) expensive
            if (depth <= this.options.rayDepth) {
                // calculate reflection ray
                if (this.options.renderReflections && info.BaseShape.getOrThrow().material.reflection > 0.0) {
                    let reflectionRay = this.getReflectionRay(info.position, info.normal, ray.direction)
                    let refl = this.testIntersection(reflectionRay, scene, info.BaseShape)
                    if (refl.isHit && refl.distance > 0.0) {
                        refl.color = this.rayTrace(refl, reflectionRay, scene, depth + 1)
                    } else {
                        refl.color = scene.background.color
                    }
                    color = Color.blend(color, refl.color, info.BaseShape.getOrThrow().material.reflection)
                }
            }
            // Render shadows and highlights
            var shadowInfo = IntersectionInfo()
            if (this.options.renderShadows) {
                let shadowRay = Ray(info.position, v)
                shadowInfo = this.testIntersection(shadowRay, scene, info.BaseShape)
                if (shadowInfo.isHit && !refEq(shadowInfo.BaseShape.getOrThrow(), info.BaseShape.getOrThrow())) {
                    let vA = Color.multiplyScalar(color, 0.5)
                    let dB = 0.5 * pow(shadowInfo.BaseShape.getOrThrow().material.transparency, 0.5)
                    color = Color.addScalar(vA, dB)
                }
            }
            // Phong specular highlights
            if (this.options.renderHighlights && !shadowInfo.isHit && info.BaseShape.getOrThrow().material.gloss > 0.0) {
                let Lv = Vector.subtract(info.BaseShape.getOrThrow().position, light.position).normalize()
                let E = Vector.subtract(scene.camera.position, info.BaseShape.getOrThrow().position).normalize()
                let H = Vector.subtract(E, Lv).normalize()
                let glossWeight = pow(max(info.normal.dot(H), 0.0), shininess)
                color = Color.add(Color.multiplyScalar(light.color, glossWeight), color)
            }
        }
        color.limit()
        return color
    }
}

// Defined class Options
class Options {
    var canvasHeight: Int64 = 100
    var canvasWidth: Int64 = 100
    var pixelWidth: Int64 = 2
    var pixelHeight: Int64 = 2
    var renderDiffuse: Bool = false
    var renderShadows: Bool = false
    var renderHighlights: Bool = false
    var renderReflections: Bool = false
    var rayDepth: Int64 = 2
}

func renderScene() {
    let scene = Scene()
    scene.camera = Camera(Vector(0.0, 0.0, -15.0),
                          Vector(-0.2, 0.0, 5.0),
                          Vector(0.0, 1.0, 0.0))
    scene.background = Background(Color(0.5, 0.5, 0.5), 0.4)

    let sphere = Sphere(Vector(-1.5, 1.5, 2.0), 1.5, Solid(Color(0.0, 0.5, 0.5), 0.3, 0.0, 0.0, 2.0))
    let sphere1 = Sphere(Vector(1.0, 0.25, 1.0), 0.5, Solid(Color(0.9, 0.9, 0.9), 0.1, 0.0, 0.0, 1.5))

    let plane = Plane(Vector(0.1, 0.9, -0.5).normalize(),
                            1.2,
                            Chessboard(Color(1.0, 1.0, 1.0),
                                          Color(0.0, 0.0, 0.0),
                                          0.2,
                                          0.0,
                                          1.0,
                                          0.7))
    scene.shapes.add(sphere)
    scene.shapes.add(sphere1)
    scene.shapes.add(plane)

    let light = Light(Vector(5.0, 10.0, -1.0),
                      Color(0.8, 0.8, 0.8))
    let light1 = Light(Vector(-3.0, 5.0, -15.0),
                       Color(0.8, 0.8, 0.8),
                       intensity: 100.0)
    scene.lights.add(light)
    scene.lights.add(light1)
    let option = Options()
    option.canvasWidth = 100
    option.canvasHeight = 100
    option.pixelWidth = 5
    option.pixelHeight = 5
    option.renderDiffuse = true
    option.renderHighlights = true
    option.renderShadows = true
    option.renderReflections = true
    option.rayDepth = 2
    
    let raytracer = Engine(option)
    raytracer.renderScene(scene)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

/**
 * @State
 * @Tags Jetstream2
 */
class Benchmark {
    /**
     * @Benchmark
     */
    func runIteration() {
        for (_ in 0..5) {
            renderScene()
        }
    }
}
class Timer {
    // ms
    public func getTime() {
        let time = DateTime.now()
        return time
    }
}

func run() {
    let startTime = Timer().getTime()
    let raytrace = Benchmark()
    for (_ in 0..20) {
        raytrace.runIteration()
    }
    let endTime = Timer().getTime()
    let duration = endTime - startTime
    println("raytrace: ms = ${Float64(duration.toNanoseconds())/1000000.0}")
}

main() {
    run()
}
