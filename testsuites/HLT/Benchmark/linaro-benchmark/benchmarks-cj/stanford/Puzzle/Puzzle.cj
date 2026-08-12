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

class Puzzle1{
    public static let size : Int64 = 511
    public static let classmax : Int64 = 3
    public static let typemax : Int64 = 12
    public static let d : Int64 = 8
    public var error : Int32 = 0
    public var piececount : Array<Int64> = Array<Int64>(classmax + 1, repeat:0) 
    public var cls : Array<Int64> = Array<Int64>(typemax + 1, repeat:0)
    public var piecemax : Array<Int64> = Array<Int64>(typemax + 1, repeat:0)
    public var puzzl : Array<Bool> = Array<Bool>(size+1, repeat:false)
    public var p : Array<Array<Bool>> = Array<Array<Bool>>(typemax + 1, repeat:Array<Bool>(size + 1,repeat:false))
    public var n : Int64 = 0
    public var kount : Int32 = 0

    public func Fit(i : Int64 , j : Int64):Bool{
        for (k in 0..=piecemax[i]){
            if (p[i][k]){
                if (puzzl[j+k]){
                    return false
                }
            }
        }
        return true
    }

    public func Place(i : Int64,j : Int64 ):Int64{
        for (k in 0..=piecemax[i]){
            if (p[i][k]){
                puzzl[j+k] = true
            }
        }
        piececount[cls[i]] = piececount[cls[i]] - 1
        for (k in j..=size){
            if (!puzzl[k]){
                return k
            }
        }
        return 0
    }

    public func Remove(i : Int64,j: Int64){
        for (k in 0..=piecemax[i]){
            if (p[i][k]){
                puzzl[j+k] = false
            }
        }
        piececount[cls[i]] = piececount[cls[i]] + 1
    }

    public func Trial(j : Int64):Bool{
    
        var k : Int64 = 0
        kount = kount + 1
        for (i in 0..=typemax){
            if (piececount[cls[i]] != 0){
                if (Fit(i,j)){
                    k = Place(i,j)
                    if (Trial(k)||(k==0)){
                        return true
                    }
                    else{
                        Remove(i,j)
                    }
                }
            }
        }
        return false
    }

    public init() {
     
        var z : Int64
        for (m in 0..=size){
            puzzl[m] = true
        }
        for (i in 1..=5){
            for ( j in 1..=5){
                for (k in 1..=5){
                    puzzl[i+d*(j+d*k)] = false
                }
            }
        }
        for (i in 0..=typemax){
            for (m in 0..=size){
                p[i][m] = false
            }
        }
        for (i in 0..=3){
            for (j in 0..=1){
                for(k in 0..=0){
                    p[0][i+d*(j+d*k)] = true
                }
            }
        }
        cls[0] = 0
        piecemax[0] = 3+d*1+d*d*0
        for (i in 0..=1){
            for (j in 0..=0){
                for(k in 0..=3){
                    p[1][i+d*(j+d*k)] = true
                }
            }
        }
        cls[1] = 0
        piecemax[1] = 1+d*0+d*d*3
        for (i in 0..=0){
            for (j in 0..=3){
                for (k in 0..=1){
                    p[2][i+d*(j+d*k)] = true
                }
            }
        }
        cls[2] = 0
        piecemax[2] = 0+d*3+d*d*1
        for (i in 0..=1){
            for (j in 0..=3){
                for (k in 0..=0){
                    p[3][i+d*(j+d*k)] = true
                }
            }
        }
        cls[3] = 0
        piecemax[3] = 1+d*3+d*d*0
        for (i in 0..=3){
            for (j in 0..=0){
                for (k in 0..=1){
                    p[4][i+d*(j+d*k)] = true
                }
            }
        }
        cls[4] = 0
        piecemax[4] = 3+d*0+d*d*1
        for (i in 0..=0){
            for (j in 0..=1){
                for (k in 0..=3){
                    p[5][i+d*(j+d*k)] = true
                }
            }
        }
        cls[5] = 0
        piecemax[5] = 0+d*1+d*d*3
        for (i in 0..=2){
            for (j in 0..=0){
                for (k in 0..=0){
                    p[6][i+d*(j+d*k)] = true
                }
            }
        }
        cls[6] = 1
        piecemax[6] = 2+d*0+d*d*0
        for (i in 0..=0){
            for (j in 0..=2){
                for (k in 0..=0){
                    p[7][i+d*(j+d*k)] = true
                }
            }
        }
        cls[7] = 1
        piecemax[7] = 0+d*2+d*d*0
        for (i in 0..=0){
            for (j in 0..=0){
                for (k in 0..=2){
                    p[8][i+d*(j+d*k)] = true
                }
            }
        }
        cls[8] = 1
        piecemax[8] = 0+d*0+d*d*2
        for (i in 0..=1){
            for (j in 0..=1){
                for (k in 0..=0){
                    p[9][i+d*(j+d*k)] = true
                }
            }
        }
        cls[9] = 2
        piecemax[9] = 1+d*1+d*d*0
        for (i in 0..=1){
            for (j in 0..=0){
                for (k in 0..=1){
                    p[10][i+d*(j+d*k)] = true
                }
            }
        }
        cls[10] = 2
        piecemax[10] = 1+d*0+d*d*1
        for (i in 0..=0){
            for (j in 0..=1){
                for (k in 0..=1){
                    p[11][i+d*(j+d*k)] = true
                }
            }
        }
        cls[11] = 2
        piecemax[11] = 0+d*1+d*d*1
        for (i in 0..=1){
            for (j in 0..=1){
                for (k in 0..=1){
                    p[12][i+d*(j+d*k)] = true
                }
            }
        }
        cls[12] = 3
        piecemax[12] = 1+d*1+d*d*1
        piececount[0] = 13
        piececount[1] = 3
        piececount[2] = 1
        piececount[3] = 1
        z = 1+d*(1+d*1)
        kount = 0
        if (Fit(0,z)){
            n = Place(0,z)
        }else{
            error = 1
        }
        if (!Trial(n)){
            error = 2
        }else if (kount != 2005){
            error = 3
        }
            
        
    }

    public func timePuzzle(iters : Int32){
        for (i in 0..iters){
            Puzzle1()
        }
    }

    public func verify():Bool{
        var rp : Int32 = 1 
        var obj:Puzzle1 = Puzzle1()
        obj.timePuzzle(rp)
        return obj.error == 0
    }
}

main():Int64{
    var reps : Int32 = 125
    var args = Process.current.arguments
    if (args.size == 1) {
        var num = Int32.tryParse(args[0])??0
        if (num != 0) {
            reps = num
        }
    }

    var obj : Puzzle1 = Puzzle1()
    var startTime = DateTime.now()
    obj.timePuzzle(reps)
    var endTime = DateTime.now()
    var durTime = endTime - startTime
    var perTime: Float64 = Float64(durTime.toNanoseconds())/Float64(reps)

    print(perTime.format(".2") + "ns\n")

    return 0
}
