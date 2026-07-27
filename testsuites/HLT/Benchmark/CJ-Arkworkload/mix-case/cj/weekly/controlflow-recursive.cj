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
// The Computer Language Shootout
// http://shootout.alioth.debian.org/
// contributed by Isaac Gouy
import std.time.*

let inDebug = false
func log(str: String) {
    if (inDebug) {
        print(str)
    }
}

func currentTimestamp13() {
    return Timer().getTime()
}

@OverflowWrapping
func ack(m: Int64, n: Int64) : Int64 {
   if (m==0) { return n+1; }
   if (n==0) { return ack(m-1,1); }
   return ack(m-1, ack(m,n-1) );
}

@OverflowWrapping
func fib(n: Float64) : Int64 {
    if (n < 2.0) { return 1; }
    return fib(n-2.0) + fib(n-1.0);

}

@OverflowWrapping
func tak(x: Int64, y: Int64, z: Int64) : Int64 {
    if (y >= x) { return z; }
    return tak(tak(x-1,y,z), tak(y-1,z,x), tak(z-1,x,y));
}

func run() {
    var result = 0;
    
    for (i in 3..=5) {
        result += ack(3,i)
        result += fib(17.0+Float64(i))
        result += tak(3*i+3,2*i+2,i+1)
    }

    let expected = 57775;
    if (result != expected) {
        throw Exception("ERROR: bad result: expected ${expected} but got ${result}")
    }
}

class Timer {
    public func getTime() {
        let time = DateTime.now()
        return time 
    }
}

main() {
    let startTime = currentTimestamp13()
    for (i in 0..80) {
        let startTimeInLoop = currentTimestamp13()
        run()
        let endTimeInLoop = currentTimestamp13()
    }
    let endTime = currentTimestamp13()
    println("controlflow-recursive: ms = ${Float64((endTime-startTime).toNanoseconds())/1000000.0}")
}
