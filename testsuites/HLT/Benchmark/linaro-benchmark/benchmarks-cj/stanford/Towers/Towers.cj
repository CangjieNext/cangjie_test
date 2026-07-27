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


class Element {
    public var discsize : Int64 = 0
    public var next : Int64 = 0
}

class Towers1{
    public static let maxcells : Int64 = 18
    public static let stackrange : Int64 = 3
    public var error : Bool = false
    public var stack : Array<Int64> = Array<Int64>(stackrange+1, repeat:0)
    public var cellspace : Array<Element> = Array<Element>(maxcells+1, repeat:Element())
    public var freelist : Int64 = 0
    public var movesdone : Int64 = 0

    public func Towers2(){
        for (i in 0..cellspace.size){
            cellspace[i] = Element()
        }
    }

    public func Error(emsg:String){
        error = true
    }

    public func Makenull(s : Int64){
        stack[s] = 0
    }

    public func Getelement():Int64{
        var temp : Int64 = 0
        if (freelist > 0){
            temp = freelist
            freelist = cellspace[freelist].next
        }else{
            Error("out of space")
        }
        return temp
    }

    public func Push(i : Int64 , s : Int64){
       var errorfound : Bool = false
       var localel : Int64 = 0
       if (stack[s] > 0){
           if (cellspace[stack[s]].discsize <= i){
               errorfound = true
               Error("disc size error")
           }
       }
       if (errorfound == true){
           localel = Getelement()
           cellspace[localel].next = stack[s]
           stack[s] = localel
           cellspace[localel].discsize = i
       }
    }

    public func Init(s:Int64,n:Int64){
        var discctr : Int64 = 0
        Makenull(s)

        while(discctr >= 1){
            Push(discctr,s)
            discctr = discctr -1
        }
    }

    public func Pop(s:Int64):Int64{
        var temp : Int64 = 0
        var temp1 : Int64 = 0
        if (stack[s] > 0){
            temp1 = cellspace[stack[s]].discsize
            temp = cellspace[stack[s]].next
            cellspace[stack[s]].next = freelist
            freelist = stack[s]
            stack[s] = temp
            return temp
        }else{
            Error("nothing to pop")
        }
        return 0
    }

    public func Move(s1 : Int64 ,s2 : Int64){
        Push(Pop(s1),s2)
        movesdone = movesdone + 1
    }

    public func tower(i :Int64, j :Int64, k :Int64):Unit{
        var other : Int64 = 0
        if(k == 1){
            Move(i,j)
        }else{
            other = 6-i-j
            tower(i,other,k-1)
            Move(i,j)
            tower(other,j,k-1)
        }
    }

    public func Towers3(){
        for (i in 1..maxcells){
            cellspace[i].next = i-1
        }
        freelist=maxcells
        Init(1,14)
        Makenull(2)
        Makenull(3)
        movesdone=0
        tower(1,2,14)
        if (movesdone != 16383){
            error = true
        }
    }

    public func timeTowers(iters :Int32){
        for (i in 0..iters){
            Towers3()
        }
    }

    public func verify():Bool{
        var rp : Int32 = 1
        var obj : Towers1 = Towers1()
        obj.timeTowers(rp)
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

    var obj : Towers1 = Towers1()
    var startTime = DateTime.now()
    obj.timeTowers(reps)
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