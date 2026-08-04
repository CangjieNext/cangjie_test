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

    public func getTime() {
        let time = DateTime.now()
        return time
    }
}


var global = 0

class Obj {
    var value: Int64 = 0
    init(value: Int64) {
        this.value = value
    }
}

func GenerateFakeRandomObject(): Array<Obj> {
    let resource: Array<Obj> = Array<Obj>(15, repeat: Obj(Random().nextInt64(9)+1))
    return resource
}

func GenerateFakeRandomInteger() : Array<Int64> {
    let resource: Array<Int64> = [12, 43, 56, 76, 89, 54, 45, 32, 35, 47, 46, 44, 21, 37, 84]
    return resource;
}

var arr = GenerateFakeRandomInteger()

/***************** With parameters *****************/
@OverflowWrapping
func foo(a: Int64, b: Int64, c: Int64) {
    arr[global] += 1
}


func callFoo(f: (Int64, Int64, Int64) ->  Unit, a: Int64, b: Int64,  c: Int64) {
    f(a, b, c)
}

/***************************** Default  parameters *****************************/

func defaultFoo(resources!: Array<Int64> = arr, i!:Int64 = 2, i3!: Int64 = 1, resourcesLength!: Int64 = 15): Int64 {
    var i4 : Int64 = 1;
    if ((resources[i % Int64(i3) & (resourcesLength - 1)] & 1) == 0) {
        i4 += 1;
    } else {
        i4 += 2;
    }
    return i4;
}
func callDefaultFoo(f: (Array<Int64>, Int64, Int64, Int64)->Int64, resources!: Array<Int64> = arr, i!:Int64 = 2, i3!: Int64 = 1, resourcesLength!: Int64 = 15): Int64 {
    return f(resources, i, i3, resourcesLength)
}
/********************* Different  parameters *********************/

func differentFoo(a: Int64, b: String, c: Bool) {
    arr[global] += 1
}

func callDifferentFoo(f: (Int64, String, Bool) -> Unit, a: Int64, b: String, c: Bool) {
    f(a, b, c)
}
/************************* Variable  parameters *************************/

func variableFoo(a: Int64, b: String, c: Bool) {
    arr[global] += 1
}

func callVariableFoo(f: (Int64, String, Bool) -> Unit, a: Int64, b: String, c: Bool) {
    f(a, b, c)
}

// Pointer function call
func runFunctionPtr() : Int64 {
    let count = 10000000
    let timer = Timer()
    global = 0
    timer.start()
    for (i in 0..count) {
        callFoo(foo, 1, 2, i)
    }
    let time = timer.stop()
	print("Function Call - RunFunctionPtr:\t${Float64(time.toNanoseconds())/1000000.0}\tms\n")
    return Int64(time.toNanoseconds())
}


// Pointer function call
func runDeffunctionPtr(): Int64 {
    let count = 10000000
    let timer = Timer()
    global = 0
    var i3 = 1
    let resources = GenerateFakeRandomInteger()
    let resourcesLength = resources.size
    timer.start()
    for (i in 0..count) {
        i3 = callDefaultFoo(defaultFoo, resources: resources, i: i, i3: i3, resourcesLength: resourcesLength)
    }
    let time = timer.stop()
	print("Function Call - RunDefaultfunctionPtr:\t${Float64(time.toNanoseconds())/1000000.0}\tms\n")
    return Int64(time.toNanoseconds())
}

// Pointer function call
func runDifFunctionPtr() : Int64 {
    let count = 10000000
    let timer = Timer()
    global = 0
    timer.start()
    for (i in 0..count) {
        callDifferentFoo(differentFoo, 1, "1", true)
    }
    let time = timer.stop()
	print("Function Call - RunDifferentFunctionPtr:\t${Float64(time.toNanoseconds())/1000000.0}\tms\n")
    return Int64(time.toNanoseconds())
}

// Pointer function call
func runVariableFuncPtr(): Int64 {
    let count = 10000000
    let timer = Timer()
    global = 0
    timer.start()
    for (i in 0..count) {
        callVariableFoo(variableFoo, 1, "1", true)
    }
    let time = timer.stop()
	print("Function Call - RunVariableFunctionPtr:\t${Float64(time.toNanoseconds())/1000000.0}\tms\n")
    return Int64(time.toNanoseconds())
}

main () {
    runFunctionPtr()
    runDeffunctionPtr()
    runDifFunctionPtr()
    runVariableFuncPtr()
    print("Cangjie Pointer Call Is End, global value : ${global}\n")
    return 0
}
