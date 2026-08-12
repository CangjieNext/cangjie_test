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

    public func getTime(): Float64 {
        let time = DateTime.now()
        return Float64(time.second) * 1000.0 + Float64(time.nanosecond)/ 1000000.0
    }
}

var global = 0

class Obj {
    var value: Int64 = 0
    init(value: Int64) {
        this.value = value
    }
}

let random = Random()

func GenerateFakeRandomObject(): Array<Obj> {
    let resource: Array<Obj> = Array<Obj>(15, repeat: Obj(random.nextInt64(9)+1))
    return resource
}

func GenerateFakeRandomInteger() : Array<Int64> {
    let resource: Array<Int64> = [12, 43, 56, 76, 89, 54, 45, 32, 35, 47, 46, 44, 21, 37, 84]
    return resource;
}

var arr = GenerateFakeRandomInteger()

/***** Without parameters *****/
func parameterlessFoo(): Obj {
    var res: Array<Obj> = Array<Obj>(5, repeat: Obj(random.nextInt64(9)+1))
    let resources = GenerateFakeRandomObject()
    for (i in 0..200) {
        res[i % 5] = resources[i % 15]
    } 
    return res[1]
}

func callParameterlessFoo(f: () -> Obj): Obj {
    var i = f()
    return i
}

// Pointer  no parameters function call
func RunParameterlessFunctionPtr(): Int {
    let count = 10000
    let timer = Timer()
    global = 0
    var i3 = Obj(1)
    timer.start()
    for (_ in 0..count) {
        i3 = callParameterlessFoo(parameterlessFoo)
    }
    let time = timer.stop()
    print("Function Call - RunParameterlessFunctionPtr:\t${Float64(time.toNanoseconds())/1000000.0}\tms\n");
    return Int64(time.toNanoseconds())
}

main() {
    _ = RunParameterlessFunctionPtr()
    print("Swift Method Call Is End, global value : ${global}\n")
}
