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

import std.process.*
import std.time.*
import std.convert.*
import std.convert.*


 class ShifterOperand {
  private static let  LOOP_SIZE :Int32 = 10000
   @OverflowWrapping
   public static func timeLongSingleUseLatency1Thread2(iterations :Int64) :Int64{
    var t1 :Int64 = 0
    var t2 :Int64 = 1
    for (j in 0..iterations) {
      var iter2 :Int64 = 1
      for (iter1 in 0..Int64(LOOP_SIZE)) {
        t1 |= iter1 >> 1
        t1 &= iter1 << 2
        t1 ^= iter1 >> 3
        t1 += Int64(Int8(iter1))
        t1 -= Int64.tryParse(Rune(UInt32(iter1)).toString()) ?? 0
        t1 += Int64(Int16(iter1))

        t2 |= iter2 >> 1
        t2 &= iter2 << 2
        t2 ^= iter2 >> 3
        t2 += Int64(Int8(iter2))
        t2 -= Int64.tryParse(Rune(UInt32(iter2)).toString()) ?? 0
        t2 += Int64(Int16(iter2))
        iter2++
      }
    }
    return t1
  }

 public static func verifyLongSingleUseLatency1Thread2() :Bool{
    let expected :Int64 = 16371
    var found :Int64 = timeLongSingleUseLatency1Thread2(10)
    if (expected != found) {
       println("ERROR: Expected ${expected}" + " but found ${found}")
     return false
    }
    return true
  }

}

@OverflowWrapping
main() :Unit{
    var reps: Int32 = 10
    var args = Process.current.arguments
         if (args.size == 1) {
             var num = Int32.tryParse(args[0])??0
             if (num != 0) {
                 reps = num
             }
         }
     var startTime = DateTime.now()
     ShifterOperand.timeLongSingleUseLatency1Thread2(3000)
     var endTime = DateTime.now()
     var durTime = endTime - startTime
     var perTime: Float64 = Float64(durTime.toNanoseconds())/Float64(reps)
    if(ShifterOperand.verifyLongSingleUseLatency1Thread2() == true){
     print(perTime.format(".2") + "ns\n")
    }else{
     print("Error!\n")
    }

  }

