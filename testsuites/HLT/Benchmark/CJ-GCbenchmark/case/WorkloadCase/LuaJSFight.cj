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


let LOOP_NUMBER = 40000
let TIMES_KILO_MILLISECONDS = 1000;
let BENCHMARK_COUNT = 120
let NUM_1 = 1;
let NUM_2 = 2;
let NUM_3 = 3;
let NUM_4 = 4;
let NUM_5 = 5;
let NUM_6 = 6;
let NUM_7 = 7;
class Timer {
    // ms
    public func getTime() {
        let time = DateTime.now()
        return time
    }
}
func deBugLog(str: String) {
    print(str)
}
func run() {
    println("Hello world!")

    let m = LOOP_NUMBER
    var j = 0
    var strItems: ArrayList<String> = ArrayList<String>()
    func addStrElement() {
        while (j < m) {
            strItems.add("digit${j}")
            j = j + 1
        }
    }
    addStrElement()

    let n = LOOP_NUMBER
    var i = 0
    var items: ArrayList<Int64> = ArrayList<Int64>()
    func addElement() {
        while (i < n) {
            items.add(i)
            i += 1
        }
    }
    addElement()
    
    func firstWhere(list: Array<Int64>,fn:(x: Int64)->Bool): Int64{
        for (x in list) {
            if((fn(x)))
            {
                return x
            }
        }
        return 0

    }
    let nums: Array<Int64> = [NUM_1, NUM_2, NUM_3, NUM_4, NUM_5, NUM_6, NUM_7]
    func isEven(x: Int64): Bool{
        return (x & 1) == 0
    }
    let firstEven = firstWhere(nums, isEven)
}

class LuaJSFight {
    /*
     * @LuaJSFight
     */
    func runIteration(){
        let before = Timer().getTime()
        for (_ in 0..BENCHMARK_COUNT) {
            run()
        }
        let after = Timer().getTime()
        println("LuaJSFight: ms = ${Float64((after-before).toNanoseconds())/1000000.0}")
    }
}

main() {
    let benchmark = LuaJSFight()
    benchmark.runIteration()
}
