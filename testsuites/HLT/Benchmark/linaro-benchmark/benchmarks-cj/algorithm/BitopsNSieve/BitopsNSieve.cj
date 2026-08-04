/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 %overflow_wrapping %f -o %output
// RUN-EXEC: %export cjHeapSize=16GB && %export JETVMPROP="-Xmx2G" && %run %run_opt %output %run_args

/*
 * Description:       Bitops prime number sieve, used for finding prime numbers.
 *
 * Main Focus:        Bitwise operations.
 */

import std.process.*
import std.time.*
import std.convert.*
import std.convert.*

class BitopsNSieve {
    private static var BITOPS_NSIEVE_EXPECTED: Int32 = -1431657430

    private func pad(n: Int32, width: Int32): String {
        var s: String = n.toString()

        while (s.size < Int64(width)) {
            s = " " + s
        }
        return s
    }

    @OverflowWrapping
    private func primes(isPrime: Array<Int32>, n: Int32): Unit {
        var count: Int32 = 0
        var m: Int32 = 10000 << n
        var size: Int32 = m + 31 >> 5

        var num = 0x7fffffff + 0x7fffffff + 1
        for (i in 0..size) {
            isPrime[Int64(i)] = Int32(num)
        }

        for (i in 2..Int64(m)) {
            var op1 = isPrime.get(Int64(i >> 5))
            var res1 = matchResult<Int32>(op1, 0)
            if ((res1 & 1 << (i & 31)) != 0) {
                for (j in (i+1)..Int64(m):i) {
                    var index = Int64(j) >> 5
                    isPrime[index] &= ! (1 << (j & 31))
                }
                count ++
            }
        }
    }

    private func sieve(): Array<Int32> {
        var isPrime: Array<Int32> = Array<Int32>()

        for (i in 4..5) {
            isPrime = Array<Int32>((10000 << i) + 31 >> 5, repeat:0)
            primes(isPrime, Int32(i))
        }
        return isPrime
    }

    public func timeBitopsNSieve(iters: Int32): Unit {
        for (i in 0..iters) {
            sieve()
        }
    }

    @OverflowWrapping
    public func verify(): Bool {
        var output: Int32 = 0
        var result: Array<Int32> = sieve()

        for (i in 0..result.size) {
            var op = result.get(Int64(i))
            var res = matchResult<Int32>(op, 0)
            output += res
        }
        return output == BITOPS_NSIEVE_EXPECTED
    }
}

func matchResult<T>(x: Option<T>, default: T): T {
    var result = match (x) {
        case Some(y) => y
        case None => default
    }
    return result
}

main(): Int64 {
    var reps: Int32 = 189

    var args = Process.current.arguments
    if (args.size == 1) {
        var num = Int32.tryParse(args[0])??0

        if (num != 0) {
            reps = num
        }
    }

    var obj: BitopsNSieve = BitopsNSieve()

    var startTime = DateTime.now()
    obj.timeBitopsNSieve(reps)
    var endTime = DateTime.now()
    var durTime = endTime - startTime
    var perTime: Float64 = Float64(durTime.toNanoseconds())/Float64(reps)

    if (obj.verify() == true) {
        print(perTime.format(".2") + "ns\n")
    } else {
        print("Error!\n")
    }

    return 0
}
