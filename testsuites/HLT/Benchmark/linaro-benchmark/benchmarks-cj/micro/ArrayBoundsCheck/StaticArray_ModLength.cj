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

class ArrayBoundsCheckStaticArray_ModLength{
  private static let NUM_INVOKES:Int64 = 500
  private static let NUM_RANDS:Int64 = 1024
  private static let static_array : Array<Int64> = Array<Int64>(NUM_RANDS, repeat:0)

  public func timeStaticArray_ModLength(iterations:Int64){
    var res : Int64 = 0
    
    for (iter in 0..iterations){
      for(i in 0..NUM_INVOKES){
        var a : Int64 = static_array[i%static_array.size]
        var b : Int64 = static_array[(i+1)%static_array.size]
        res = a+b
      }
    }
    
  }
  public func verify(){
    var obj:ArrayBoundsCheckStaticArray_ModLength = ArrayBoundsCheckStaticArray_ModLength()
    obj.timeStaticArray_ModLength(1)
    return true
  } 
}

main():Int64{
  var reps : Int64 =  300000
   
  var obj:ArrayBoundsCheckStaticArray_ModLength = ArrayBoundsCheckStaticArray_ModLength()
  var startTime = DateTime.now()
  obj.timeStaticArray_ModLength(reps)
  var endTime = DateTime.now()
  var durTime = endTime - startTime
  var perTime:Float64 = Float64(durTime.toNanoseconds())/Float64(reps)
  if (obj.verify() == true){
    print(perTime.format(".2")+"ns\n")
  } else {
    print("Error!\n")
  }
  return 0 
}