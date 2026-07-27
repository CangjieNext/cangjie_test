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

class Timer {
    private var start_time: DateTime = DateTime.now()
    private var end_time: DateTime = DateTime.now()

    public func start() {
        start_time = DateTime.now()
    }

    public func stop(): Duration {
        end_time = DateTime.now()
        end_time - start_time
    }
}
// ms
public func getTime(): Float64 {
    let time = DateTime.now()
    return Float64(time.second) * 1000.0 + Float64(time.nanosecond) / 1000000.0
}

@OverflowWrapping
func picColorFromBuffer(e: EData) {
    let data = e.data
    if (data.data.isEmpty()) {
        println("dingwen input error")
        return
    }
    let msgType: String = data.TYPE
    let readBuffer: Array<Int64> = data.data
    let len: Int = data.len / 4
    match (msgType) {
        case "pickColor" =>
            let intBuffer: Array<Int64> = readBuffer
            var r: Int = 0
            var g: Int = 0
            var b: Int = 0
            var a: Int = 0
            for (i in 0..len) {
                r += intBuffer[i * 4]
                g += intBuffer[i * 4 + 1]
                b += intBuffer[i * 4 + 2]
                a += intBuffer[i * 4 + 3]
            }
            let r1 = round(Float64(r) / Float64(len))
            let g1 = round(Float64(g) / Float64(len))
            let b1 = round(Float64(b) / Float64(len))
            let a1 = round(Float64(a) / Float64(len))
        //	  print("Takecolor pinColorFormBuffer color[ARGB] :\t\(a1)\t\(r1)\t\(b1)\t\(g1)")
            return 
        case _ => 
            return 
        //   break
    }
}

class Data {
    var TYPE: String
    var data: Array<Int64>
    var len: Int64
    init(mType: String, mData: Array<Int64>, mLen: Int64) {
        this.TYPE = mType
        this.data = mData
        this.len = mLen
    }
}

class EData {
    var data: Data
    init(mData: Data) {
        this.data = mData
    }
}

main() {
    var timer = Timer()
    var uint8Array: Array<Int64> = Array<Int64>(500 * 500, {x: Int64 => 0})
    for (i in 0..uint8Array.size) {
        uint8Array[i] = i % 256
    }
    var data: Data = Data("pickColor", uint8Array, 500 * 500)
    var eData: EData = EData(data)
    timer.start()
    for (i in 0..10) {
        picColorFromBuffer(eData)
    }
    var time = timer.stop();
    println("Takecolor_Obj:\t ${Float64(time.toNanoseconds())/1000000.0}\tms");
}
