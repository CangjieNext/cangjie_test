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

class Object2 {
    var V: Array<Float64> = Array<Float64>()
}

class Object1 {
    var LoopCount: Int64 = 0
    var LoopMax: Int64 = 50
    var TimeMax: Int64 = 0
    var TimeAvg: Int64 = 0
    var TimeMin: Int64 = 0
    var TimeTemp: Int64 = 0
    var TimeTotal: Int64 = 0
    var Init: Bool = false
}

class CreateP {
    var V: Array<Float64> = Array<Float64>()
    init(X: Float64, Y: Float64, Z: Float64) {
        V = [X, Y, Z, 1.0]
    }
}

class Q {
    var VARRAY: Array<CreateP> = Array<CreateP>(9, {x: Int64 => CreateP(0.0, 0.0, 0.0)})
    var Edge: Array<Array<Float64>> = Array<Array<Float64>>()
    var Normal: Array<Array<Float64>> = Array<Array<Float64>>(6, {x: Int64 => Array<Float64>()})
    var Line: Array<Bool> = Array<Bool>()
    var NumPx: Int64 = 0
    var LastPx: Int64 = 0
}

class Cube {
    func DrawLine(From: CreateP, to: CreateP) {
        let x1 = From.V[0]
        let x2 = to.V[0]
        let y1 = From.V[1]
        let y2 = to.V[1]
        let dx = abs(x2 - x1)
        let dy = abs(y2 - y1)
        var x = x1
        var y = y1
        var IncX1: Float64
        var IncY1: Float64
        var IncX2: Float64
        var IncY2: Float64
        var Den: Float64
        var Num: Float64
        var NumAdd: Float64
        var NumPix: Int64

        if (x2 >= x1) {
            IncX1 = 1.0
            IncX2 = 1.0
        } else {
            IncX1 = -1.0
            IncX2 = -1.0
        }

        if (y2 >= y1) {
            IncY1 = 1.0
            IncY2 = 1.0
        } else {
            IncY1 = -1.0
            IncY2 = -1.0
        }

        if (dx >= dy) {
            IncX1 = 0.0
            IncY2 = 0.0
            Den = dx
            Num = dx / 2.0
            NumAdd = dy
            NumPix = Int64(dx)
        } else {
            IncX2 = 0.0
            IncY1 = 0.0
            Den = dy
            Num = dy / 2.0
            NumAdd = dx
            NumPix = Int64(dy)
        }
        NumPix = q.LastPx + NumPix

        for (_ in q.LastPx..NumPix) {
            Num += NumAdd
            if (Num >= Den) {
                x += IncX1
                y += IncY1
            }
            x += IncX2
            y += IncY2
        }
        q.LastPx = NumPix
    }

    func CalcCross(V0: Array<Float64>, V1: Array<Float64>): Array<Float64> {
        var Cross: Array<Float64> = [0.0, 0.0, 0.0, 0.0]
        Cross[0] = V0[1] * V1[2] - V0[2] * V1[1]
        Cross[1] = V0[2] * V1[0] - V0[0] * V1[2]
        Cross[2] = V0[0] * V1[1] - V0[1] * V1[0]
        return Cross
    }

    func CalcNormal(V0: Array<Float64>, V1: Array<Float64>, V2: Array<Float64>): Array<Float64> {
        var A: Array<Float64> = [0.0, 0.0, 0.0, 0.0]
        var B: Array<Float64> = [0.0, 0.0, 0.0, 0.0]
        for (i in 0..3) {
            A[i] = V0[i] - V1[i]
            B[i] = V2[i] - V1[i]
        }

        A = CalcCross(A, B)
        let x = A[0] * A[0] + A[1] * A[1] + A[2] * A[2]
        let Length = sqrt(Float64(x))
        for (i in 0..3) {
            A[i] = A[i] / Float64(Length)
        }
        A[3] = 1.0
        return A
    }

    func MMulti(M1: Array<Array<Float64>>, M2: Array<Array<Float64>>): Array<Array<Float64>> {
        var M: Array<Array<Float64>> = 
            [
                [0.0, 0.0, 0.0, 0.0],
                [0.0, 0.0, 0.0, 0.0],
                [0.0, 0.0, 0.0, 0.0],
                [0.0, 0.0, 0.0, 0.0]
            ]
        for (i in 0..4) {
            for (j in 0..4) {
                M[i][j] = M1[i][0] * M2[0][j] + M1[i][1] * M2[1][j] + M1[i][2] * M2[2][j] + M1[i][3] * M2[3][j]
            }
        }
        return M
    }

    func VMulti(M: Array<Array<Float64>>, V: Array<Float64>): Array<Float64> {
        var Vect: Array<Float64> = [0.0, 0.0, 0.0, 0.0]
        for (i in 0..4) {
            Vect[i] = M[i][0] * V[0] + M[i][1] * V[1] + M[i][2] * V[2] + M[i][3] * V[3]
        }
        return Vect
    }

    func VMulti2(M: Array<Array<Float64>>, V: Array<Float64>): ArrayList<Float64> {
        var Vect: ArrayList<Float64> = ArrayList<Float64>([0.0, 0.0, 0.0, 0.0])
        for (i in 0..4) {
            Vect[i] = M[i][0] * V[0] + M[i][1] * V[1] + M[i][2] * V[2]
        }
        return Vect
    }

    func Translate(M: Array<Array<Float64>>, Dx: Float64, Dy: Float64, Dz: Float64): Array<Array<Float64>> {
        let T: Array<Array<Float64>> = 
            [
                [1.0, 0.0, 0.0, Dx],
                [0.0, 1.0, 0.0, Dy],
                [0.0, 0.0, 1.0, Dz],
                [0.0, 0.0, 0.0, 1.0]
            ]
        return MMulti(T, M)
    }

    func RotateX(M: Array<Array<Float64>>, Phi: Float64): Array<Array<Float64>> {
        var a = Float64(Phi)
        a *= Float64.GetPI() / 180.0
        let Cos = cos(a)
        let Sin = sin(a)
        let R: Array<Array<Float64>> = 
            [
                [1.0, 0.0, 0.0, 0.0],
                [0.0, Cos, -Sin, 0.0],
                [0.0, Sin, Cos, 0.0],
                [0.0, 0.0, 0.0, 1.0]
            ]
        return MMulti(R, M)
    }

    func RotateY(M: Array<Array<Float64>>, Phi: Float64): Array<Array<Float64>> {
        var a = Phi
        a *= Float64.GetPI() / 180.0
        let Cos = cos(a)
        let Sin = sin(a)
        let R: Array<Array<Float64>> = 
            [
                [Cos, 0.0, Sin, 0.0],
                [0.0, 1.0, 0.0, 0.0],
                [-Sin, 0.0, Cos, 0.0],
                [0.0, 0.0, 0.0, 1.0]
            ]
        return MMulti(R, M)
    }

    func RotateZ(M: Array<Array<Float64>>, Phi: Float64): Array<Array<Float64>> {
        var a = Phi
        a *= Float64.GetPI() / 180.0
        let Cos = cos(a)
        let Sin = sin(a)
        let R: Array<Array<Float64>> = 
            [
                [Cos, -Sin, 0.0, 0.0],
                [Sin, Cos, 0.0, 0.0],
                [0.0, 0.0, 1.0, 0.0],
                [0.0, 0.0, 0.0, 1.0]
            ]
        return MMulti(R, M)
    }

    func DrawQube() {
        var CurN = ArrayList<ArrayList<Float64>>()
        q.LastPx = 0
        var i = 5
        while (i >= 0) {
            CurN.add(VMulti2(MQube, q.Normal[i]))
            i -= 1
        }

        if (CurN[0][2] < 0.0) {
            if (!q.Line[0]) {
                DrawLine(q.VARRAY[0], q.VARRAY[1])
                q.Line[0] = true
            }
            if (!q.Line[1]) {
                DrawLine(q.VARRAY[1], q.VARRAY[2])
                q.Line[1] = true
            }
            if (!q.Line[2]) {
                DrawLine(q.VARRAY[2], q.VARRAY[3])
                q.Line[2] = true
            }
            if (!q.Line[3]) {
                DrawLine(q.VARRAY[3], q.VARRAY[0])
                q.Line[3] = true
            }
        }
        if (CurN[1][2] < 0.0) {
            if (!q.Line[2]) {
                DrawLine(q.VARRAY[3], q.VARRAY[2])
                q.Line[2] = true
            }
            if (!q.Line[9]) {
                DrawLine(q.VARRAY[2], q.VARRAY[6])
                q.Line[9] = true
            }
            if (!q.Line[6]) {
                DrawLine(q.VARRAY[6], q.VARRAY[7])
                q.Line[6] = true
            }
            if (!q.Line[10]) {
                DrawLine(q.VARRAY[7], q.VARRAY[3])
                q.Line[10] = true
            }
        }
        if (CurN[2][2] < 0.0) {
            if (!q.Line[4]) {
                DrawLine(q.VARRAY[4], q.VARRAY[5])
                q.Line[4] = true
            }
            if (!q.Line[5]) {
                DrawLine(q.VARRAY[5], q.VARRAY[6])
                q.Line[5] = true
            }
            if (!q.Line[6]) {
                DrawLine(q.VARRAY[6], q.VARRAY[7])
                q.Line[6] = true
            }
            if (!q.Line[7]) {
                DrawLine(q.VARRAY[7], q.VARRAY[4])
                q.Line[7] = true
            }
        }
        if (CurN[3][2] < 0.0) {
            if (!q.Line[4]) {
                DrawLine(q.VARRAY[4], q.VARRAY[5])
                q.Line[4] = true
            }
            if (!q.Line[8]) {
                DrawLine(q.VARRAY[5], q.VARRAY[1])
                q.Line[8] = true
            }
            if (!q.Line[0]) {
                DrawLine(q.VARRAY[1], q.VARRAY[0])
                q.Line[0] = true
            }
            if (!q.Line[11]) {
                DrawLine(q.VARRAY[0], q.VARRAY[4])
                q.Line[11] = true
            }
        }
        if (CurN[4][2] < 0.0) {
            if (!q.Line[11]) {
                DrawLine(q.VARRAY[4], q.VARRAY[0])
                q.Line[11] = true
            }
            if (!q.Line[3]) {
                DrawLine(q.VARRAY[0], q.VARRAY[3])
                q.Line[3] = true
            }
            if (!q.Line[10]) {
                DrawLine(q.VARRAY[3], q.VARRAY[7])
                q.Line[10] = true
            }
            if (!q.Line[7]) {
                DrawLine(q.VARRAY[7], q.VARRAY[4])
                q.Line[7] = true
            }
        }
        if (CurN[5][2] < 0.0) {
            if (!q.Line[8]) {
                DrawLine(q.VARRAY[1], q.VARRAY[5])
                q.Line[8] = true
            }
            if (!q.Line[5]) {
                DrawLine(q.VARRAY[5], q.VARRAY[6])
                q.Line[5] = true
            }
            if (!q.Line[9]) {
                DrawLine(q.VARRAY[6], q.VARRAY[2])
                q.Line[9] = true
            }
            if (!q.Line[1]) {
                DrawLine(q.VARRAY[2], q.VARRAY[1])
                q.Line[1] = true
            }
        }
        q.Line = [false, false, false, false, false, false, false, false, false, false, false, false]
        q.LastPx = 0
    }

    func Loop(): Unit {
        if (Testing.LoopCount > Testing.LoopMax) {
            return
        }
        var TestingStr = Testing.LoopCount.toString()
        while (TestingStr.size < 3) {
            TestingStr = "0${TestingStr}"
        }
        MTrans = Translate(I, -q.VARRAY[8].V[0], -q.VARRAY[8].V[1], -q.VARRAY[8].V[2])
        MTrans = RotateX(MTrans, 1.0)
        MTrans = RotateY(MTrans, 3.0)
        MTrans = RotateZ(MTrans, 5.0)
        MTrans = Translate(MTrans, q.VARRAY[8].V[0], q.VARRAY[8].V[1], q.VARRAY[8].V[2])
        MQube = MMulti(MTrans, MQube)
        var i = 8
        while (i >= 0) {
            q.VARRAY[i].V = VMulti(MTrans, q.VARRAY[i].V)
            i -= 1
        }
        DrawQube()
        Testing.LoopCount += 1
        Loop()
    }

    var q = Q()
    // transformation matrix
    var MTrans: Array<Array<Float64>> = Array<Array<Float64>>()
    // position information of qube
    var MQube: Array<Array<Float64>> = Array<Array<Float64>>()
    // entity matrix
    var I: Array<Array<Float64>> = Array<Array<Float64>>()
    var Origin = Object2()
    var Testing = Object1()

    var validation: HashMap<Int64, Float64> = HashMap<Int64, Float64>(
        [
            (20, 2889.0000000000045),
            (40, 2889.0000000000055),
            (80, 2889.000000000005),
            (160, 2889.0000000000055)
        ]
    )

    func creat(CubeSize: Float64) {
        // init/reset vars
        Origin.V = [150.0, 150.0, 20.0, 1.0]
        Testing.LoopCount = 0
        Testing.LoopMax = 50
        Testing.TimeMax = 0
        Testing.TimeAvg = 0
        Testing.TimeMin = 0
        Testing.TimeTemp = 0
        Testing.TimeTotal = 0
        Testing.Init = false

        // transformation matrix
        MTrans = 
            [
                [1.0, 0.0, 0.0, 0.0],
                [0.0, 1.0, 0.0, 0.0],
                [0.0, 0.0, 1.0, 0.0],
                [0.0, 0.0, 0.0, 1.0]
            ]

        // position information of qube
        MQube = 
            [
                [1.0, 0.0, 0.0, 0.0],
                [0.0, 1.0, 0.0, 0.0],
                [0.0, 0.0, 1.0, 0.0],
                [0.0, 0.0, 0.0, 1.0]
            ]

        // entity matrix
        I = 
            [
                [1.0, 0.0, 0.0, 0.0],
                [0.0, 1.0, 0.0, 0.0],
                [0.0, 0.0, 1.0, 0.0],
                [0.0, 0.0, 0.0, 1.0]
            ]

        // create qube
        q.VARRAY[0] = CreateP(-CubeSize, -CubeSize, CubeSize)
        q.VARRAY[1] = CreateP(-CubeSize, CubeSize, CubeSize)
        q.VARRAY[2] = CreateP(CubeSize, CubeSize, CubeSize)
        q.VARRAY[3] = CreateP(CubeSize, -CubeSize, CubeSize)
        q.VARRAY[4] = CreateP(-CubeSize, -CubeSize, -CubeSize)
        q.VARRAY[5] = CreateP(-CubeSize, CubeSize, -CubeSize)
        q.VARRAY[6] = CreateP(CubeSize, CubeSize, -CubeSize)
        q.VARRAY[7] = CreateP(CubeSize, -CubeSize, -CubeSize)
        q.VARRAY[8] = CreateP(0.0, 0.0, 0.0)

        // anti-clockwise edge check
        q.Edge = 
            [
                [0.0, 1.0, 2.0],
                [3.0, 2.0, 6.0],
                [7.0, 6.0, 5.0],
                [4.0, 5.0, 1.0],
                [4.0, 0.0, 3.0],
                [1.0, 5.0, 6.0]
            ]
        for (i in 0..q.Edge.size) {
            q.Normal[i] = CalcNormal(
                q.VARRAY[Int64(q.Edge[i][0])].V,
                q.VARRAY[Int64(q.Edge[i][1])].V,
                q.VARRAY[Int64(q.Edge[i][2])].V
            )
        }
        q.Line = [false, false, false, false, false, false, false, false, false, false, false, false]
        q.NumPx = Int64(9.0 * 2.0 * CubeSize)
        for (_ in 0..q.NumPx) {
            var xx = CreateP(0.0, 0.0, 0.0)
        }

        MTrans = Translate(MTrans, Origin.V[0], Origin.V[1], Origin.V[2])
        MQube = MMulti(MTrans, MQube)

        for (i in 0..9) {
            q.VARRAY[i].V = VMulti(MTrans, q.VARRAY[i].V)
        }

        DrawQube()
        Testing.Init = true
        Loop()


        // Perform a simple sum-based verification.
        var sum: Float64 = 0.0
        for (i in 0..q.VARRAY.size) {
            let vector = q.VARRAY[i].V
            for (j in 0..vector.size) {
                sum += vector[j]
            }
        }
        if (sum != validation[Int64(CubeSize)]) {


        }
    }

    func runTest() {
        var i = 20
        while (i <= 160) {
            creat(Float64(i))
            i *= 2
        }
    }

    let isDebug: Bool = false

}

class Timer {
    // ms
    public func getTime() {
        let time = DateTime.now()
        return time
    }
}

class Benchmark {
 /*
  * @Benchmark
 */
    func run() {
        let start = Timer().getTime()
        let cube = Cube()
        for (_ in 0..8) {
            cube.runTest()
        }
        let end = Timer().getTime()
        let duration = end - start
        println("3d-cube: ms = ${Float64(duration.toNanoseconds())/1000000.0}")
    }
}

main() {
    Benchmark().run()
}
