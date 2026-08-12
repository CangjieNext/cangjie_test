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

class Queens1{
    public static let FALSE : Int64 = 0
    public static let TRUE : Int64 = 1
    public var error : Bool = false
    public var q : Int64 = FALSE
    public var a : Array<Int64> = Array<Int64>(9, repeat:0)
    public var b : Array<Int64> = Array<Int64>(17, repeat:0)
    public var c : Array<Int64> = Array<Int64>(15, repeat:0)
    public var x : Array<Int64> = Array<Int64>(9, repeat:0)

    public func Try(i : Int64,a:Array<Int64>, b : Array<Int64>, c : Array<Int64>, x : Array<Int64>) : Unit{
        var j : Int64 = 0
        q = FALSE
        while ((q == FALSE) &&(j !=8)){
            j = j + 1
            q = FALSE
            if (b[j]==FALSE && a[i+j] != FALSE && c[i-j+7] != FALSE){
                x[i] = j
                b[j] = FALSE
                a[i+j] = FALSE
                c[i-j+7] = FALSE
                if (i < 8 ){
                    Try(i+1,a,b,c,x)
                    if(q == FALSE){
                        b[j] = TRUE
                        a[i+j] = TRUE
                        c[i-j+7] = TRUE
                    }
                }else{
                    q = TRUE
                }
            }
        }
    }

    public func Doit(){
        var i : Int64 = 0
        i = 0-7
        while (i <= 16){
            if ( (i >=1) && (i<=8)){
                a[i] = TRUE
            }
            if (i >= 2){
                b[i] = TRUE
            }
            if (i <= 7){
                c[i+7] = TRUE
            }
            i = i + 1
        }
        Try(1, b, a, c, x)
        if (q == FALSE){
            error = true
        }
    }

    public func Queens2(run : Int32){
        for (i in 1..50){
            Doit()
        }
    }

    public func timeQueens (iters : Int32){
        for (i in 0..iters){
            Queens2(i)
        }
    }

    public func verify():Bool{
        var rp : Int32 = 1
        var obj : Queens1 = Queens1()
        obj.timeQueens(rp)
        return !obj.error
    } 
}

main():Int64{
    var reps : Int32 = 10000
    var args = Process.current.arguments
    if (args.size == 1) {
        var num = Int32.tryParse(args[0])??0
        if (num != 0) {
            reps = num
        }
    }

    var obj : Queens1 = Queens1()
    var startTime = DateTime.now()
    obj.timeQueens(reps)
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