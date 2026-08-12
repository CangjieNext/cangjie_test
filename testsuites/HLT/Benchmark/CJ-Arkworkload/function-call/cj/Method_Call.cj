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
    let resource: Array<Obj> = Array<Obj>(15, repeat: Obj((random.nextInt64(9)+1)))
    return resource
}

var global = 0

func GenerateFakeRandomInteger() :Array<Int64> {
    let resource: Array<Int64>= [12, 43, 56, 76, 89, 54, 45, 32, 35, 47, 46, 44, 21, 37, 84]
    return resource;
}
var arr: Array<Int64> = GenerateFakeRandomInteger()

class ClassFunc {
    func foo(resources: Array<Int64>, i: Int64, i3: Int64, resourcesLength: Int64) :Int64 {
        var i4 = i3;
        if ((resources[i % Int64(i3) & (resourcesLength - 1)] & 1) == 0) {
            i4 += 1;
        } else {
            i4 += 2;
        }
        return i4;
    }

    func parameterlessFoo(): Obj {
        var res: Array<Obj> = Array<Obj>(5, repeat: Obj(random.nextInt64(9)+1))
        let resources = GenerateFakeRandomObject()
        for (i in 0..200) {
            res[i % 5] = resources[i % 15]
        }
        return res[1]
    }

    func differentFoo(resources: Array<Int64>, i: Int64, i3: Float64, resourcesLength: Int64): Float64 {
        var i4 = i3
        if ((resources[i % Int64(i3) & (resourcesLength - 1)] & 1) == 0) {
            i4 += 1.1
        } else {
            i4 += 2.1
        }
        return i4
    }

    func defaultFoo(resources!: Array<Int64> = arr, i!:Int64 = 2, i3!: Int64 = 1, resourcesLength!: Int64 = 15): Int64 {
        var i4 : Int64 = 1;
        if ((resources[i % Int64(i3) & (resourcesLength - 1)] & 1) == 0) {
            i4 += 1;
        } else {
            i4 += 2;
        }
        return i4;
    }

    func variableFoo(a: Int64, b: String, c: Bool) {
        arr[global] += 1
    }

    func argsFoo(args: Int64) {
        global += 1
    }
    var member: Int64 = Int64(Random().nextInt64(2)+1)
    var resources: Array<Int64> = GenerateFakeRandomInteger()
}
/***************** With parameters *****************/
// Method call

func runMethodCall() : Int64 {
    let count = 10000000
    let cf = ClassFunc()
    let timer = Timer()
    let resources = GenerateFakeRandomInteger();
    var i3 = 1
    let func1:(Array<Int64>, Int64, Int64, Int64) -> Int64 = cf.foo
    let resourcesLength = resources.size
    let startTime = timer.getTime()
    for (i in 0..count) {
        i3 = func1(resources, i, i3, resourcesLength)
    }
    let midTime = timer.getTime()
    for (i in 0..count) {}
    let endTime = timer.getTime()
	let time = Float64(((midTime - startTime) - (endTime - midTime)).toNanoseconds())/1000000.0 // ms
	print("Function Call - RunMethodCall:\t${time}\tms\n")
    return Int64(time)
}


func runParameterlessMethodCall() : Obj {
    let count = 10000
    let cf = ClassFunc()
    var i3 = Obj(1)
    let timer = Timer()
    global = 0
    let func1: ()->Obj = cf.parameterlessFoo
    let startTime = timer.getTime()
    for ( i in 0..count) {
        i3 = func1()
    }
    let midTime = timer.getTime()
    for (i in 0..count) {}
    let endTime = timer.getTime()
	let time = Float64(((midTime - startTime) - (endTime - midTime)).toNanoseconds())/1000000.0 // ms
	print("Function Call - RunParameterlessMethodCall:\t${time}\tms\n")
    return i3
}

/***************************** Default  parameters *****************************/
// Method call
func runDefMethodCall(): Int64 {
    let count = 10000000
    let cf = ClassFunc()
    let timer = Timer()
    var i3 = 1
    let resources = GenerateFakeRandomInteger()
    let resourcesLength = resources.size
    global = 0
    let func1 = cf.defaultFoo
    let startTime = timer.getTime()
    for (i in 0..count) {
        i3 = func1(resources, i, i3, resourcesLength)
    }
    let midTime = timer.getTime()
    for (i in 0..count) {}
    let endTime = timer.getTime()
	let time = Float64(((midTime - startTime) - (endTime - midTime)).toNanoseconds())/1000000.0 // ms
    println(i3)
	print("Function Call - RunDefMethodCall:\t${time}\tms\n")
    return Int64(time)
}

/********************* Different  parameters *********************/
// Method call
func runDifMethodCall() : Int64 {
    let count = 10000000
    let cf = ClassFunc()
    let timer = Timer()
    let resources = GenerateFakeRandomInteger()
    let resourcesLength = resources.size
    var i3 = 1.1
    global = 0
    let func1 = cf.differentFoo
    let startTime = timer.getTime()
    for (i in 0..count) {
        i3 = func1(resources, i, i3, resourcesLength)
    }
    let midTime = timer.getTime()
    for (i in 0..count) {}
    let endTime = timer.getTime()
	let time = Float64(((midTime - startTime) - (endTime - midTime)).toNanoseconds())/1000000.0 // ms
	print("Function Call - RunDifMethodCall:\t${time}\tms\n")
    return Int64(time)
}

/************************* Variable  parameters *************************/
// Method call
func runVariableMethodCall() : Int64 {
    let count = 10000000
    let cf = ClassFunc()
    let timer = Timer()
    global = 0
    let func1 = cf.variableFoo
    let startTime = timer.getTime()
    for (i in 0..count) {
        func1(1, "1", true)
    }
    let midTime = timer.getTime()
    for (i in 0..count) {}
    let endTime = timer.getTime()
	let time = Float64(((midTime - startTime) - (endTime - midTime)).toNanoseconds())/1000000.0 // ms
	print("Function Call - RunVariableMethodCall:\t${time}\tms\n")
    return Int64(time)
}

main() {
    runMethodCall()
    runParameterlessMethodCall()
    runDefMethodCall()
    runDifMethodCall()
    runVariableMethodCall()
    print("Cangjie method call is end, global value : ${global}")
    return 0
}
