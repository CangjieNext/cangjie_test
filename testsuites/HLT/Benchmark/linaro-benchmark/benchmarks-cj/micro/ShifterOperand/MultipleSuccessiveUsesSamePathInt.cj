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
   public static func timeMultipleSuccessiveUsesSamePathInt(iterations :Int32) :Int32{
    var res :Int32 = 0
    for (j in 0..iterations) {
      for (iter in 0..LOOP_SIZE) {
        var temp1 :Int32 = iter >> 1
        res += temp1
        res += temp1
        var temp2 :Int32 = iter << 2
        res += temp2
        res += temp2
        var temp3 :Int32 = iter >> 3
        res += temp3
        res += temp3
        var temp4 :Int32 = Int32(Int8(iter))
        res += temp4
        res += temp4
        var temp5 :Int32 = Int32.tryParse(Rune(UInt32(iter)).toString()) ?? 0
        res += temp5
        res += temp5
        var temp6 :Int32 = Int32(Int16(iter))
        res += temp6
        res += temp6
        var temp7 :Int32 = Int32(iter)
        res += temp7
        res += temp7

      }
    }
    return res
  }

 public static func verifyMultipleSuccessiveUsesSamePathInt() :Bool{
    let expected :Int32 = -1965831132
    var found :Int32 = timeMultipleSuccessiveUsesSamePathInt(10)
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
     ShifterOperand.timeMultipleSuccessiveUsesSamePathInt(3500)
     var endTime = DateTime.now()
     var durTime = endTime - startTime
     var perTime: Float64 = Float64(durTime.toNanoseconds())/Float64(reps)
    if(ShifterOperand.verifyMultipleSuccessiveUsesSamePathInt() == true){
     print(perTime.format(".2") + "ns\n")
    }else{
     print("Error!\n")
    }

  }

