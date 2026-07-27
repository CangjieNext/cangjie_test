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

func fannkuch(n: Int64) : Int64 {
   
   var perm = Array(n, repeat:0)
   var count =  Array(n, repeat:0)

   var perm1 = Array(n, repeat:0)
   
   for (j in 0..n-1) { 
       perm1[j] = j 
   }

   var f = 0
   var i = 0 
   var k = 0
   var r = 0
   var flips = 0
   var nperm = 0
   var checksum = 0

   r = n
   while (r > 0) {
      i = 0
      while (r != 1) { count[r-1] = r; r -= 1 }
      while (i < n) { perm[i] = perm1[i]; i += 1 }

      // Count flips and update max  and checksum
      f = 0
      k = perm[0]
      while (k != 0) {
         i = 0
         while (2*i < k) {
            let t = perm[i]; perm[i] = perm[k-i]; perm[k-i] = t
            i += 1
         }
         k = perm[0]
         f += 1
      }
      if (f>flips) { flips = f }
      if ((nperm&0x1)==0) { checksum += f } else { checksum -= f }

      // Use incremental change to generate another permutation
      var go = true
      while (go) {
         if (r == n) {
            return flips
         }
         let p0 = perm1[0]
         i = 0
         while (i < r) {
            let j = i+1
            perm1[i] = perm1[j]
            i = j
         }
         perm1[r] = p0

         count[r] -= 1
         if (count[r] > 0) { go = false } else { r += 1 }
      }
      nperm += 1
   }
   return flips
}

func runFannkuc_Redux():Int64{
   let n: Int64 = 8
   timer.start()
   fannkuch(n)
   let time = timer.stop()
   println("Array Access - RunFannkucRedux:\t${Float64(time.toNanoseconds())/1000000.0}\tms")
   return Int64(time.toMilliseconds())
}


main(){
    runFannkuc_Redux()
    return 0
}
