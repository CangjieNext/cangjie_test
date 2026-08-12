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
//
//  3d-raytrace.swift
//  Worker
//
//  Created by 史栋 on 2023/11/9.
//

import std.time.*
import std.collection.*
import std.math.*

/********** 测试部分 *******/

/// 是否输出日志(需要先定义)
let DEBUG = false
/// 是否输出脚本
let showRenderJs = false

/// 矢量类 存储x,y,z三个浮点数，用来表示一个位置，一个像素点
class Vector {
    
    var values: Array<Float64>
    
    var reflection: ?Float64 = 0.0
    
    var colour: ?Vector = Option<Vector>.None
    
    static func zero(): Vector {
        return Vector(0.0, 0.0, 0.0)
    }
    
    init(x: Float64,y: Float64,z: Float64) {
        values = [x, y, z]
    }
    // log打印使用
    func description(): String {
        "[${scriptString()}]"
    }
    // 绘制脚本拼接使用
    func scriptString(): String {
        "${values[0]},${values[1]},${values[2]}"
    }
}

func createVector(x: Float64, y: Float64, z: Float64): Vector{
    Vector(x,y,z)
}

func sqrLengthVector(vector: Vector): Float64{
    return vector.values[0] * vector.values[0] + vector.values[1] * vector.values[1] + vector.values[2] * vector.values[2]
}

func lengthVector(vector: Vector): Float64{
    sqrt(vector.values[0] * vector.values[0] + vector.values[1] * vector.values[1] + vector.values[2] * vector.values[2])
}

func addVector(vector: Vector, v: Vector): Vector {
    vector.values[0] += v.values[0]
    vector.values[1] += v.values[1]
    vector.values[2] += v.values[2]
    return vector
}

func subVector(vector: Vector, v: Vector): Vector {
    vector.values[0] -= v.values[0]
    vector.values[1] -= v.values[1]
    vector.values[2] -= v.values[2]
    return vector
}

func scaleVector(vector: Vector, scale: Float64): Vector{
    vector.values[0] *= scale
    vector.values[1] *= scale
    vector.values[2] *= scale
    return vector
}

func normaliseVector(vector: Vector): Vector {
    let len = sqrt(vector.values[0] * vector.values[0] + vector.values[1] * vector.values[1] + vector.values[2] * vector.values[2])
    vector.values[0] /= len
    vector.values[1] /= len
    vector.values[2] /= len
    return vector
}

func add(v1: Vector, v2: Vector): Vector {
    Vector(v1.values[0] + v2.values[0], v1.values[1] + v2.values[1], v1.values[2] + v2.values[2])
}

func sub(v1: Vector, v2: Vector): Vector {
    Vector(v1.values[0] - v2.values[0], v1.values[1] - v2.values[1], v1.values[2] - v2.values[2])
}

func scalev(v1: Vector, v2: Vector): Vector {
    Vector(v1.values[0] * v2.values[0], v1.values[1] * v2.values[1], v1.values[2] * v2.values[2])
}

func dot(v1: Vector, v2: Vector): Float64 {
    v1.values[0] * v2.values[0] + v1.values[1] * v2.values[1] + v1.values[2] * v2.values[2]
}

func scale(v: Vector,scale: Float64): Vector{
    Vector(v.values[0] * scale, v.values[1] * scale, v.values[2] * scale)
}

func cross(v1: Vector, v2: Vector): Vector {
    Vector(v1.values[1] * v2.values[2] - v1.values[2] * v2.values[1],
           v1.values[2] * v2.values[0] - v1.values[0] * v2.values[2],
           v1.values[0] * v2.values[1] - v1.values[1] * v2.values[0])
    
}

func normalise(v: Vector): Vector{
    let len = lengthVector(v)
    return Vector(v.values[0] / len, v.values[1] / len, v.values[2] / len)
}

func transformMatrix(matrix: Array<Float64>,v: Vector): Vector {
    let vals = matrix
    let x  = vals[0] * v.values[0] + vals[1] * v.values[1] + vals[2] * v.values[2] + vals[3]
    let y  = vals[4] * v.values[0] + vals[5] * v.values[1] + vals[6] * v.values[2] + vals[7]
    let z  = vals[8] * v.values[0] + vals[9] * v.values[1] + vals[10] * v.values[2] + vals[11]
    return Vector(x, y, z)
}

func invertMatrix(matrix: Array<Float64>): Array<Float64> {
    var temp = Array<Float64>(16, repeat:0.0)
    let tx = -matrix[3]
    let ty = -matrix[7]
    let tz = -matrix[11]
    for (h in 0..3) {
        for (v in 0..3) {
            temp[h + v * 4] = matrix[v + h * 4]
        }
    }
    for (i in 0..11) {
        matrix[i] = temp[i]
    }
    matrix[3] = tx * matrix[0] + ty * matrix[1] + tz * matrix[2]
    matrix[7] = tx * matrix[4] + ty * matrix[5] + tz * matrix[6]
    matrix[11] = tx * matrix[8] + ty * matrix[9] + tz * matrix[10]
    return matrix
}

type ShaderCallback = (triangle: Triangle, v1: Vector, v2: Vector) -> Vector

/// 三角形
class Triangle {
    
    var axis: Int
    
    var normal: Vector
    
    var nu: Float64
    
    var nv: Float64
    
    var nd: Float64
    
    var eu: Float64
    
    var ev: Float64
    
    var nu1: Float64
    
    var nv1: Float64
    
    var nu2: Float64
    
    var nv2: Float64
    
    var material: Vector
    
    var shader: ?ShaderCallback = Option<ShaderCallback>.None
    
    init(p1: Vector, p2: Vector, p3: Vector) {
        let edge1 = sub(p3, p1)
        let edge2 = sub(p2, p1)
        let normal = cross(edge1, edge2)
        if (abs(normal.values[0]) > abs(normal.values[1])) {
            if (abs(normal.values[0]) > abs(normal.values[2])) {
                axis = 0
            }
            else {
                axis = 2
            }
        } else {
            if (abs(normal.values[1]) > abs(normal.values[2])) {
                axis = 1
            }
            else {
                axis = 2
            }
        }
        let u = (axis + 1) % 3
        let v = (axis + 2) % 3
        let u1 = edge1.values[u]
        let v1 = edge1.values[v]
        let u2 = edge2.values[u]
        let v2 = edge2.values[v]
        this.normal = normalise(normal)
        nu = normal.values[u] / normal.values[axis]
        nv = normal.values[v] / normal.values[axis]
        nd = dot(normal, p1) / normal.values[axis]
        let det = u1 * v2 - v1 * u2
        eu = p1.values[u]
        ev = p1.values[v]
        nu1 = u1 / det
        nv1 = -v1 / det
        nu2 = v2 / det
        nv2 = -u2 / det
        material = Vector(0.7, 0.7, 0.7)
    }
    
    func intersect(orig: Vector, dir: Vector, near: ?Float64, far: ?Float64): ?Float64 {
        let u = (axis + 1) % 3
        let v = (axis + 2) % 3
        let d = dir.values[axis] + nu * dir.values[u] + nv * dir.values[v]
        let t = (nd - orig.values[axis] - nu * orig.values[u] - nv * orig.values[v]) / d
        if (near.isSome() && far.isSome()) {
            if (t < near.getOrThrow() || t > far.getOrThrow()) {
                return Option<Float64>.None
            }
        }
        let Pu = orig.values[u] + t * dir.values[u] - eu
        let Pv = orig.values[v] + t * dir.values[v] - ev
        let a2 = Pv * nu1 + Pu * nv1
        if (a2 < 0.0) {
            return Option<Float64>.None
        }
        let a3 = Pu * nu2 + Pv * nv2
        if (a3 < 0.0) {
            return Option<Float64>.None
        }
        if ((a2 + a3) > 1.0) {
            return Option<Float64>.None
        }
        return t
    }
    
}


/// 场景
class Scene {
    
    var triangles: ArrayList<Triangle>
    
    var lights: Array<Vector>
    
    var ambient: Vector
    
    var background: Vector
    
    init(a_triangles: ArrayList<Triangle>) {
        triangles = a_triangles
        lights = [Vector.zero(), Vector.zero(), Vector.zero()]
        ambient = Vector.zero()
        background = Vector(0.8,0.8,1.0)
    }
    
    func intersect(origin: Vector, dir: Vector, near: ?Float64, far: ?Float64): Vector {
        var closest: ?Triangle = Option<Triangle>.None
        var rfar = far
        for (i in 0..triangles.size) {
            let triangle = triangles[i]
            let d = triangle.intersect(origin, dir, near, rfar)
            if (d.isNone()) {
                continue
            }
            rfar = d
            closest = triangle
        }
        if (closest.isNone() || rfar.isNone()) {
            return Vector(background.values[0],background.values[1],background.values[2])
        }
        var normal = closest.getOrThrow().normal
        let hit = add(origin, scale(dir, rfar.getOrThrow()))
        if (dot(dir, normal) > 0.0) {
            normal = Vector(-normal.values[0], -normal.values[1], -normal.values[2])
        }
        
        var colour: Vector
        if (closest.getOrThrow().shader.isSome()) {
            colour = closest.getOrThrow().shader.getOrThrow()(closest.getOrThrow(), hit, dir)
        } else {
            colour = closest.getOrThrow().material
        }
        
        var reflected: ?Vector = Option<Vector>.None
        if (colour.reflection.isSome()) {
            if (colour.reflection.getOrThrow() > 0.001) {
                let reflection = addVector(scale(normal, -2.0 * dot(dir, normal)), dir)
                reflected = intersect(hit, reflection, 0.0001, 1000000.0)
                if (colour.reflection.getOrThrow() >= 0.999999) {
                    return reflected.getOrThrow()
                }
            }
        }
        
        var l = Vector(ambient.values[0], ambient.values[1], ambient.values[2])
        for (i in 0..lights.size) {
            let light = lights[i]
            let toLight = sub(light, hit)
            var distance = lengthVector(toLight)
            _ = scaleVector(toLight, 1.0/distance)
            distance -= 0.0001
            if (blocked(hit, toLight, distance)) {
                continue
            }
            let nl = dot(normal, toLight)
            if (nl > 0.0) {
                _ = addVector(l, scale(light.colour.getOrThrow(), nl))
            }
        }
        l = scalev(l, colour)
        if(reflected.isSome()) {
            l = addVector(scaleVector(l, 1.0 - colour.reflection.getOrThrow()), scaleVector(reflected.getOrThrow(), colour.reflection.getOrThrow()))
        }
        return l
    }
    
    func blocked(O: Vector, D: Vector, far: Float64): Bool{
        let near: Float64 = 0.0001
        for (i in 0..triangles.size) {
            let triangle = triangles[i]
            let d = triangle.intersect(O, D, near, far)
            if (d.isSome()) {
                if (d.getOrThrow() > far || d.getOrThrow() < near) {
                    continue
                }
            } else {
                continue
            }
            return true
        }
        return false
    }
    
}

/// 光线
class Ray {
    
    var origin: Vector

    var dir: Vector
    
    init(origin: Vector, dir: Vector) {
        this.origin = origin
        this.dir = dir
    }
    
    static func zero(): Ray {
        return Ray(Vector.zero(), Vector.zero())
    }
    
}

/// 相机
class Camera {
    
    var directions: Array<Vector>
    
    var origin: Vector
    
    var rays: Array<Ray>
    
    init(origin: Vector, lookat: Vector, up: Vector) {
        let zaxis = normaliseVector(subVector(lookat, origin))
        let xaxis = normaliseVector(cross(up, zaxis))
        let yaxis = normaliseVector(cross(xaxis, subVector(Vector(0.0,0.0,0.0), zaxis)))
        var m = Array<Float64>(16, repeat:0.0)
        m[0] = xaxis.values[0]
        m[1] = xaxis.values[1]
        m[2] = xaxis.values[2]
        m[4] = yaxis.values[0]
        m[5] = yaxis.values[1]
        m[6] = yaxis.values[2]
        m[8] = zaxis.values[0]
        m[9] = zaxis.values[1]
        m[10] = zaxis.values[2]
        _ = invertMatrix(m)
        m[3] = 0.0
        m[7] = 0.0
        m[11] = 0.0
        this.origin = origin
        directions = Array(4, repeat: Vector.zero())
        directions[0] = normalise(Vector(-0.7,  0.7, 1.0))
        directions[1] = normalise(Vector( 0.7,  0.7, 1.0))
        directions[2] = normalise(Vector( 0.7, -0.7, 1.0))
        directions[3] = normalise(Vector(-0.7, -0.7, 1.0))
        directions[0] = transformMatrix(m, directions[0])
        directions[1] = transformMatrix(m, directions[1])
        directions[2] = transformMatrix(m, directions[2])
        directions[3] = transformMatrix(m, directions[3])
        rays = Array<Ray>()
    }
    
    /// 生成光线
    func generateRayPair(y: Float64): Array<Ray>{
        let dir1 = addVector(scale(directions[0], y), scale(directions[3], 1.0-y))
        let ray1 = Ray(origin, dir1)
        let dir2 = addVector(scale(directions[1], y), scale(directions[2], 1.0-y))
        let ray2 = Ray(origin, dir2)
        rays = [ray1, ray2]
        return rays
    }
    
    func render(scene: Scene, pixels: Array<Array<Vector>>, width: Int, height: Int) {
        renderRows(this, scene, pixels, width, height, 0, height)
    }
    
}

func renderRows(camera: Camera, scene: Scene, pixels: Array<Array<Vector>>, width: Int, height: Int, starty: Int, stopy: Int) {
    var pointNum = 1
    for (y in starty..stopy) {
        let rays = camera.generateRayPair(Float64(y / height))
        for (x in 0..width) {
            let xp = Float64(x / width)
            let origin = addVector(scale(rays[0].origin, xp), scale(rays[1].origin, 1.0 - xp))
            let dir = normaliseVector(addVector(scale(rays[0].dir, xp), scale(rays[1].dir, 1.0 - xp)))
            let l = scene.intersect(origin, dir, Option<Float64>.None, Option<Float64>.None)
            pixels[y][x] = l
            if (DEBUG) {
                println("point ${pointNum}: ${l.description()}")
                pointNum += 1
            }
        }
    }
}



/// 构建场景
func raytraceScene(): Array<Array<Vector>>
{
    /// 创建矢量，通过矢量构建三角形
    let tfl = createVector(-10.0,  10.0, -10.0)
    let tfr = createVector( 10.0,  10.0, -10.0)
    let tbl = createVector(-10.0,  10.0,  10.0)
    let tbr = createVector( 10.0,  10.0,  10.0)
    let bfl = createVector(-10.0, -10.0, -10.0)
    let bfr = createVector( 10.0, -10.0, -10.0)
    let bbl = createVector(-10.0, -10.0,  10.0)
    let bbr = createVector( 10.0, -10.0,  10.0)
    var triangles = ArrayList<Triangle>([
        Triangle(tfl, tfr, bfr),
        Triangle(tfl, bfr, bfl),
        Triangle(tbl, tbr, bbr),
        Triangle(tbl, bbr, bbl),
        Triangle(tbl, tfl, bbl),
        Triangle(tfl, bfl, bbl),
        Triangle(tbr, tfr, bbr),
        Triangle(tfr, bfr, bbr),
        Triangle(tbl, tbr, tfr),
        Triangle(tbl, tfr, tfl),
        Triangle(bbl, bbr, bfr),
        Triangle(bbl, bfr, bfl)
    ])
    let floorShader =  { tri: Triangle, pos: Vector, view: Vector =>
        let green = createVector(0.0, 0.4, 0.0)
        let grey = createVector(0.4, 0.4, 0.4)
        grey.reflection = 1.0
        let x = (Int64(pos.values[0] / 32.0)%2 + 2)%2
        let z = (Int64(pos.values[2] / 32.0 + 0.3)%2 + 2)%2
        if ((x < 1) != (z < 1)) {
            return grey
        } else {
            return green
        }
    }
    let ffl = createVector(-1000.0, -30.0, -1000.0)
    let ffr = createVector( 1000.0, -30.0, -1000.0)
    let fbl = createVector(-1000.0, -30.0,  1000.0)
    let fbr = createVector( 1000.0, -30.0,  1000.0)
    let tr13 = Triangle(fbl, fbr, ffr)
    tr13.shader = floorShader
    triangles.add(tr13)
    let tr14 = Triangle(fbl, ffr, ffl)
    tr14.shader = floorShader
    triangles.add(tr14)
    /// 通过三角形数组构建场景
    let _scene = Scene(triangles)
  /// 设置场景灯光1
    _scene.lights[0] = createVector(20.0, 38.0, -22.0)
    _scene.lights[0].colour = createVector(0.7, 0.3, 0.3)
  /// 设置场景灯光2
    _scene.lights[1] = createVector(-23.0, 40.0, 17.0)
    _scene.lights[1].colour = createVector(0.7, 0.3, 0.3)
  /// 设置场景灯光3
    _scene.lights[2] = createVector(23.0, 20.0, 17.0)
    _scene.lights[2].colour = createVector(0.7, 0.7, 0.7)
    /// 设置背景
    _scene.ambient = createVector(0.1, 0.1, 0.1)
    let size = 30
    /// 初始化像素数组
    var pixels: Array<Array<Vector>> = Array(size, { i => Array(size, repeat:Vector.zero())})
    /// 初始化相机
    let _camera = Camera(createVector(-40.0, 40.0, 40.0), createVector(0.0, 0.0, 0.0), createVector(0.0, 1.0, 0.0))
    /// 执行3d-raytrace算法，生成像素数组
    _camera.render(_scene, pixels, size, size)
    return pixels
}

/// 使用像素数组生成绘制图像的js脚本字符串
func arrayToCanvasCommands(pixels: Array<Array<Vector>>): String
{
    var str = StringBuilder("<canvas id=\"renderCanvas\" width=\"30px\" height=\"30px\"></canvas><script>\nvar pixels = [")
    let size = 30
    for  (y in 0..size) {
        str.append("[")
        for (x in 0..size) {
            str.append("[")
            str.append(pixels[y][x].scriptString())
            str.append("],")
        }
        str.append("],")
    }
    str.append("""
]    var canva = document.getElementById("renderCanvas").getContext("2d")
    
    
    var size = 30
    canva.fillStyle = "red"
    canva.fillRect(0, 0, size, size)
    canva.scale(1, -1)
    canva.translate(0, -size)
    
    if (!canva.setFillColor)
        canva.setFillColor = function(r, g, b, a) {
        this.fillStyle = "rgb("+[Math.floor(r * 255), Math.floor(g * 255), Math.floor(b * 255)]+")"
    }
    
    for (var y = 0 y < size y++) {
        for (var x = 0 x < size x++) {
            var l = pixels[y][x]
            canva.setFillColor(l[0], l[1], l[2], 1)
            canva.fillRect(x, y, 1, 1)
        }
    }</script>
""")
    return str.toString()
}

/*
 * @State
 * @Tags Jetstream2
 */
class RayTraceBranchMark {
    
    var runCount = 80 
  /*
   * @Benchmark
   */
    func run() {
        let startTime = Timer().getTime()
        for (_ in 0..runCount) {
            let result = arrayToCanvasCommands(raytraceScene())
            if (DEBUG && showRenderJs) {
                println(result)
            }
        }
        let endTime = Timer().getTime()
        println("3d-raytrace: ms = ${Float64((endTime-startTime).toNanoseconds())/1000000.0}")
    }
    
}

class Timer {
    // ms
    public func getTime() {
        let time = DateTime.now()
        return time
    }
}

main() {
    RayTraceBranchMark().run()
}
