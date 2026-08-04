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

class Obj {
    var value: Int64 = 0
    init(value: Int64) {
        this.value = value
    }
}

let random = Random()

func GenerateFakeRandomObject(): Array<Obj> {
    let resource: Array<Obj> = Array<Obj>(15, repeat: Obj(Int64(random.nextUInt8()%10)))
    return resource
}
var global = 0
var arr = [12, 43, 56, 76, 89, 54, 45, 32, 35, 47, 46, 44, 21, 37, 84]

func GenerateFakeRandomInteger() : Array<Int64> {
    let resource: Array<Int64> = [12, 43, 56, 76, 89, 54, 45, 32, 35, 47, 46, 44, 21, 37, 84]
    return resource;
}

class Example {
    // static With parameters
    static func foo(resources: Array<Int64>, i: Int64, i3: Int64, resourcesLength: Int64) :Int64 {
        var i4 = i3;
        if ((resources[i % Int64(i3) & (resourcesLength - 1)] & 1) == 0) {
            i4 += 1;
        } else {
            i4 += 2;
        }
        return i4;
    }
    // static Without parameters

    static func parameterlessFoo(): Obj {
        var res: Array<Obj> = Array<Obj>(5, repeat: Obj(Int64(random.nextUInt8()%10)))
        let resources = GenerateFakeRandomObject()
        for (i in 0..200) {
            res[i % 5] = resources[i % 15]
        }
        return res[1]
    }
    // static Different  parameters

    static func differentFoo(resources: Array<Int64>, i: Int64, i3: Float64, resourcesLength: Int64): Float64 {
        var i4 = i3
        if ((resources[i % Int64(i3) & (resourcesLength - 1)] & 1) == 0) {
            i4 += 1.1
        } else {
            i4 += 2.1
        }
        return i4
    }
    // static Default  parameters

    static func defaultFoo(resources!: Array<Int64> = arr, i!:Int64 = 2, i3!: Int64 = 1, resourcesLength!: Int64 = 15): Int64 {
        var i4 : Int64 = 1;
        if ((resources[i % Int64(i3) & (resourcesLength - 1)] & 1) == 0) {
            i4 += 1;
        } else {
            i4 += 2;
        }
        return i4;
    }
    // static Variable  parameters

    static func variableFoo(a!: ?Int64 = None, b!: ?String = None, c!: ?Bool = None) {
        arr[global] += 1
    }
    // static ...Args  parameters
    static func argsFoo(args: Int64) {
        global += 1
    }
}

func runStaticFunction() : Int64 {
    let count = 10000000
    let timer = Timer()
    let resources = GenerateFakeRandomInteger();
    var i3 = 1
    let startTime = timer.getTime()
    let resourcesLength = resources.size
    for (i in 0..count) {
        i3 = Example.foo(resources, i, i3, resourcesLength)
    }
    let midTime = timer.getTime()
    for (i in 0..count) {}
    let endTime = timer.getTime()
    let time = Float64(((midTime - startTime) - (endTime - midTime)).toNanoseconds())/1000000.0 // ms
	print("Static Function Call - RunStaticFunction:\t${time}\tms\n")
    return Int64(i3)
}

func runParameterlessStaticFunction() : Obj {
    let count = 10000
    let timer = Timer()
    var i3 = Obj(1)
    global = 0
    let startTime = timer.getTime()
    for( i in 0..count) {
        i3 = Example.parameterlessFoo()
    }
    let midTime = timer.getTime()
    for (i in 0..count) {}
    let endTime = timer.getTime()
    let time = Float64(((midTime - startTime) - (endTime - midTime)).toNanoseconds())/1000000.0 // ms
	print("Static Function Call - RunParameterlessStaticFunction:\t${time}\tms\n")
    return i3
}


func runNormalDifStaticFunc() : Int64 {
    let count = 10000000
    let timer = Timer()
    let resources = GenerateFakeRandomInteger();
    var i3 = 1.1
    let startTime = timer.getTime()
    let resourcesLength = resources.size
    for (i in 0..count) {
        i3 = Example.differentFoo(resources, i, i3, resourcesLength)
    }
    let midTime = timer.getTime()
    for (i in 0..count) {}
    let endTime = timer.getTime()
    let time = Float64(((midTime - startTime) - (endTime - midTime)).toNanoseconds())/1000000.0 // ms
	print("Static Function Call - RunNormalDifStaticFunc:\t${time}\tms\n")
    return Int64(i3)
}


func runNormalVariableStaticFunc() : Int64 {
    let count = 10000000
    let timer = Timer()
    global = 0
    let startTime = timer.getTime()
    for (i in 0..count) {
        Example.variableFoo(a:1, b:"2", c:true)
    }
    let midTime = timer.getTime()
    for (i in 0..count) {}
    let endTime = timer.getTime()
    let time = Float64(((midTime - startTime) - (endTime - midTime)).toNanoseconds())/1000000.0 // ms
	print("Static Function Call - RunNormalVariableFStaticFunc:\t${time}\tms\n")
    return Int64(time)
}


func runNormalDefStaticCall() : Int64 {
    let count = 10000000
    let timer = Timer()
    let resources = GenerateFakeRandomInteger()
    var i3 = 1
    let startTime = timer.getTime()
    let resourcesLength = resources.size
    for (i in 0..count) {
        i3 = Example.defaultFoo(resources:resources, i:i, i3:i3, resourcesLength: resourcesLength)
    }
    let midTime = timer.getTime()
    for (i in 0..count) {}
    let endTime = timer.getTime()
    let time = Float64(((midTime - startTime) - (endTime - midTime)).toNanoseconds())/1000000.0 // ms
    println(i3)
	print("Static Function Call - RunNormalDefStaticCall:\t${time}\tms\n")
    return Int64(i3)
}



main() {
    runStaticFunction()
    runParameterlessStaticFunction()
    runNormalDifStaticFunc()
    runNormalVariableStaticFunc()
    runNormalDefStaticCall()
    print("Cangjie Static Call Is End, global value : ${global}")
    return 0
}
