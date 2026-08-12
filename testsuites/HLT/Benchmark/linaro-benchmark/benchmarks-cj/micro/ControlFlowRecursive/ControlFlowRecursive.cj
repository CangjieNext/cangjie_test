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



class ControlFlowRecursive{
    private static var result : Int32 = 0
    private static var expected : Int32 = 5775
    
    public func ack(m:Int32, n:Int32):Int32{
        if (m == 0){
            return n+1
        }
        if (n == 0){
            return ack(m-1,1)
        }
        return ack(m-1, ack( m , n-1 ))
    }

    public func fib(n:Int32):Int32{
        if (n<2){
            return 1 
        }
        return fib(n-2) +fib(n-1)
    }

    public func tak(x:Int32,y:Int32,z:Int32):Int32{
        if (y>=x){
            return z
        }
        return tak(tak(x-1,y,z),tak(y-1,z,x),tak(z-1,x,y))
    }

    public func tarai(x:Int32,y:Int32,z:Int32):Int32{
        if (y>=x){
            return y
        }
        return tarai(tarai(x-1,y,z),tarai(y-1,x,z),tarai(z-1,x,y))
    }

    public func timeControlFlowRecursive(iterations:Int32){
        for (iter in 0..iterations){
            result = 0 
            for (i in 3..5){
                result += ack(3,Int32(i))
                result += fib(17+Int32(i))
                result += tak(3 * Int32(i) + 3, 2 * Int32(i) + 2, Int32(i) + 1)
            }
        }
    }

    public func verifyControlFlowRecursive():Bool{
        return result == expected
    }


}



main():Int64{
    var reps : Int32 = 600
    var args = Process.current.arguments
    if (args.size == 1) {
        var num = Int32.tryParse(args[0])??0
        if (num != 0) {
            reps = num
        }
    }

    var obj: ControlFlowRecursive=ControlFlowRecursive()
    var startTime = DateTime.now()
    obj.timeControlFlowRecursive(reps)
    var endTime = DateTime.now()
    var durTime = endTime - startTime
    var perTime: Float64 = Float64(durTime.toNanoseconds())/Float64(reps)

    if (obj.verifyControlFlowRecursive() == true) {
        print(perTime.format(".2") + "ns\n")
    } else {
        print("Error!\n")
    }

    return 0

}