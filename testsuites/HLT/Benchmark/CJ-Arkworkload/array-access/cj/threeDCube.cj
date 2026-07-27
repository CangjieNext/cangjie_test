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
import std.random.*
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

class Px {
    var V: Array<Float64>
    init(x: Float64, y: Float64, z: Float64) {
        this.V = [x, y, z, 1.0]
    }
}

class QType {
    var arr: Array<Px>
    var lastPx: Float64
    var lastX: Float64
    var lastY: Float64
    var normal: Array<Array<Float64>>
    var line: Array<Bool>
    var edge: Array<Array<Float64>>
    var numPx: Float64
    init(
        arr!: Array<Px>,
        lastPx!: Float64,
        lastX!: Float64,
        lastY!: Float64,
        normal!: Array<Array<Float64>>,
        line!: Array<Bool>,
        edge!: Array<Array<Float64>>,
        numPx!: Float64) {
        this.arr = arr
        this.lastPx = lastPx
        this.lastX = lastX
        this.lastY = lastY
        this.normal = normal
        this.line = line
        this.edge = edge
        this.numPx = numPx
    }
}

func run3d():Unit{
    var MTrans: Array<Array<Float64>> = 
        [
            [0.0, 0.0, 0.0, 0.0],
            [0.0, 0.0, 0.0, 0.0],
            [0.0, 0.0, 0.0, 0.0],
            [0.0, 0.0, 0.0, 0.0]
        ]
    var MQube: Array<Array<Float64>> = 
        [
            [0.0, 0.0, 0.0, 0.0],
            [0.0, 0.0, 0.0, 0.0],
            [0.0, 0.0, 0.0, 0.0],
            [0.0, 0.0, 0.0, 0.0]
        ]
    var I: Array<Array<Float64>> = 
        [
            [0.0, 0.0, 0.0, 0.0],
            [0.0, 0.0, 0.0, 0.0],
            [0.0, 0.0, 0.0, 0.0],
            [0.0, 0.0, 0.0, 0.0]
        ]
    var Origin = Array<Float64>(4,repeat:0.0)
    var Testing = HashMap<String, Int64>([("loopCount", 0),("loopMax", 0)])
    // var LoopTimer;
    let validation = HashMap<Int64, Float64>([(20, 2889.0000000000045), (40, 2889.0000000000055), (80, 2889.000000000005) , (160, 2889.0000000000055)])

    var arrTemp = Array<Px>(9, repeat:Px(0.0,0.0,0.0))
    var lastPxTemp  = 0.0
    var edgeTemp : Array<Array<Float64>> = 
        [
            [0.0, 0.0, 0.0],
            [0.0, 0.0, 0.0],
            [0.0, 0.0, 0.0],
            [0.0, 0.0, 0.0],
            [0.0, 0.0, 0.0],
            [0.0, 0.0, 0.0]
        ]
    var normalTemp: Array<Array<Float64>> =
        [
            [0.0, 0.0, 0.0, 0.0],
            [0.0, 0.0, 0.0, 0.0],
            [0.0, 0.0, 0.0, 0.0],
            [0.0, 0.0, 0.0, 0.0],
            [0.0, 0.0, 0.0, 0.0],
            [0.0, 0.0, 0.0, 0.0]
        ]
    var numPxTemp = 0.0
    var lineTemp = Array<Bool>(12,repeat: true)
    let Q:QType = QType(
                    arr:arrTemp,
                    lastPx:lastPxTemp,
                    lastX: 0.0,
                    lastY: 0.0,
                    normal:normalTemp,
                    edge:edgeTemp,
                    numPx:numPxTemp,
                    line: lineTemp
                )


    func drawLine(from2!: Px, to!: Px) {
        let x1 = from2.V[0]
        let x2 = to.V[0]
        let y1 = from2.V[1]
        let y2 = to.V[1]
        let dx = Int64(abs(x2 - x1))
        let dy = Int64(abs(y2 - y1))
        var x = x1
        var y = y1
        var incX1: Int64
        var incY1: Int64
        var incX2: Int64
        var incY2: Int64
        var den: Int64
        var num: Int64
        var numAdd: Int64
        var numPix: Int64

        if (x2 >= x1) {
            incX1 = 1
            incX2 = 1
        } else {
            incX1 = -1
            incX2 = -1
        }

        if (y2 >= y1) {
            incY1 = 1
            incY2 = 1
        } else {
            incY1 = -1
            incY2 = -1
        }

        if (dx >= dy) {
            incX1 = 0
            incY2 = 0
            den = dx
            num = dx / 2
            numAdd = Int64(dy)
            numPix = dx
        } else {
            incX2 = 0
            incY1 = 0
            den = dy
            num = dy / 2
            numAdd = dx
            numPix = dy
        }

        numPix = Int64(Q.lastPx) + numPix

        var i = Int64(Q.lastPx)
        while (i < numPix) {
            num += numAdd
            if (num >= den) {
                num -= den
                x += Float64(incX1)
                y += Float64(incY1)
            }

            x += Float64(incX2)
            y += Float64(incY2)

            i += 1
        }
        Q.lastX = x;
        Q.lastY = y;
        Q.lastPx = Float64(numPix)
    }

    func calcCross(V0: Array<Float64>, V1: Array<Float64>) : Array<Float64> {
         var cross = Array<Float64>(4, repeat: 0.0)
        cross[0] = V0[1]*V1[2] - V0[2]*V1[1]
        cross[1] = V0[2]*V1[0] - V0[0]*V1[2]
        cross[2] = V0[0]*V1[1] - V0[1]*V1[0]
        return cross
    }


    func calcNormal(V0: Array<Float64>, V1: Array<Float64>, V2: Array<Float64>) : Array<Float64> {
        var A: Array<Float64> = [0.0, 0.0, 0.0, 0.0]
        var B: Array<Float64> = [0.0, 0.0, 0.0, 0.0]
        for (i in 0..3) {
            A[i] = (V0[i] - V1[i])
            B[i] = (V2[i] - V1[i])
        }

        A = calcCross(A,  B)
        let length = sqrt(A[0]*A[0] + A[1]*A[1] + A[2]*A[2])
        for (i in 0..3) {
            A[i] /= length
        }
        A[3] = 1.0
        return A
    }

    // multiplies two matrices
    func mMulti(M1!: Array<Array<Float64>>, M2!: Array<Array<Float64>>) :Array<Array<Float64>> {
        var M : Array<Array<Float64>> = 
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

    // multiplies matrix with vector
    func vMulti(M!: Array<Array<Float64>>, V!: Array<Float64>) : Array<Float64> {
        var vect: Array<Float64> = [0.0, 0.0, 0.0, 0.0]
        for (i in 0..4) {
            vect[i] = M[i][0] * V[0] + M[i][1] * V[1] + M[i][2] * V[2] + M[i][3] * V[3]
        }
        return vect
    }

    func vMulti2(M!: Array<Array<Float64>>, V!: Array<Float64>) : Array<Float64> {
         var vect: Array<Float64> = [0.0, 0.0, 0.0]
        for (i in 0..3) {
            vect[i] = M[i][0] * V[0] + M[i][1] * V[1] + M[i][2] * V[2]
        }
        return vect
    }

    // add to matrices
    func mAdd(M1!: Array<Array<Float64>>, M2!: Array<Array<Float64>>) : Array<Array<Float64>> {
        var M : Array<Array<Float64>> = 
            [
                [0.0, 0.0, 0.0, 0.0],
                [0.0, 0.0, 0.0, 0.0],
                [0.0, 0.0, 0.0, 0.0],
                [0.0, 0.0, 0.0, 0.0]
            ]
        
        for (i in 0..4) {
            for (j in 0..4) {
                M[i][j] = M1[i][j] + M2[i][j]
            }
        }

        return M
    }

    func translate(M!: Array<Array<Float64>>, Dx!: Float64, Dy!: Float64, Dz!: Float64) : Array<Array<Float64>> {
        let T = [
            [1.0, 0.0, 0.0, Dx],
            [0.0, 1.0, 0.0, Dy],
            [0.0, 0.0, 1.0, Dz],
            [0.0, 0.0, 0.0, 1.0]
        ]
        return mMulti(M1: T, M2: M)
    }

    func rotateX(M!: Array<Array<Float64>>, phi !: Float64) : Array<Array<Float64>> {
        var a = phi
        a *= Float64.GetPI() / 180.0

        let cosA = cos(a)
        let sinA = sin(a)

        let R = [
            [1.0, 0.0, 0.0, 0.0],
            [0.0, cosA, -sinA, 0.0],
            [0.0, sinA, cosA, 0.0],
            [0.0, 0.0, 0.0, 1.0]
        ]

        return mMulti(M1: R, M2: M)
    }

    func rotateY(M!: Array<Array<Float64>>, phi!: Float64) : Array<Array<Float64>> {
        var a = phi
        a *= Float64.GetPI() / 180.0

        let cosA = cos(a)
        let sinA = sin(a)

        let R = [
            [cosA, 0.0, sinA, 0.0],
            [0.0, 1.0, 0.0, 0.0],
            [-sinA, 0.0, cosA, 0.0],
            [0.0, 0.0, 0.0, 1.0]
        ]

        return mMulti(M1: R, M2: M)
    }

    func rotateZ(M!: Array<Array<Float64>>, phi!: Float64) : Array<Array<Float64>> {
        var a = phi
        a *= Float64.GetPI() / 180.0

        let cosA = cos(a)
        let sinA = sin(a)

        let R = [
            [cosA, -sinA, 0.0, 0.0],
            [sinA, cosA, 0.0, 0.0],
            [0.0, 0.0, 1.0, 0.0],
            [0.0, 0.0, 0.0, 1.0]
        ]

        return mMulti(M1: R, M2: M)
    }

    func drawQube() {
        var CurN: Array<Array<Float64>> = Array<Array<Float64>>(6, repeat: Array<Float64>())
        var i = 5
        Q.lastPx = 0.0


        for(_ in 0..=i) {
            CurN[i] = vMulti2(M: MQube, V: Q.normal[i])
            i -= 1
        }

        if (CurN[0][2] < 0.0) {
            if (!Q.line[0]) { drawLine(from2:Q.arr[0], to:Q.arr[1]); Q.line[0] = true }
            if (!Q.line[1]) { drawLine(from2:Q.arr[1], to:Q.arr[2]); Q.line[1] = true }
            if (!Q.line[2]) { drawLine(from2:Q.arr[2], to:Q.arr[3]); Q.line[2] = true }
            if (!Q.line[3]) { drawLine(from2:Q.arr[3], to:Q.arr[0]); Q.line[3] = true }
        }
        if (CurN[1][2] < 0.0 ) {
            if (!Q.line[2]) { drawLine(from2:Q.arr[3], to:Q.arr[2]); Q.line[2] = true }
            if (!Q.line[9] ){ drawLine(from2:Q.arr[2], to:Q.arr[6]); Q.line[9] = true }
            if (!Q.line[6] ){ drawLine(from2:Q.arr[6], to:Q.arr[7]); Q.line[6] = true }
            if (!Q.line[10] ){ drawLine(from2:Q.arr[7], to:Q.arr[3]); Q.line[10] = true }
        }
        if (CurN[2][2] < 0.0) {
            if (!Q.line[4] ){ drawLine(from2:Q.arr[4], to:Q.arr[5]); Q.line[4] = true }
            if (!Q.line[5] ){ drawLine(from2:Q.arr[5], to:Q.arr[6]); Q.line[5] = true }
            if (!Q.line[6] ){ drawLine(from2:Q.arr[6], to:Q.arr[7]); Q.line[6] = true }
            if (!Q.line[7] ){ drawLine(from2:Q.arr[7], to:Q.arr[4]); Q.line[7] = true }
        }
        if (CurN[3][2] < 0.0) {
            if (!Q.line[4] ){ drawLine(from2:Q.arr[4], to:Q.arr[5]); Q.line[4] = true }
            if (!Q.line[8] ){ drawLine(from2:Q.arr[5], to:Q.arr[1]); Q.line[8] = true }
            if (!Q.line[0] ){ drawLine(from2:Q.arr[1], to:Q.arr[0]); Q.line[0] = true }
            if (!Q.line[11] ){ drawLine(from2:Q.arr[0], to:Q.arr[4]); Q.line[11] = true }
        }
        if (CurN[4][2] < 0.0) {
            if (!Q.line[11] ){ drawLine(from2:Q.arr[4], to:Q.arr[0]); Q.line[11] = true }
            if (!Q.line[3] ){ drawLine(from2:Q.arr[0], to:Q.arr[3]); Q.line[3] = true }
            if (!Q.line[10] ){ drawLine(from2:Q.arr[3], to:Q.arr[7]); Q.line[10] = true }
            if (!Q.line[7] ){ drawLine(from2:Q.arr[7], to:Q.arr[4]); Q.line[7] = true }
        }
        if (CurN[5][2] < 0.0) {
            if (!Q.line[8] ){ drawLine(from2:Q.arr[1], to:Q.arr[5]); Q.line[8] = true }
            if (!Q.line[5] ){ drawLine(from2:Q.arr[5], to:Q.arr[6]); Q.line[5] = true }
            if (!Q.line[9]) { drawLine(from2:Q.arr[6], to:Q.arr[2]); Q.line[9] = true }
            if (!Q.line[1]) { drawLine(from2:Q.arr[2], to:Q.arr[1]); Q.line[1] = true }
        }

        Q.line = [false, false, false, false, false, false, false, false, false, false, false, false]
        Q.lastPx = 0.0
    }

    func loop() :Unit{
        if (Testing["loopCount"] > Testing["loopMax"]) {
            return
        }

        var testingStr = Testing["loopCount"].toString()
        while (testingStr.size < 3) {
            testingStr = "0" + testingStr
        }

        var MTrans = translate(M:I, Dx:-Q.arr[8].V[0], Dy:-Q.arr[8].V[1], Dz:-Q.arr[8].V[2])
        MTrans = rotateX(M: MTrans, phi: 1.0)
        MTrans = rotateY(M: MTrans, phi: 3.0)
        MTrans = rotateZ(M: MTrans, phi: 5.0)
        MTrans = translate(M:MTrans, Dx:Q.arr[8].V[0], Dy:Q.arr[8].V[1], Dz:Q.arr[8].V[2])

        MQube = mMulti(M1: MTrans, M2: MQube)
        var i = 8
        while (i > -1) {
            Q.arr[i].V = vMulti(M: MTrans, V: Q.arr[i].V)
            i -= 1
        }

        drawQube()
        Testing["loopCount"] += 1
        loop()
    }

   func Init(cubeSize!: Float64) {
        // Init/reset vars
        Origin = [150.0, 150.0, 20.0, 1.0]
        Testing["loopCount"] = 0
        Testing["loopMax"]= 50

        MTrans = [
            [1.0, 0.0, 0.0, 0.0],
            [0.0, 1.0, 0.0, 0.0],
            [0.0, 0.0, 1.0, 0.0],
            [0.0, 0.0, 0.0, 1.0]
        ] // transformation matrix

        MQube = [
            [1.0, 0.0, 0.0, 0.0],
            [0.0, 1.0, 0.0, 0.0],
            [0.0, 0.0, 1.0, 0.0],
            [0.0, 0.0, 0.0, 1.0]
        ] // position information of qube

        I = [
            [1.0, 0.0, 0.0, 0.0],
            [0.0, 1.0, 0.0, 0.0],
            [0.0, 0.0, 1.0, 0.0],
            [0.0, 0.0, 0.0, 1.0]
        ] // entity matrix

        // create qube
        Q.arr[0] = Px( -cubeSize,  -cubeSize,  cubeSize)
        Q.arr[1] = Px(-cubeSize,  cubeSize,  cubeSize)
        Q.arr[2] = Px(cubeSize,  cubeSize,  cubeSize)
        Q.arr[3] = Px(cubeSize,  -cubeSize,  cubeSize)
        Q.arr[4] = Px(-cubeSize,  -cubeSize,  -cubeSize)
        Q.arr[5] = Px(-cubeSize,  cubeSize,  -cubeSize)
        Q.arr[6] = Px(cubeSize,  cubeSize,  -cubeSize)
        Q.arr[7] = Px(cubeSize,  -cubeSize, -cubeSize)


        // // center of gravity
        Q.arr[8] = Px( 0.0,  0.0, 0.0)

        // anti-clockwise edge check
        Q.edge = [[0.0, 1.0, 2.0], [3.0, 2.0, 6.0], [7.0, 6.0, 5.0], [4.0, 5.0, 1.0], [4.0, 0.0, 3.0], [1.0, 5.0, 6.0]]

        // calculate squad normals
        Q.normal = 
            [
                [0.0, 0.0, 0.0, 0.0],
                [0.0, 0.0, 0.0, 0.0],
                [0.0, 0.0, 0.0, 0.0],
                [0.0, 0.0, 0.0, 0.0],
                [0.0, 0.0, 0.0, 0.0],
                [0.0, 0.0, 0.0, 0.0]
            ]
        for (i in 0..Q.edge.size) {
            Q.normal[i] = calcNormal( Q.arr[Int64(Q.edge[i][0])].V,  Q.arr[Int64(Q.edge[i][1])].V,  Q.arr[Int64(Q.edge[i][2])].V)
        }

        // // line drawn?
        Q.line = [false,false,false,false,false,false,false,false,false,false,false,false]

        // // create line pixels
        Q.numPx = 9.0 * 2.0 * cubeSize
        MTrans = translate(M: MTrans, Dx: Origin[0], Dy: Origin[1], Dz: Origin[2])
        MQube = mMulti(M1: MTrans, M2: MQube)

        var i = 0
        while (i < 9 ) {
            Q.arr[i].V = vMulti(M: MTrans, V: Q.arr[i].V)
            i += 1
        }

        drawQube()
        loop()

        // // Perform a simple sum-based verification.
        var sum: Float64 = 0.0
        for (i in 0..Q.arr.size) {
            let vector = Q.arr[i].V
            for (j in 0..vector.size) {
                sum += vector[j]
            }
        }

        var expected:Float64 = 0.0

        if (cubeSize == 20.0) {
            if(validation.contains(Int64(cubeSize))){
                expected = validation[Int64(cubeSize)]
            }else{
                expected = 0.0
            }
        } else if (cubeSize == 40.0) {
             if(validation.contains(Int64(cubeSize))){
                expected = validation[Int64(cubeSize)]
            }else{
                expected = 0.0
            }
        } else if (cubeSize == 80.0) {
            if(validation.contains(Int64(cubeSize))){
                expected = validation[Int64(cubeSize)]
            }else{
                expected = 0.0
            }
        } else if (cubeSize == 160.0) {
            if(validation.contains(Int64(cubeSize))){
                expected = validation[Int64(cubeSize)]
            }else{
                expected = 0.0
            }
        }
        if (sum != expected) {
            throw Exception("Error: bad vector sum for CubeSize = ${cubeSize}; expected ${expected} but got ${sum}")
        }
    }

    var iter = 0
    while (iter <= 10) {
        var i=20
        while (i <= 160) {
            Init(cubeSize: Float64(i))
            i *= 2
        }
        iter += 1
    }
}

func runThreeDCube(): Int64 {
    timer.start()
    run3d()
    let time = timer.stop()
    print("Array Access - RunThreeDCube:\t${Float64(time.toNanoseconds())/1000000.0}\tms\n");
    return Int64(time.toMilliseconds())
}

main(){
    runThreeDCube()
    return 0
}
