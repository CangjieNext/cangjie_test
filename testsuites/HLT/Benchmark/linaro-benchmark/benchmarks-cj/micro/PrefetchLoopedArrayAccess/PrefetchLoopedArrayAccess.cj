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

import std.time.*
import std.collection.*
import std.random.*
import std.convert.*
import std.convert.*
import std.process.*

 class PrefetchLoopedArrayAccess {

  public static let rnd :Random= Random()
  public static let POOL_Size :Int32 = 1024
  public static let  UPDATE_Size :Int32= 1024

  public var bits :ArrayList<ArrayList<Int32>> = ArrayList<ArrayList<Int32>>()
  public var updateList :ArrayList<ArrayList<Int32>> = ArrayList<ArrayList<Int32>>()

  public init(){
    initBitSets()
    initUpdateList()
  }
  public var index_b :Int64 = -1
  private func initUpdateList() :Unit{
    updateList = ArrayList<ArrayList<Int32>>(Int64(UPDATE_Size))
    for (i in 0..Int64(UPDATE_Size)) {
    index_b = Int64(rnd.nextUInt32(UInt32(POOL_Size)))
      updateList.add(bits[index_b])
    }
  }
  public var buf_f :ArrayList<Int32> = ArrayList<Int32>()
  private func initBitSets() :Unit{
    bits = ArrayList<ArrayList<Int32>>(Int64(POOL_Size))
    for (i in 0..Int64(POOL_Size)) {
      bits.add(buf_f)
    }
  }

  private func updateBitSets() :Unit{
    for (i in 0..Int64(UPDATE_Size)) {
      updateList[i].add(Int32(7))
    }
  }

  public func timeRun(iterations :Int32) :Unit{
    for (i in 0..iterations) {
      updateBitSets()
    }
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
     let obj :PrefetchLoopedArrayAccess = PrefetchLoopedArrayAccess()
     var startTime = DateTime.now()
     obj.timeRun(22000)
     var endTime = DateTime.now()
     var durTime = endTime - startTime
     var perTime: Float64 = Float64(durTime.toNanoseconds())/Float64(reps)

     print(perTime.format(".2") + "ns\n")
  }







