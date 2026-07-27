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



class IntMM {
    private static var rowsize : Int64 = 40
    private static var INTMM_ITERS : Int64 = 10
    private static var EXPECTED : Int64 = 300
    private var seed : Int64 = 0
    private  var ima : Array<Array<Int64>> = Array<Array<Int64>>(rowsize + 1, repeat:Array<Int64>(rowsize + 1,repeat:0))
    private  var imb : Array<Array<Int64>> = Array<Array<Int64>>(rowsize + 1, repeat:Array<Int64>(rowsize + 1,repeat:0))
    private  var imr : Array<Array<Int64>> = Array<Array<Int64>>(rowsize + 1, repeat:Array<Int64>(rowsize + 1,repeat:0))

    public func Initrand(){
        seed = 74755
    }

    public func Rand():Int32{
        seed = (seed * 1309 + 13849) & 65535
        return (Int32(seed))
    }

    private func Initmatrix(m:Array<Array<Int64>>):Unit{
        var temp : Int32 = 0
        for (i in 1..rowsize){
            for (j in 1..rowsize){
                temp = Rand()
                m[Int64(i)][Int64(j)] = Int64(temp) -(Int64(temp)/120)*120 - 60
            }
        }
    }

    public func Innerproduct (result:Array<Array<Int64>>,a:Array<Array<Int64>>,b:Array<Array<Int64>>,row:Int64,column:Int64):Unit{
        var tmp :Int64= 0
        for (i in 0..rowsize){
            tmp = tmp + a[row][Int64(i)] * b[Int64(i)][column]
            result[row][column] = tmp
        }
    }

    public func Intmm(run :Int32):Unit{
        Initrand()
        Initmatrix(ima)
        Initmatrix(imb)
        for (i in 1..rowsize){
            for (j in 1..rowsize){
                Innerproduct(imr,ima,imb,i,j)
            }
        }
    }
    
    public func timeIntmm(iters : Int32){
        for (i in 0..iters){
            for (j in 0..INTMM_ITERS){
                Intmm( Int32(j))
            }
        }
    }

    public func verify():Bool{
        var re : Int32 = 1
        var obj : IntMM = IntMM()
        obj.timeIntmm(re)
        return obj.imr[INTMM_ITERS][INTMM_ITERS] == EXPECTED
    }
}

main():Int64{
    var reps : Int32 = 120
    var args = Process.current.arguments
    if (args.size == 1) {
        var num = Int32.tryParse(args[0])??0
        if (num != 0) {
            reps = num
        }
    }

     var obj: IntMM = IntMM()

    var startTime = DateTime.now()
    obj.timeIntmm(reps)
    var endTime = DateTime.now()
    var durTime = endTime - startTime
    var perTime: Float64 = Float64(durTime.toNanoseconds())/Float64(reps)

    if (obj.verify() == true) {
   
        print("Error!\n")
    } else {

        print(perTime.format(".2") + "ns\n")
    }

    return 0
}
