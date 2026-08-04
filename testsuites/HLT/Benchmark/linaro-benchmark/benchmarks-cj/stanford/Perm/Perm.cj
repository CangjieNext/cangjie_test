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

class Perm1{
    public static let permrange : Int32 = 10
    public var error : Bool = true
    public var permarray : Array<Int64> = Array<Int64>(Int64(permrange+1),repeat:0)
    public var pctr : Int32 = 0
    public func Swap(a: Array<Int64>,ai : Int64, b:Array<Int64>, bi:Int64){
        var t :Int64 = 0
        t = a[ai]
        a[ai] = b[bi]
        b[bi] = t 
    }

    public func Initialize(){
        for ( i in 1..7){
            permarray[i] = i - 1
        }
    }

    public func Permute(n : Int32) : Unit {
        pctr = pctr + 1
        if (n != 1){
            Permute(n-1)
            for (k in (n-1)..1){
                Swap(permarray, Int64(n), permarray, Int64(k))
                Permute(n-1)
                Swap(permarray, Int64(n), permarray, Int64(k))
            }
        }
    }

    public func Perm2(){
        pctr = 0
        for (i in 1..5){
            Initialize()
            Permute(7)
        }
        if (pctr != 43300){
            error = true
        }
    }

    public func timePerm(iters:Int32){
        for (i in 0..iters){
            Perm2()
        }
    }

    public func verify():Bool{
        var rp : Int32 = 1
        var obj : Perm1 = Perm1()
        obj.timePerm(1)
        return !obj.error
    }
}

main():Int64{
    var reps : Int32 = 500
    var args = Process.current.arguments
    if (args.size == 1) {
        var num = Int32.tryParse(args[0])??0
        if (num != 0) {
            reps = num
        }
    }

    var obj : Perm1 = Perm1()
    var startTime = DateTime.now()
    obj.timePerm(reps)
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
