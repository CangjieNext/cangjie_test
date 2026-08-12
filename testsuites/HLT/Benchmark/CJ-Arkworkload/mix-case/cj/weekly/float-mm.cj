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

    /* Intmm, Mm */
let rowsize = 40
    /* global */
var seed: Int64 = 0 /* converted to long for 16 bit WR*/

var rma: Array<Array<Float64>> = Array<Array<Float64>>(rowsize + 1,
    {x: Int64 => Array<Float64>(rowsize + 1, {y: Int64 => 0.0})})
var rmb: Array<Array<Float64>> = Array<Array<Float64>>(rowsize + 1,
    {x: Int64 => Array<Float64>(rowsize + 1, {y: Int64 => 0.0})})
var rmr: Array<Array<Float64>> = Array<Array<Float64>>(rowsize + 1,
    {x: Int64 => Array<Float64>(rowsize + 1, {y: Int64 => 0.0})})

func Initrand(): Unit {
    seed = 74755 /* constant to long WR*/
}

func Rand(): Int64 {
    seed = (seed * 1309 + 13849) & 65535 /* constants to long WR*/
    return seed /* typecast back to int WR*/
}

    /* Multiplies two real matrices. */

func rInitmatrix(m: Array<Array<Float64>>) {
    var temp: Int64
    for (i in 1..=rowsize) {
        for (j in 1..=rowsize) {
            temp = Rand()
            m[i][j] = (Float64(temp) - floor(Float64(temp) / 120.0) * 120.0 - 60.0) / 3.0
        }
    }
}

func rInnerproduct(result: Array<Array<Float64>>, a: Array<Array<Float64>>,
    b: Array<Array<Float64>>, row: Int64, column: Int64) {
    /* computes the inner product of A[row,*] and B[*,column] */
    result[row][column] = 0.0
    for (i in 1..=rowsize) {
        result[row][column] = result[row][column] + a[row][i] * b[i][column]
    }
}

func Mm(run: Int64): Unit {
    Initrand()
    //*`@Setup`
    rInitmatrix(rma)
    //*`@Setup`
    rInitmatrix(rmb)
    for (i in 1..=rowsize) {
        for (j in 1..=rowsize) {
            rInnerproduct(rmr, rma, rmb, i, j)
        }
    }
    if (run < rowsize) {
        
    }
}

/*
   * @State
   * @Tags Jetstream2
   */
class Benchmark {
    /*
   * @Benchmark
   */
    func runIteration() {
        for (i in 0..5000) {
            Mm(i)
        }
    }
}

//以下是测试打印日志相关代码
let isDebug = false
func printLog(str: String): Unit {
    if (isDebug) {
        println(str)
    }
}

class Timer {
    // ms
    public func getTime() {
        let time = DateTime.now()
        return time
    }
}

func startRun(times: Int64, ben!: Benchmark = Benchmark(), time!: Timer = Timer()) {
    let start = time.getTime()
    for (_ in 0..times) {
        ben.runIteration()
    }
    let end = time.getTime()
    print("float-mm: ms = ${Float64((end-start).toNanoseconds())/1000000.0}")
}

main() {
    startRun(3)
}
