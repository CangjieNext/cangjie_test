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
import std.math.*

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

let timer = Timer()

func createVector(x: Float64, y: Float64, z: Float64): Array<Float64> {
    return [x, y, z]
}

func lengthVector(arr: Array<Float64>): Float64 {
    return sqrt(arr[0] * arr[0] + arr[1] * arr[1] + arr[2] * arr[2])
}

func addVector(arr: Array<Float64>,v: Array<Float64>): Array<Float64> {
    arr[0] +=v[0]
    arr[1] +=v[1]
    arr[2] +=v[2]
    return arr
}

func subVector(arr: Array<Float64>,v: Array<Float64>): Array<Float64> {
    arr[0] -=v[0]
    arr[1] -=v[1]
    arr[2] -=v[2]
    return arr
}

func scaleVector(arr: Array<Float64>, scale: Float64): Array<Float64> {
    arr[0] *= scale
    arr[1] *= scale
    arr[2] *= scale
    return arr
}

func normaliseVector(arr: Array<Float64>): Array<Float64> {
    let len = sqrt(arr[0] * arr[0] + arr[1] * arr[1] + arr[2] * arr[2])
    arr[0] /= len
    arr[1] /= len
    arr[2] /= len
    return arr
}

func add(v1: Array<Float64>, v2: Array<Float64>): Array<Float64> {
    return [v1[0] +v2[0],v1[1] +v2[1],v1[2] +v2[2]]
}

func sub(v1: Array<Float64>, v2: Array<Float64>): Array<Float64> {
    return [v1[0] -v2[0],v1[1] -v2[1],v1[2] -v2[2]]
}

func scalev(v1: Array<Float64>, v2: Array<Float64>): Array<Float64> {
    return [v1[0] *v2[0],v1[1] *v2[1],v1[2] *v2[2]]
}

func dot(v1: Array<Float64>, v2: Array<Float64>): Float64 {
    return v1[0] *v2[0] +v1[1] *v2[1] +v1[2] *v2[2]
}

func scale(v: Array<Float64>,  scale: Float64): Array<Float64> {
    return [v[0] * scale,v[1] * scale,v[2] * scale]
}

func cross(v1: Array<Float64>, v2: Array<Float64>): Array<Float64> {
    return [v1[1] *v2[2] -v1[2] *v2[1],
           v1[2] *v2[0] -v1[0] *v2[2],
           v1[0] *v2[1] -v1[1] *v2[0]]
}

func normalise(v: Array<Float64>): Array<Float64> {
    let len = lengthVector(v)
    return [v[0] / len, v[1] / len, v[2] / len]
}

func transformMatrix(arr: Array<Float64>,  v: Array<Float64>): Array<Float64> {
    let vals = arr
    let x = vals[0] * v[0] + vals[1] * v[1] + vals[2] * v[2] + vals[3]
    let y = vals[4] * v[0] + vals[5] * v[1] + vals[6] * v[2] + vals[7]
    let z = vals[8] * v[0] + vals[9] * v[1] + vals[10] * v[2] + vals[11]
    return [x, y, z]
}

func invertMatrix(input: Array<Float64>): Array<Float64> {
    var temp = Array(16, repeat: 0.0)
    let tx = -input[3]
    let ty = -input[7]
    let tz = -input[11]

    for (h in 0..3) {
        for (v in 0..3) {
            temp[h + v * 4] = input[v + h * 4]
        }
    }

    for (i in 0..11) {
        input[i] = temp[i]
    }

    input[3] = tx * input[0] + ty * input[1] + tz * input[2]
    input[7] = tx * input[4] + ty * input[5] + tz * input[6]
    input[11] = tx * input[8] + ty * input[9] + tz * input[10]

    return input
}

class TriangleClass {
    var axis: Int64 = 0
    var normal: Array<Float64> = []
    var nu: Float64 = 0.0
    var nv: Float64 = 0.0
    var nd: Float64 = 0.0
    var eu: Float64 = 0.0
    var ev: Float64 = 0.0
    var nu1: Float64 = 0.0
    var nv1: Float64 = 0.0
    var nu2: Float64 = 0.0
    var nv2: Float64 = 0.0
    var material: Array<Float64> = []
    var shader: (Array<Float64>) -> Array<Float64> = { pos =>
        let x = (Int64(pos[0]/32.0) % 2 + 2) % 2
        let z = (Int64(pos[2]/32.0 + 0.3) % 2 + 2) % 2
        if ((x < 1) != (z < 1)) {
            return createVector(0.4, 0.4, 0.4)
        } else {
            return createVector(0.0, 0.4, 0.0)
        }
    }

    var isEmpty: Bool = false
    var hasShader: Bool = false
    init(p1: Array<Float64>, p2: Array<Float64>, p3: Array<Float64>, isEmpty!: Bool = false) {
        this.isEmpty = isEmpty
        let edge1 = sub(p3, p1)
        let edge2 = sub(p2, p1)
        let normal = cross(edge1, edge2)
        if (abs(normal[0]) > abs(normal[1])) {
            if (abs(normal[0]) > abs(normal[2])) {
                this.axis = 0
            } else {
                this.axis = 2
            }
        } else {
            if (abs(normal[1]) > abs(normal[2])) {
                this.axis = 1
            } else {
                this.axis = 2
            }
        }
        let u = (this.axis + 1) % 3
        let v = (this.axis + 2) % 3
        let u1 = edge1[u]
        let v1 = edge1[v]

        let u2 = edge2[u]
        let v2 = edge2[v]
        this.normal = normalise(normal)
        this.nu = this.normal[u] / this.normal[this.axis]
        this.nv = this.normal[v] / this.normal[this.axis]
        this.nd = dot(this.normal, p1) / this.normal[this.axis]
        let det = u1 * v2 - v1 * u2
        this.eu = p1[u]
        this.ev = p1[v]
        this.nu1 = u1 / det
        this.nv1 = -v1 / det
        this.nu2 = v2 / det
        this.nv2 = -u2 / det
        this.material = [0.7, 0.7, 0.7]
    }
    func intersect(origin: Array<Float64>, dir: Array<Float64>, near: Float64, far: Float64): Float64 {
        let u = (this.axis + 1) % 3
        let v = (this.axis + 2) % 3
        let d = dir[this.axis] + this.nu * dir[u] + this.nv * dir[v]
        let t = (this.nd - origin[this.axis] - this.nu * origin[u] - this.nv * origin[v]) / d
        if (t < near || t > far) {
            return 0.0
        }
        let Pu = origin[u] + t * dir[u] - this.eu
        let Pv = origin[v] + t * dir[v] - this.ev
        let a2 = Pv * this.nu1 + Pu * this.nv1
        if (a2 < 0.0) {
            return 0.0
        }
        let a3 = Pu * this.nu2 + Pv * this.nv2
        if (a3 < 0.0) {
            return 0.0
        }
        if ((a2 + a3) > 1.0) {
            return 0.0
        }
        return t
    }
}

class LightsClass {
    var arr: Array<Float64> = []
    var colour: Array<Float64> = []
    init() {}
}

var closest = TriangleClass([0.0,0.0,0.0], [0.0,0.0,0.0], [0.0,0.0,0.0], isEmpty:true)
class SceneClass {
    var triangles: Array<TriangleClass>
    var lights: Array<LightsClass> = Array(3, repeat: LightsClass())
    var ambient: Array<Float64> = [0.0, 0.0, 0.0]
    var background: Array<Float64> = [0.8, 0.8, 1.0]

    init(triangles: Array<TriangleClass>) {
        this.triangles = triangles
    }

    func intersect(origin: Array<Float64>, dir: Array<Float64>, near: Float64, far: Float64): Array<Float64> {
        var farTmp = far


        for (i in 0..triangles.size) {
            let triangle = triangles[i]
            var d: Float64 = triangle.intersect(origin, dir, near, farTmp)

            if (d == 0.0 || d > farTmp || d < near) {
                continue
            }
            farTmp = d
            closest = triangle
        }

        if (closest.isEmpty) {
            return [background[0], background[1], background[2]]
        }

        var normal = closest.normal
        var hit = add(origin, scale(dir, farTmp))
        if (dot(dir, normal) > 0.0) {
            normal = [-normal[0], -normal[1], -normal[2]]
        }

        var colour: Array<Float64> = [];
        if (closest.hasShader) {
            colour = closest.shader(hit);
        } else {
           colour = closest.material;
        }

        var l = [this.ambient[0], this.ambient[1], this.ambient[2]]
        for (i in 0..lights.size) {
            let light = lights[i]
            var toLight = sub(light.arr, hit)
            var distance = lengthVector(toLight)
            scaleVector(toLight, 1.0/distance)
            distance -= 0.0001

            if (blocked(hit, toLight, distance)) {
                continue
            }
            let nl = dot(normal, toLight)
            if (nl > 0.0) {
                addVector(l, scaleVector(light.colour, nl))
            }
        }

        l = scalev(l, colour)
        return l
    }

    func blocked(O: Array<Float64>, D: Array<Float64>, far: Float64): Bool {
        let near = 0.0001

        for (i in 0..triangles.size) {
            let triangle = triangles[i]
            let d = triangle.intersect(O, D, near, far)
            if (d == 0.0 || d > far || d < near) {
                continue
            }
            return true
        }
        return false
    }
}

class RayClass {
    var origin: Array<Float64> = []
    var dir: Array<Float64> = []
    init() {}
}

class CameraClass {
    var origin: Array<Float64> = []
    var directions: Array<Array<Float64>> = 
        [
            [0.0, 0.0, 0.0],
            [0.0, 0.0, 0.0],
            [0.0, 0.0, 0.0],
            [0.0, 0.0, 0.0]
        ]

    init(origin: Array<Float64>, lookat: Array<Float64>, up: Array<Float64>) {
        var aaxis = subVector(lookat,origin)
        let zaxis = normaliseVector(aaxis)
        var baxis = cross(up, zaxis)
        let xaxis = normaliseVector(baxis)
        var tmp = [0.0,0.0,0.0]
        var caxis = subVector(tmp, zaxis)
        var daxis = cross(xaxis, caxis)
        let yaxis = normaliseVector(daxis)
        var m = Array(16, repeat: 0.0)
        m[0] = xaxis[0]
        m[1] = xaxis[1]
        m[2] = xaxis[2]
        m[4] = yaxis[0]
        m[5] = yaxis[1]
        m[6] = yaxis[2]
        m[8] = zaxis[0]
        m[9] = zaxis[1]
        m[10] = zaxis[2]
        invertMatrix(m)
        m[3] = 0.0
        m[7] = 0.0
        m[11] = 0.0
        this.origin = origin
        this.directions[0] = normalise([-0.7, 0.7, 1.0])
        this.directions[1] = normalise([0.7, 0.7, 1.0])
        this.directions[2] = normalise([0.7, -0.7, 1.0])
        this.directions[3] = normalise([-0.7, -0.7, 1.0])
        this.directions[0] = transformMatrix(m, this.directions[0])
        this.directions[1] = transformMatrix(m, this.directions[1])
        this.directions[2] = transformMatrix(m, this.directions[2])
        this.directions[3] = transformMatrix(m, this.directions[3])
    }

    func generateRayPair(y: Float64): Array<RayClass> {
        var rays: Array<RayClass> = Array(2, repeat: RayClass())
        rays[0].origin = this.origin
        rays[1].origin = this.origin
        var tmp1 : Array<Float64> = scale(this.directions[0], y)
        var tmp2 : Array<Float64> = scale(this.directions[3], 1.0-y)
        rays[0].dir = addVector(tmp1, tmp2)
        var tmp3 : Array<Float64> = scale(this.directions[1], y)
        var tmp4 : Array<Float64> = scale(this.directions[2], 1.0-y)
        rays[1].dir = addVector(tmp3, tmp4)
        return rays
    }

    func render(scene: SceneClass, pixels: Array<Array<Array<Float64>>>, width: Int64, height: Int64) {
        let cam = this
        renderRows(cam, scene, pixels, width, height, 0, height)
    }
}

func renderRows(camera: CameraClass, scene: SceneClass, pixels: Array<Array<Array<Float64>>>, width: Int64, height: Int64, starty: Int64, stopy: Int64) {
    for (y in starty..stopy) {
        let rays = camera.generateRayPair(Float64(y) / Float64(height))
        for (x in 0..width) {
            let xp = Float64(x) / Float64(width)
            var tmp1 : Array<Float64> = scale(rays[0].origin, xp)
            var tmp2 : Array<Float64> = scale(rays[1].origin, 1.0 - xp)
            let origin: Array<Float64> = addVector(tmp1, tmp2)
            var tmp3 : Array<Float64> = scale(rays[0].dir, xp)
            var tmp4 : Array<Float64> = scale(rays[1].dir, 1.0 - xp)
            var tmp5 : Array<Float64> = addVector(tmp3, tmp4)
            var dir = normaliseVector(tmp5)
            let l = scene.intersect(origin, dir, 0.0, 0.0)
            pixels[y][x] = l
        }
    }
}

func raytraceScene(): Array<Array<Array<Float64>>> {
    var triangles: Array<TriangleClass> = Array(14, repeat: TriangleClass(createVector(0.0, 0.0, 0.0), createVector(0.0, 0.0, 0.0), createVector(0.0, 0.0, 0.0)))
    let tfl = createVector(-10.0, 10.0, -10.0)
    let tfr = createVector(10.0, 10.0, -10.0)
    let tbl = createVector(-10.0, 10.0, 10.0)
    let tbr = createVector(10.0, 10.0, 10.0)
    let bfl = createVector(-10.0, -10.0, -10.0)
    let bfr = createVector(10.0, -10.0, -10.0)
    let bbl = createVector(-10.0, -10.0, 10.0)
    let bbr = createVector(10.0, -10.0, 10.0)

    triangles[0] = TriangleClass(tfl, tfr, bfr)
    triangles[1] = TriangleClass(tfl, bfr, bfl)

    triangles[2] = TriangleClass(tbl, tbr, bbr)
    triangles[3] = TriangleClass(tbl, bbr, bbl)

    triangles[4] = TriangleClass(tbl, tfl, bbl)
    triangles[5] = TriangleClass(tfl, bfl, bbl)

    triangles[6] = TriangleClass(tbr, tfr, bbr)
    triangles[7] = TriangleClass(tfr, bfr, bbr)

    triangles[8] = TriangleClass(tbl, tbr, tfr)
    triangles[9] = TriangleClass(tbl, tfr, tfl)

    triangles[10] = TriangleClass(bbl, bbr, bfr)
    triangles[11] = TriangleClass(bbl, bfr, bfl)

    let ffl = createVector(-1000.0, -30.0, -1000.0)
    let ffr = createVector(1000.0, -30.0, -1000.0)
    let fbl = createVector(-1000.0, -30.0, 1000.0)
    let fbr = createVector(1000.0, -30.0, 1000.0)
    triangles[12] = TriangleClass(fbl, fbr, ffr)
    triangles[12].hasShader = true
    triangles[13] = TriangleClass(fbl, ffr, ffl)
    triangles[13].hasShader = true

    var scene = SceneClass(triangles)
    scene.lights[0] = LightsClass()
    scene.lights[0].arr = createVector(20.0, 38.0, -22.0)
    scene.lights[0].colour = createVector(0.7, 0.3, 0.3)
    scene.lights[1] = LightsClass()
    scene.lights[1].arr = createVector(-23.0, 40.0, 17.0)
    scene.lights[1].colour = createVector(0.7, 0.3, 0.3)
    scene.lights[2] = LightsClass()
    scene.lights[2].arr = createVector(23.0, 20.0, 17.0)
    scene.lights[2].colour = createVector(0.7, 0.7, 0.7)
    scene.ambient = createVector(0.1, 0.1, 0.1)

    let size = 30
    var pixels = Array<Array<Array<Float64>>>(size, { i => Array<Array<Float64>>(size, { i => Array<Float64>(3, repeat: 0.0) })})
    var add1 : Array<Float64> = createVector(-40.0, 40.0, 40.0)
    var add2 : Array<Float64> = createVector(0.0, 0.0, 0.0)
    var add3 : Array<Float64> = createVector(0.0, 1.0, 0.0)
    var camera = CameraClass(add1,
                            add2,
                            add3)
    camera.render(scene, pixels, size, size)
    return pixels
}

func runThreeDRaytrace(): Int64 {
    timer.start()
    raytraceScene()
    let time = timer.stop()
    print("Array Access - RunThreeDRaytrace:\t${Float64(time.toNanoseconds())/1000000.0}\tms\n");
    return Int64(time.toMilliseconds())
}

main() {
    runThreeDRaytrace()
    return 0
}
