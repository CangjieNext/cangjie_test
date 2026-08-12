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


class Bubblesort{
    public static let sortelements: Int64 = 5000
    public static let srtelements : Int64 = 500
    public var error : Bool =false
    public var seed :Int64 = 0
    public var sortlist : Array<Int64> = Array<Int64>(sortelements+1, repeat:0)
    public var biggest : Int64 = 0
    public var littlest : Int64 = 0
    public var top : Int64 = 0
    
    public func Initrand(){
        seed = 74755
    }

    public func Rand():Int64{
        seed = (seed*1309+13849) & 65535
        return seed
    }

    public func bInitarr(){
        var temp : Int64 = 0
        Initrand()
        biggest = 0
        littlest = 0
        for (i in 1..sortelements){
            temp = Rand()
            sortlist[i] = temp - (temp/100000)*100000 - 50000
            if (sortlist[i]> biggest){
                biggest = sortlist[i]
            }else if(sortlist[i]<littlest){
                littlest = sortlist[i]
            }
        }
    }

    public func Bubble(run : Int64){
        var i : Int64 = 0
        var j : Int64 = 0
        bInitarr()
        top=srtelements
        while(top > 1){
            i = 1
            while (i < top){
                if (sortlist[i] > sortlist[i+1]){
                    j = sortlist[i]
                    sortlist[i] = sortlist[i+1]
				    sortlist[i+1] = j
                }
                i = i+1
            }
            top = top - 1
        }
        if ((sortlist[1] != littlest) || (sortlist[srtelements] != biggest)){
            error = true
        }
    }
    
    public func timeBubble(iters : Int32){
        for (i in 0..iters){
            Bubble(Int64(i))
        }
    }

    public func verify():Bool{
        var rp : Int32 = 1
        var obj : Bubblesort = Bubblesort()
        obj.timeBubble(rp)
        return !obj.error
    }
}

main():Int64{
    var reps : Int32 = 1000
    var args = Process.current.arguments
    if (args.size == 1) {
        var num = Int32.tryParse(args[0])??0
        if (num != 0) {
            reps = num
        }
    }

    var obj : Bubblesort = Bubblesort()
    var startTime = DateTime.now()
    obj.timeBubble(reps)
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