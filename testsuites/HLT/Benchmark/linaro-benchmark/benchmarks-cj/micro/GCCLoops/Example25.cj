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

 let N :Int32 = 1024
 class GCCLoops {
  private  let M :Int32 = 32
  private  let K :Int32 = 4

 public var usa : Array<Rune> = Array<Rune>(Int64(N),repeat:r'a')
 public var sb : Array<Int16> = Array<Int16>(Int64(N),repeat:0)
 public var sc : Array<Int16> = Array<Int16>(Int64(N),repeat:0)
 public var fa : Array<Float32> = Array<Float32>(Int64(N),repeat:0.0)
 public var fb : Array<Float32> = Array<Float32>(Int64(N),repeat:0.0)
 public var fc : Array<Float32> = Array<Float32>(Int64(N),repeat:0.0)
 public var fd : Array<Float32> = Array<Float32>(Int64(N),repeat:0.0)

 public var a : Array<Int32> = Array<Int32>(Int64(N*2),repeat:0)
 public var b : Array<Int32> = Array<Int32>(Int64(N*2),repeat:0)
 public var c : Array<Int32> = Array<Int32>(Int64(N*2),repeat:0)
 public var d : Array<Int32> = Array<Int32>(Int64(N*2),repeat:0)

private static let MAT_N :Int32 = 128
private static let MAT_M :Int32 = 32
var matrixA_m_n : Array<Array<Int32>> = Array<Array<Int32>>(Int64(MAT_M*2),repeat:Array<Int32>(Int64(MAT_N*2),repeat:0))
var matrixB_m_n : Array<Array<Int32>> = Array<Array<Int32>>(Int64(MAT_M*2),repeat:Array<Int32>(Int64(MAT_N*2),repeat:0))
var matrixA_n_m : Array<Array<Int32>> = Array<Array<Int32>>(Int64(MAT_N*2),repeat:Array<Int32>(Int64(MAT_M*2),repeat:0))
var matrixB_n_m : Array<Array<Int32>> = Array<Array<Int32>>(Int64(MAT_N*2),repeat:Array<Int32>(Int64(MAT_M*2),repeat:0))
var G : Array<Array<Int32>> = Array<Array<Int32>>(Int64(MAT_M),repeat:Array<Int32>(Int64(MAT_N),repeat:0))

// Arrays used for output.
var out : Array<Int32> = Array<Int32>(Int64(N*2),repeat:0)
var iout : Array<Int32> = out.clone()
var out1 : Array<Int32> = out.clone()
var out2 : Array<Int32> = Array<Int32>(Int64(N*2),repeat:0)
var sout : Array<Int16> = Array<Int16>(Int64(N),repeat:0)

func setupArrays() :Unit{
  initArrayI(b)
  initArrayI(c)
  initArrayF(fa)
  initArrayF(fb)
  initArrayF(fc)
  initArrayF(fd)
}

 public static func initArrayF(array:Array<Float32>) :Unit{
   for (i in 0..array.size) {
     array[Int64(i)] = Float32(Int32(i) % INIT_CONSTANT)
   }
 }

  public static let  INIT_CONSTANT:Int32 = 13
  public static func initArrayI(array:Array<Int32>) :Unit{
    for (i in 0..array.size) {
      array[Int64(i)] = (Int32(i) % INIT_CONSTANT)
    }
  }

  public func  timeExample25(iters:Int32) :Unit{
   for (i in 0..iters) {
     example25(fa, fb, fc, fd, out)
   }
 }



  public func example25 (fa:Array<Float32>, fb:Array<Float32>,fc:Array<Float32>, fd:Array<Float32>,out:Array<Int32>) :Unit{
     var x:Rune
     var y:Rune
     var  arr_pi_1 :UInt32
     var  arr_pi_2 :UInt32
     for (i in 0..N) {
         arr_pi_1 = match{
             case fa[Int64(i)] < fb[Int64(i)] => 1
             case _ => 0
         }
         x = Rune(UInt32(arr_pi_1))
         arr_pi_2 = match{
             case fc[Int64(i)] < fd[Int64(i)] => 1
             case _ => 0
         }
          y = Rune(UInt32(arr_pi_2))
         out[Int64(i)] = Int32(UInt32(x)) & Int32(UInt32(y))
       }
   }

}

   let ITER_COUNT :Int32 = 1000
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
    let obj:GCCLoops  =  GCCLoops()
    obj.setupArrays()
    var startTime = DateTime.now()
    var v1 =  obj.timeExample25(ITER_COUNT)
    var endTime = DateTime.now()
    var durTime = endTime - startTime
    var perTime: Float64 = Float64(durTime.toNanoseconds())/Float64(reps)

    print(perTime.format(".2") + "ns\n")

}

