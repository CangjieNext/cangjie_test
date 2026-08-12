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
   public static func timeIntSingleUseLatency1Thread3(iterations :Int32) :Int32{
    var t1 :Int32 = 0
    var t2 :Int32 = 1
    var t3 :Int32 = 2
    for (j in 0..iterations) {
      var iter2 :Int32 = 1
      var iter3 :Int32 = 2
      for (iter1 in 0..LOOP_SIZE) {
        t1 |= iter1 >> 1
        t1 &= iter1 << 2
        t1 ^= iter1 >> 3
        t1 += Int32(Int8(iter1))
        t1 -= Int32.tryParse(Rune(UInt32(iter1)).toString()) ?? 0
        t1 += Int32(Int16(iter1))

        t2 |= iter2 >> 1
        t2 &= iter2 << 2
        t2 ^= iter2 >> 3
        t2 += Int32(Int8(iter2))
        t2 -= Int32.tryParse(Rune(UInt32(iter2)).toString()) ?? 0
        t2 += Int32(Int16(iter2))
        iter2++

        t3 |= iter3 >> 1
        t3 &= iter3 << 2
        t3 ^= iter3 >> 3
        t3 += Int32(Int8(iter3))
        t3 -= Int32.tryParse(Rune(UInt32(iter3)).toString()) ?? 0
        t3 += Int32(Int16(iter3))
        iter3++
      }
    }
    return t1
  }

 public static func verifyIntSingleUseLatency1Thread3() :Bool{
    let expected :Int32 = 16371
    var found :Int32 = timeIntSingleUseLatency1Thread3(10)
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
     ShifterOperand.timeIntSingleUseLatency1Thread3(2000)
     var endTime = DateTime.now()
     var durTime = endTime - startTime
     var perTime: Float64 = Float64(durTime.toNanoseconds())/Float64(reps)
    if(ShifterOperand.verifyIntSingleUseLatency1Thread3() == true){
     print(perTime.format(".2") + "ns\n")
    }else{
     print("Error!\n")
    }
  }

