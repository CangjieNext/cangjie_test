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


class RealMM{
    public static let rowsize : Int64 = 40
    public var rma : Array<Array<Float64>> = Array<Array<Float64>>(rowsize + 1, repeat:Array<Float64>(rowsize + 1,repeat:0.0))
    public var rmb : Array<Array<Float64>> = Array<Array<Float64>>(rowsize + 1, repeat:Array<Float64>(rowsize + 1,repeat:0.0))
    public var rmr : Array<Array<Float64>> = Array<Array<Float64>>(rowsize + 1, repeat:Array<Float64>(rowsize + 1,repeat:0.0))
    public var seed : Int64 = 0

    public func Initrand(){
        seed = 74755
    }

    public func Rand():Int64{
        seed = (seed*1309+13849) & 65535
        return seed
    }

    public func rInitmatrix(m : Array<Array<Float64>>){
        var temp : Int64 = 0
        for (i in 1..rowsize){
            for (j in 1..rowsize){
                temp = Rand()
                m[i][j] = Float64((temp - (temp/120)*120 - 60)/3) 
            }
        }
    }

    public func rInnerproduct(result : Array<Array<Float64>>, a : Array<Array<Float64>>, b : Array<Array<Float64>>,row : Int64,column: Int64){
        result[row][column] = 0.0
        for (i in 1..rowsize){
            result[row][column] = result[row][column]+a[row][i]*b[i][column]
        }
    }

    public func Mm(run : Int32){
        Initrand()
        rInitmatrix(rma)
        rInitmatrix(rmb)
        for (i in 1..rowsize){
            for (j in 1..rowsize){
                rInnerproduct(rmr,rma,rmb,i,j)
            }
        }
    }

    public func timeRealMM(iters : Int32){
        for (i in 0..iters){
            Mm(i)
        }
    }

    public func verify():Bool{
        var rp : Int32 = 1
        var obj : RealMM = RealMM()
        obj.timeRealMM(rp)
        var error : Bool = obj.rmr[1][1] < -776.000 || -775.999 < obj.rmr[1][1]
        return !error
    }
}

main():Int64{
    var reps : Int32 = 800
    var args = Process.current.arguments
    if (args.size == 1) {
        var num = Int32.tryParse(args[0])??0
        if (num != 0) {
            reps = num
        }
    }

    var obj : RealMM = RealMM()
    var startTime = DateTime.now()
    obj.timeRealMM(reps)
    var endTime = DateTime.now()
    var durTime = endTime - startTime
    var perTime: Float64 = Float64(durTime.toNanoseconds())/Float64(reps)

    if (obj.verify() == false) {
        print(perTime.format(".2") + "ns\n")
    } else {
        print("Error!\n")
    }

    return 0
}
