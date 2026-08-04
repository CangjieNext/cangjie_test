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
// The Great Computer Language Shootout
//  http://shootout.alioth.debian.org
//
//  Contributed by Ian Osgood

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

func pad(number: Int64, width: Int64): String {
    var s = "${number}"
    let prefixWidth = width - s.size
    if (prefixWidth > 0) {
        for (_ in 0..prefixWidth) {
            s = " " + s
        }
    }
    return s;
}

@OverflowWrapping
func primes(isPrime: Array<Int64>, n: Int64) {
    var count = 0
    let m = 10000<<n
    let size = (m+31)>>5
    for (i in 0..size) {
        isPrime[i] = 0xffffffff
    }
    for (i in 2..m) {
        if ((isPrime[i>>5] & 1<<(i % 32)) != 0) {
            var j = i+i
            while (j < m) {
                var tmp = transBigInt32(isPrime[j>>5])
                tmp &= transBigInt32(!(1<<(j&31)))
                isPrime[j>>5] = tmp
                j+=i
            }            
            count += 1
        }
    }
}

func sieve() : Array<Int64> {
    var isPrime = Array<Int64>()
    for (i in 4..=4) {
        isPrime = Array<Int64>((((10000<<i)+31)>>5), repeat: 0)
        primes(isPrime, i);
    }
    
    return isPrime;
}

/*
 * @State
 * @Tags Jetstream2
 */
 class Benchmark {
    /*
    * @Benchmark
    */
    func run() {
        let result = sieve();
        var sum = 0;
        for (i in 0..result.size) {
            sum += result[i]
        }

        let expected = -1286749544853;
        if (sum != expected) {
            throw Exception("ERROR: bad result: expected ${expected} but got ${sum}")
        }
    }
 }

class Timer {
    public func getTime() {
        let time = DateTime.now()
        return time 
    }
}

func transBigInt32(bigInt32Num: Int64) : Int64 {
    var tmp = bigInt32Num
    if (tmp > 2147483647) {
        let max = 4294967295
        tmp = tmp % (max + 1)
        if (tmp > 2147483647){
            tmp = tmp - max - 1
        }
    }else if (tmp < -2147483648){
        let max = 4294967295
        tmp = tmp % (max + 1)
        if (tmp < -2147483648) {
            tmp = tmp + max + 1
        }
    }
    return tmp
}

main() {
    let startTime = currentTimestamp13()
    for (i in 0..80) {
        let startTimeInLoop = currentTimestamp13()
        Benchmark().run()
        let endTimeInLoop = currentTimestamp13()

    }
    let endTime = currentTimestamp13()
    println("bitops-nsieve-bits: ms = ${Float64((endTime-startTime).toNanoseconds())/1000000.0}")
}
