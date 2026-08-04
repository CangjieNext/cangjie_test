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
}

let timer = Timer()

let input = 3000000

func GenerateFakeRandomInteger(): Array<Int64>{
    let resource: Array<Int64> = [12, 43, 56, 76, 89, 54, 45, 32, 35, 47, 46, 44, 21, 37, 84]
    return resource;
}

func GenerateFakeRandomFloat() : Array<Float64> {
    let resource: Array<Float64> = [12.2, 43.5, 56.2, 76.6, 89.7, 54.9, 45.2, 32.5, 35.6, 47.2, 46.6, 44.3, 21.2, 37.6, 84.57]
    return resource;

}

func GenerateFakeRandomBool(): Array<Bool> {
    let resource: Array<Bool> = [true, false, true, false, true, false, true, false, true, false, true, false, true, false, true]
    return resource
}


func GenerateFakeRandomString(): Array<String> {
    let resource : Array<String>  = ["Op", "HOS", "Op", "HOS", "Op", "HOS", "Op", "HOS", "Op", "HOS", "Op", "HOS", "Op", "HOS", "Op"]
    return resource
}

func GenerateFakeRandomIndex(): Array<Int64> {
	let resource: Array<Int64> = [3, 14, 44, 25, 91, 38, 82, 88, 64, 81, 70, 90, 33, 63, 70];
    return resource;
}

@OverflowWrapping
func integerArray() : Float64 {
    let count = input
    let resources = GenerateFakeRandomInteger()
    let integerIndexes = GenerateFakeRandomIndex();
    var res:  Array<Int64> = [0, 0, 0, 0, 0];
    var num = 1

    timer.start()
    let length = resources.size - 1
    let resLength = res.size - 1
    for (i in 0..count) {

        num += integerIndexes[i % num & length];
        res[i & resLength] = resources[i % num & length];
    }
    let time = timer.stop()
    var tmp: Int64 = 1;
    for (i in 0..5) {
       tmp += res[i] 
    }

    return Float64(time.toNanoseconds())
}


func floatArray() :Float64 {
    let count = 3000000
	var res :Array<Float64> = [0.0, 0.0, 0.0, 0.0, 0.0];
    let resources = GenerateFakeRandomFloat()
    let integerIndexes = GenerateFakeRandomIndex();
    var num = 1

    timer.start()
    let length = resources.size - 1
    let resLength = res.size - 1
    for (i in 0..count) {
        num += integerIndexes[i % num & length];
 
		res[i & resLength] = resources[i % num & length];
    }
    let time = timer.stop()
    var tmp = 0.0;
    for (i in 0..5) {
       tmp += res[i] 
    }

    return Float64(time.toNanoseconds())

}

@OverflowWrapping
func boolArray() : Float64 {
    let count = input
    let resources = GenerateFakeRandomBool()
    let integerIndexes = GenerateFakeRandomIndex();
    var res: Array<Int64> = [0, 0, 0, 0, 0];
    var num = 1
    timer.start()
    let length = resources.size - 1
    let resLength = res.size - 1
    for (i in 0..count) {
        num += integerIndexes[i % num & length];
        if (resources[i % num & length]) {
            res[i & resLength] = integerIndexes[i & length]
        }
    }
    let time = timer.stop()
    var tmp = 0;
    for (i in 0..5) {
       tmp += res[i] 
    }

    return Float64(time.toNanoseconds())
}

func stringArray() :Float64 {
    let count = 3000000 / 100
    let resources = GenerateFakeRandomString()
    var res: Array<Int64> = Array<Int64>(3,repeat:0)
    timer.start()
    for (i in 0..count) {
        res[i % res.size] += resources[i % 15].size;
    }
    let time = timer.stop()
    var sum = 0
    for (i in 0..res.size) {
        sum += res[i]
    }

    return Float64(time.toNanoseconds())
}

class Obj {
    var value: Int64 = 0
    init(value: Int64) {
        this.value = value
    }
}
func GenerateFakeRandomObject() :Array<Obj>{
    let resource: Array<Obj> = Array<Obj>(15,repeat:Obj(Random().nextInt64(9)+1))
    return resource
}


func objectArray() :Float64 {
    let count = input

    var res:Array<Obj>= Array<Obj>(5,repeat:Obj(Random().nextInt64(9)+1))
    let resources = GenerateFakeRandomObject()
    timer.start()
    for (i in 0..count) {
      
        res[i % 5] = resources[i % 15];
    }
    let time = timer.stop()
  
    var tmp = 1;
    for (i in 0..5) {
        tmp += res[i].value
    }

    return Float64(time.toNanoseconds())
}

main() {
    println("Array Access - IntegerArray:\t ${integerArray()/1000000.0} \tms")
    println("Array Access - FloatArray:\t ${floatArray()/1000000.0} \tms")
    println("Array Access - BoolArray:\t ${boolArray()/1000000.0} \tms")
    println("Array Access - StringArray:\t ${stringArray()/1000000.0} \tms")
    println("Array Access - ObjectArray:\t ${objectArray()/1000000.0} \tms")
    return 0
}