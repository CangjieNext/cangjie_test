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

func fannkuch(n : Int64): Int64{
    var check = 0
    var perm = Array<Int64>(n, repeat:0)
    var perm1 = Array<Int64>(n, repeat:0)
    var count = Array<Int64>(n, repeat:0)
    var maxPerm = Array<Int64>(n, repeat:0)
    var maxFlipsCount = 0
    let m = n - 1
    
    for (i in 0..n) {
        perm1[i] = i
    }
    var r = n
    
    while(true){

        if (check < 30) {
            var s = ""
            for (i in 0..n) {
                s = s + "${perm1[i]+1}"
                check += 1
            }
        }
        
        while(r != 1){
            count[r - 1] = r
            r -= 1
            
        }
        
        if (!(perm1[0] == 0 || perm1[m] == m)) {
            for (i in 0..n) {
                perm[i] = perm1[i]
            }

            var flipsCount = 0
            var k = 0

             while (!(perm[0] == 0)) {
                k = perm[0]
                let k2 = (k + 1) >> 1
                 for (i in 0..k2) {
                   let temp = perm[i]
                     perm[i] = perm[k - i]
                     perm[k - i] = temp
                }
                flipsCount += 1
             }

             if (flipsCount > maxFlipsCount) {
                maxFlipsCount = flipsCount
                 for (i in 0..n) {
                     maxPerm[i] = perm1[i]
                 }
             }
          }
        
        while (true) {
            if (r == n) {
                return maxFlipsCount
            }
            let perm0 = perm1[0]
             var i = 0
             while (i < r) {
                 let j = i + 1
                perm1[i] = perm1[j]
                i = j
             }
             perm1[r] = perm0

            count[r] = count[r] - 1
            if (count[r] > 0) {
                break
            }
             r += 1
          }
    }
    return maxFlipsCount
}

func run(){
    let n = 8
    let ret = fannkuch(n)

    let expected = 22
    if (ret != expected){
        println("ERROR: bad result: expected ${expected} but got ${ret}")
    }
}

class Timer {
    public func getTime() {
        let time = DateTime.now()
        return time 
    }
}

/*
 * @State
 * @Tags Jetstream2
 */
 class Benchmark {
    /*
    * @Benchmark
    */
    func runIterationTime() {
        let start = Timer().getTime()
        for (_ in 0..80) {
            run()
        }
        let end = Timer().getTime()
        println("access-fannkuch: ms = ${Float64((end-start).toNanoseconds())/1000000.0}")
    }
 }

main() {
    Benchmark().runIterationTime()
}
