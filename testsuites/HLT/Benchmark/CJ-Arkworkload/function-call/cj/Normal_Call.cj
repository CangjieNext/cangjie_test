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

func GenerateFakeRandomInteger() : Array<Int64> {
    let resource: Array<Int64> = [12, 43, 56, 76, 89, 54, 45, 32, 35, 47, 46, 44, 21, 37, 84]
    return resource;
}

let random = Random()

func GenerateRandoms() :Array<Int64>{
    let result:Array<Int64>  = Array<Int64>(2, repeat: (random.nextInt64(2)+1))
    return result
}

var generaterandoms = GenerateRandoms()

func TimeGenerateRandoms() :Float64{
    let timer = Timer()
    timer.start()
    let tmp = 1
    if (generaterandoms[tmp%2] != 0) {

    }
	let time = timer.stop()
    return Float64(time.toNanoseconds())
}


class Obj {
    var value: Int64 = 0
    init(value: Int64) {
        this.value = value
    }
}

func GenerateFakeRandomObject(): Array<Obj> {
    let resource: Array<Obj> = Array<Obj>(15, repeat: Obj(random.nextInt64(9)+1))
    return resource
}

var global = 0
var arr: Array<Int64> = [12, 43, 56, 76, 89, 54, 45, 32, 35, 47, 46, 44, 21, 37, 84]

/***************** With parameters *****************/

func Foo(resources: Array<Int64>, i: Int64, i3: Int64, resourcesLength: Int64) :Int64 {
    var i4 = i3;
    if ((resources[i % Int64(i3) & (resourcesLength - 1)] & 1) == 0) {
        i4 += 1;
    } else {
        i4 += 2;
    }
    return i4;
}

/***** Without parameters *****/
func parameterlessFoo(): Obj {
    var res: Array<Obj> = Array<Obj>(5, repeat: Obj(random.nextInt64(9)+1))
    let resources = GenerateFakeRandomObject()
    for (i in 0..200) {
        res[i % 5] = resources[i % 15]
    }
    return res[1]
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
/********************* Different  parameters *********************/

func differentFoo(resources: Array<Int64>, i: Int64, i3: Float64, resourcesLength: Int64): Float64 {
    var i4 = i3
    if ((resources[i % Int64(i3) & (resourcesLength - 1)] & 1) == 0) {
        i4 += 1.1
    } else {
        i4 += 2.1
    }
    return i4
}
/************************* Variable  parameters *************************/
@OverflowWrapping
func variableFoo(a: Int64, b: String, c: Bool) {
    arr[global] += 1
}
/***************************** ...Args  parameters *****************************/

func argsFoo(args: Int64) {
    global += 1
}
/***************** With parameters *****************/
// Normal call
func runNormalCall() : Int64 {
    let count = 10000000
    let resources = GenerateFakeRandomInteger();
    var i3 = 1
    let timer = Timer()
    let startTime = timer.getTime()
    let resourcesLength = resources.size
    for( i in 0..count) {
        i3 = Foo(resources, i,  i3, resourcesLength)
    }
    let midTime = timer.getTime()
    for (i in 0..count) {}
    let endTime = timer.getTime()
    let time = Float64(((midTime - startTime) - (endTime - midTime)).toNanoseconds())/1000000.0 // ms
	print("Function Call - RunNormalCall:\t${time}\tms\n")
    return i3
}

/***** Without parameters *****/
// No parameter function call
func runParameterlessCall() : Obj {
    let count = 10000
    var i3 = Obj(1)
    let timer = Timer()
    global = 0
    let startTime = timer.getTime()
    for (i in 0..count) {
        i3 = parameterlessFoo()
    }
    let midTime = timer.getTime()
    for (i in 0..count) {}
    let endTime = timer.getTime()
    let time = Float64(((midTime - startTime) - (endTime - midTime)).toNanoseconds())/1000000.0 // ms
	print("Function Call - RunParameterlessCall:\t${time}\tms\n")
    return i3
}

/************ Default  parameters *************/
// Normal call
func runNormalDefCall() : Int64 {
    let count = 10000000
    let timer = Timer()
    var i3 = 1
    let resources = GenerateFakeRandomInteger()
    let resourcesLength = resources.size
    global = 0
    let startTime = timer.getTime()
    for (i in 0..count) {
        i3 = defaultFoo(resources: resources, i: i, i3: i3, resourcesLength: resourcesLength)
    }
    let midTime = timer.getTime()
    for (i in 0..count) {}
    let endTime = timer.getTime()
    let time = Float64(((midTime - startTime) - (endTime - midTime)).toNanoseconds())/1000000.0 // ms
    println(i3)
	print("Function Call - RunNormalDefCall:\t${time}\tms\n")
    return i3
}

/********************* Different  parameters *********************/
// Normal call
func runNormalDifferentCall() : Int64 {
    let count = 10000000
    let timer = Timer()
    let resources = GenerateFakeRandomInteger()
    let resourcesLength = resources.size
    var i3 = 1.1
    global = 0
    let startTime = timer.getTime()
    for (i in 0..count) {
        i3 = differentFoo(resources, i, i3, resourcesLength)
    }
    let midTime = timer.getTime()
    for (i in 0..count) {}
    let endTime = timer.getTime()
    let time = Float64(((midTime - startTime) - (endTime - midTime)).toNanoseconds())/1000000.0 // ms
	print("Function Call - RunNormalDifferentCall:\t${time}\tms\n")
    return Int64(time)
}

/************************* Variable  parameters *************************/
// Normal call
func runNormalVariableFCall() : Int64 {
    let count = 10000000
    let timer = Timer()
    global = 1
    let startTime = timer.getTime()
    for (i in 0..count) {
        variableFoo(1, "1", true)
    }
    let midTime = timer.getTime()
    for (i in 0..count) {}
    let endTime = timer.getTime()
    let time = Float64(((midTime - startTime) - (endTime - midTime)).toNanoseconds())/1000000.0 // ms
    print("Function Call - RunNormalVariableFCall:\t${time}\tms\n")
    return Int64(time)
}

main () {
    runNormalCall()
    runParameterlessCall()
    runNormalDefCall()
    runNormalDifferentCall()
    runNormalVariableFCall()
    print("Cangjie Normal Call Is End, global value : ${global}")
    return 0
}
