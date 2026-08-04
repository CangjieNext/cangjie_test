/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 %overflow_wrapping %f -o %output

import std.process.*
import std.time.*
import std.convert.*
import std.convert.*

class Quicksort{
    public static let sortelements : Int64 = 5000
    public static let srtelements: Int64 = 500
    public var error : Bool = false
    public var seed : Int64 = 0 
    public var sortlist : Array<Int64> = Array<Int64>(sortelements+1, repeat:0)
    public var biggest : Int64 = 0
    public var littleest : Int64 = 0
    public var inttop : Int64 = 0

    public func Initrand(){
        seed = 74755
    }

    public func Rand():Int64{
        seed = (seed*1309+13849) & 65535
        return seed
    }

    public func Initarr(){
        var temp : Int64 = 0
        Initrand()
        biggest = 0
        littleest = 0
        for (i in 1..=sortelements){
            temp = Rand()
            sortlist[i] = temp - (temp/100000)*100000-5000
            if (sortlist[i] > biggest){
                biggest = sortlist[i]
            }else if(sortlist[i] < littleest){
                littleest = sortlist[i]
            }
        }
    }

    public func Quicksort1(a:Array<Int64>, l:Int64, r:Int64) : Unit {
        var i : Int64
        var j : Int64
        var x : Int64
        var w : Int64
        i = l
        j = r
        x = a[(l+r)/2]
        do{
            while (a[i]<x){
                i = i+1
            }
            while (x<a[i]){
                j = j-1
            }
            if (i<=j){
                w = a[i]
                a[i] = a[j]
                a[j] = w
                i = i+1
                j = j-1
            }
        }while(i<=j)
        if (l <j ){
            Quicksort1(a,l,j)
        }
        if(i < r){
            Quicksort1(a,i,r)
        }
        
    }

    public func Quick(run : Int32){
        Initarr()
        Quicksort1(sortlist,1,sortelements)
        if((sortlist[1] != littleest) || (sortlist[sortelements] != biggest)){
            error = true
        }
    }

    public func timeQuicksort(iters : Int32){
        for (i in 0..iters){
            Quick(i)
        }
    }

    public func verify():Bool{
        var rp : Int32 = 1
        var obj : Quicksort = Quicksort()
        obj.timeQuicksort(rp)
        return !obj.error
    }
}

main():Int64{
    var reps : Int32 = 1200
    var args = Process.current.arguments
    if (args.size == 1) {
        var num = Int32.tryParse(args[0])??0
        if (num != 0) {
            reps = num
        }
    }

    var obj : Quicksort = Quicksort()
    var startTime = DateTime.now()
    obj.timeQuicksort(reps)
    var endTime = DateTime.now()
    var durTime = endTime - startTime
    var perTime: Float64 = Float64(durTime.toNanoseconds())/Float64(reps)

    if (obj.verify() == true) {
        print(perTime.format(".2") + "ns\n")
    } else {
        print("Error!\n")
    }

    return 0
}