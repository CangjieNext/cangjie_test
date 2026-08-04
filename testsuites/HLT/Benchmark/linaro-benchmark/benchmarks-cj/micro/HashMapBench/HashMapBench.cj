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
import std.collection.*

 class HashMapBench {
  public static let  COUNT:Int32 = 5000
  public static let  resultExpect:Int32 = 1050000
  public static let  keySumExpect:Int64 = 12497500
  public static let  valueSumExpect:Int32 = 210000
  private var  result:Int32 = 0
  private var  keySum:Int64 = 0
  private var  valueSum:Int32 = 0

  private var map : HashMap<Int32, Int32> = HashMap<Int32, Int32>()
  public var map_kes : HashSet<Int32> = HashSet<Int32>()
  public var map_values : Array<Int32> = []

  public func timeTestHashMap(iters:Int32) :Unit{
  for (i in 0..iters) {
        for (j in 0..COUNT) {
          map.add(j, 42)
        }

        for (k in 0..5) {
          for (j in 0..COUNT) {
            result += Int32.tryParse((map.get(j)?? -2).toString()) ?? -1
          }
        }

        for ( (x,y) in map){
            keySum += Int64(x)
            valueSum += y
        }
     }
   }

   public func  verify() :Bool{
       var verified :Bool = true
       if (result != resultExpect) {
         println("ERROR: Expected result ${resultExpect} but found ${result}")
         verified = false
       }

       if (keySum != keySumExpect) {
          println("ERROR: Expected keySum ${keySumExpect} but found ${keySum}")
         verified = false
       }

       if (valueSum != valueSumExpect) {
         println("ERROR: Expected valueSum ${valueSumExpect} but found ${valueSum}")
         verified = false
       }

       return verified
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
     let obj :HashMapBench = HashMapBench()
     var startTime = DateTime.now()
     obj.timeTestHashMap(100)
     var endTime = DateTime.now()
     var durTime = endTime - startTime
     var perTime: Float64 = Float64(durTime.toNanoseconds())/Float64(reps)

     print(perTime.format(".2") + "ns\n")
  }