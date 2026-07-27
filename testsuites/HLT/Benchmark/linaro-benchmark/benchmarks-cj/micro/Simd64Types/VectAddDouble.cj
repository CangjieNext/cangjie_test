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

class Simd64Types {
  public static let LENGTH :Int32 = 3 * 1024
  public var la : Array<Int64> = Array<Int64>()
  public var lb : Array<Int64> = Array<Int64>()
  public var lc : Array<Int64> = Array<Int64>()
  public var da : Array<Float64> = Array<Float64>()
  public var db : Array<Float64> = Array<Float64>()
  public var dc : Array<Float64> = Array<Float64>()

func setupArrays() :Unit{
    da = Array<Float64>(Int64(LENGTH), repeat: 0.0)
    db = Array<Float64>(Int64(LENGTH), repeat: 0.0)
    dc = Array<Float64>(Int64(LENGTH), repeat: 0.0)

    for (i in 0..Int64(LENGTH)) {
      da[i] = Float64(i) + 3.0
      db[i] = Float64(i) + 2.0
    }
  }

  @OverflowWrapping
  public static func vectAddDouble(da :Array<Float64>,db :Array<Float64>,dc :Array<Float64>) :Unit{
   for (i in 0..Int64(LENGTH)) {
      dc[i] = da[i] + db[i]
    }
  }

  public func timeVectAddDouble(iters :Int32) :Unit{
    for (i in 0..iters) {
      vectAddDouble(da, db, dc)
    }
  }



}

 let ITER_COUNT :Int32 = 50000
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
    let obj:Simd64Types  =  Simd64Types()
    obj.setupArrays()
    var startTime = DateTime.now()
    obj.timeVectAddDouble(ITER_COUNT)
    var endTime = DateTime.now()
    var durTime = endTime - startTime
    var perTime: Float64 = Float64(durTime.toNanoseconds())/Float64(reps)

    print(perTime.format(".2") + "ns\n")

}
