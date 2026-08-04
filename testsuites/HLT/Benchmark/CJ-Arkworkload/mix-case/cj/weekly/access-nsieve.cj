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

func pad(number : Int64, width : Int64): String {
    var s = "${number}"
    let prefixWidth = width - s.size
    if (prefixWidth > 0) {
        for (_ in 1..=prefixWidth) {
            s = " " + s
        }
    }
    return s
}

func nsieve(m : Int64, isPrime : Array<Int32> ): Int32 {
    var count : Int32
    for (i in 2..=m) {
        isPrime[i] = 1
    }
    count = 0
    
    for (i in 2..=m) {
        if (isPrime[i] == 1) {
            var k = i + i
            while (k <= m) {
                isPrime[k] = 0
                k += i
            }
            count += 1
        }
    }
    return count
}

func sieve(): Int32 {
    var sum : Int32 = 0
    for (i in 1..=3) {
        
        let m = (1<<i)*10000
        var flags = Array<Int32>(m+1, repeat: 0)
        sum += nsieve(m, flags)
    }
    return sum
}


/*
 *@State
 *@Tags Jetstream2
 */
class Benchmark {
    func run() {
        let result = sieve();
        let expected : Int32  = 14302;
        if (result != expected){
          println("ERROR: bad result: expected  ${expected}  but got ${result}");
        }
    }
    
   /*
    * @Benchmark
    */
    func runIterationTime() {
        let start = Timer().getTime()
        for (_ in 0..80) {
          run()
        }
        let end = Timer().getTime()
        println("access-nsieve: ms = ${Float64((end-start).toNanoseconds())/1000000.0}")
    }
}


class Timer {
    public func getTime() {
        let time = DateTime.now()
        return time 
    }
}

main(){
    Benchmark().runIterationTime()
}
