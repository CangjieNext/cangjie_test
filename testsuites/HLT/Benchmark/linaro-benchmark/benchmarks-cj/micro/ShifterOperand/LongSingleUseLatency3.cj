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
   public static func timeLongSingleUseLatency3(iterations :Int64) :Int64{
    var t1 :Int64 = 0
    var t2 :Int64 = 0
    var t3 :Int64 = 0
    for (j in 0..iterations) {
      for (iter in 0..Int64(LOOP_SIZE)) {
        t1 |= iter >> 1
        t2 &= iter << 2
        t3 ^= iter >> 3
        t1 += Int64(Int8(iter))
        t2 -= Int64.tryParse(Rune(UInt32(iter)).toString()) ?? 0
        t3 += Int64(Int16(iter))
      }
    }
    return t1 | t2
  }

 public static func verifyLongSingleUseLatency3() :Bool{
    let expected :Int64 = 28015630
    var found :Int64 = timeLongSingleUseLatency3(10)
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
     ShifterOperand.timeLongSingleUseLatency3(5000)
     var endTime = DateTime.now()
     var durTime = endTime - startTime
     var perTime: Float64 = Float64(durTime.toNanoseconds())/Float64(reps)
    if(ShifterOperand.verifyLongSingleUseLatency3() == true){
     print(perTime.format(".2") + "ns\n")
    }else{
     print("Error!\n")
    }

  }

