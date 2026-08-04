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

func approximate(u:Array<Float64>, v:Array<Float64>, b:Array<Float64>) : Float64 {
    let n = v.size
    for (_ in 1..10) {
        multiplyAtAv(u,v,b)
        multiplyAtAv(v,u,b)
    }
    var vBv = 0.0
    var vv = 0.0
    for (i in 0..n) {
        vBv += u[i]*v[i]
        vv  += v[i]*v[i]
    }
    return sqrt(vBv/vv)
}

@OverflowWrapping
func a(i: Int64, j: Int64) : Float64 {
    let ij = i+j
    return 1.0 / Float64( ij*(ij+1)/2 + i+1 )
}

func multiplyAv(v:Array<Float64>, av:  Array<Float64>) {
    let n = v.size
    for (i in 0..n) {
        av[i] = 0.0;
        for (j in 0..n) {
            av[i] += a(i,j)*v[j]
        }
    }
}

func multiplyAtv(v: Array<Float64>, atv:  Array<Float64>) {
    let n = v.size
    for (i in 0..n) {
        atv[i] = 0.0;
        for (j in 0..n) {
            atv[i] += a(j,i)*v[j]
        }
    }
}

func multiplyAtAv(v:  Array<Float64>, atAv:  Array<Float64>, u: Array<Float64>) {
    multiplyAv(v,u)
    multiplyAtv(u,atAv)
}

func runSpectralnorm():Int64{
    let n: Int64 = 500;
    var u = Array<Float64>(n, repeat: 1.0)
    
    var v = Array<Float64>(n, repeat: 0.0)
    var b = Array<Float64>(n, repeat: 0.0)
    timer.start()
    approximate(u, v, b)
    let time = timer.stop()
    println("Array Access - RunSpectralNorm:\t${Float64(time.toNanoseconds())/1000000.0}\tms");
	return Int64(time.toMilliseconds())
}

main() {
	runSpectralnorm()
	return 0
}
