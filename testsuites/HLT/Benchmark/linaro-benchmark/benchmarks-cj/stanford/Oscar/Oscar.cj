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

class Complex{
    public var rp : Float32 = 0.0
    public var ip : Float32 = 0.0
}

class Oscar1{
    public static let fftsize : Int32 = 256
    public static let fftsize2 : Int32 = 129
    

    public var z : Array<Complex> = Array<Complex>(Int64(fftsize + 1),repeat:Complex())
    public var w : Array<Complex> = Array<Complex>(Int64(fftsize + 1) ,repeat:Complex())
    public var e : Array<Complex> = Array<Complex>(Int64(fftsize2 + 1),repeat:Complex())
    public var zr : Float32 = 0.0
    public var zi : Float32 = 0.0
    public var h : Array<Float32> = Array<Float32>(26, repeat:0.0)
    public var seed : Int32 = 0

    public func Oscar2():Unit{
        for (i in 0..z.size) {
            z[i] = Complex()
        }

        for (i in 0..e.size) {
            e[i] = Complex()
        }

        for (i in 0..w.size) {
            w[i] = Complex()
        }
    }

    public func Cos(x : Float32):Float32{
        var factor : Int32 = 0
        var result : Float32 = 0.0 
        var power : Float32 = 0.0 
        result = 1.0
        factor = 1
        power = x
        for (i in 2..10){
            factor = factor * Int32(i)
            power = power * x
            if ((i&1)==0){
                if ((i&3)==0){
                    result = result + power/Float32(factor)
                }
                else{
                    result = result - power/Float32(factor)
                }
            } 
        }
        return (result)
    }

    public func Min0(arg1 : Int32,arg2:Int32):Int32{
        if (arg1 < arg2){
            return (arg1)
        }
        else{
            return (arg2)
        }
    }

    public func Uniform11(iy : Int32):Int32{
        return (4855 * iy + 1731)&8191
    }

    public func Exptab(n:Int32, e:Array<Complex>){
        var theta : Float32 = 0.0
        var divisor : Float32 = 0.0
        var i : Int32 = 0
        var j : Int32 = 0
        var k : Int32 = 0
        var l : Int32 = 0
        var m : Int32 = 0
        theta = 3.1415926536
        divisor = 4.0 
        for (x in 1..25){
            h[x] = Float32(1)/(Float32(2)*Cos(theta/divisor))
            divisor = divisor + divisor
        }

        m = n/2
        l = m/2
        j = 1
        e[1].rp = 1.0
        e[1].ip = 0.0
        e[Int64(l)+1].rp = 0.0
        e[Int64(l)+1].ip = 1.0
        e[Int64(m)+1].rp = -1.0
        e[Int64(m)+1].ip = 0.0
        do {
            i = l / 2 
		    k = i 
            do {
                e[Int64(k)+1].rp = h[Int64(j)]*(e[Int64(k)+Int64(i)+1].rp+e[Int64(k)-Int64(i)+1].rp) 
		        e[Int64(k)+1].ip = h[Int64(j)]*(e[Int64(k)+Int64(i)+1].ip+e[Int64(k)-Int64(i)+1].ip) 
		        k = k+l 
            }while(k <= m)
            j = Min0( j+1, 25)
		    l = i 
        }while ( l > 1 )
    }

    public func Fft(n:Int32,z:Array<Complex>,w:Array<Complex>,e:Array<Complex>,sqrinv:Float32):Unit{
        var i : Int64 = 0
        var j : Int64 = 0
        var k : Int64 = 0
        var l : Int64 = 0
        var m : Int64 = 0
        var index : Int64 = 0
        m = Int64(n)/2
        l = 1
        do{
            k = 0
            j = 1
            i = 1
            do{
                do {
                    w[i+k].rp = z[i].rp+z[m+i].rp 
			        w[i+k].ip = z[i].ip+z[m+i].ip 
			        w[i+j].rp = e[k+1].rp*(z[i].rp-z[i+m].rp)-e[k+1].ip*(z[i].ip-z[i+m].ip) 
			        w[i+j].ip = e[k+1].rp*(z[i].ip-z[i+m].ip)+e[k+1].ip*(z[i].rp-z[i+m].rp) 
			        i = i+1 
                }while ( i <= j )
                k = j
                j = k+1
            } while ( j <= m )
            index = 1
            do {
                z[index].rp = w[index].rp
		        z[index].ip = w[index].ip
		        index = index+1
            }while ( index <= Int64(n) )
            l = l+l
        } while ( l <= m )
        for (x in 1..n){
            z[Int64(x)].rp = sqrinv*z[Int64(x)].rp 
		    z[Int64(x)].ip = -sqrinv*z[Int64(x)].ip    
        }
    }

    public func Oscar3():Unit{
   
        Exptab(fftsize,e)
        seed = 5767
        for (i in 1..fftsize){
            seed = Uniform11(seed)
            zr = Float32(seed) / 8192.0
            seed = Uniform11(seed)
            zi = Float32(seed) / 8192.0
            z[Int64(i)].rp = 20.0*zr - 10.0
            z[Int64(i)].ip = 20.0*zi - 10.0
        }
        for (i in 1..20){
            Fft(fftsize, z, w, e, 0.0625)
        }
    }

    public func timeOscar(iters : Int32){
        for (i in 0..iters){
            Oscar3()
        }
    }

    public func verify():Bool{
        var re : Int32 = 1
        var obj : Oscar1 = Oscar1()
        obj.timeOscar(re)
        var error : Bool = obj.z[256].rp < -9.151 || -9.150 < obj.z[256].rp
        error = error || (obj.z[256].ip < -.921 || -.920 < obj.z[256].ip)
        return !error
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

    var obj : Oscar1 = Oscar1()
    var startTime = DateTime.now()
    obj.timeOscar(reps)
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

