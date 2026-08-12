/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 --no-sub-pkg %f -o %output
// RUN-EXEC: %export cjHeapSize=512mb && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ms
//
//  gaussian-blur.swift
//  JetStream2-Swift
//
//  Created by Henry Li on 2023/11/1.
//

import std.time.*
import std.collection.*
import std.math.*

class GaussianBlur {
    // Configuration.
    var a0: Float64 = 0.0
    var a1: Float64 = 0.0
    var a2: Float64 = 0.0
    var a3: Float64 = 0.0
    var b1: Float64 = 0.0
    var b2: Float64 = 0.0
    var left_corner: Float64 = 0.0
    var right_corner: Float64 = 0.0

    func gaussCoef(SIGMA: Int64): Array<Float64>{
     
        var sigma = Float64(SIGMA)
        if (sigma < 0.5) {
            sigma = 0.5
        }
        
        let a = exp(0.726 * 0.726) / sigma
        var g1 = exp(-a)
        var g2 = exp(-2.0 * a)
        var k = (1.0 - g1) * (1.0 - g1) / (1.0 + 2.0 * a * g1 - g2)
        a0 = k
        a1 = k * (a - 1.0) * g1
        a2 = k * (a + 1.0) * g1
        a3 = -k * g2
        b1 = 2.0 * g1
        b2 = -g2
        left_corner = (a0 + a1) / (1.0 - b1 - b2)
        right_corner = (a2 + a3) / (1.0 - b1 - b2)
      
        return [a0, a1, a2, a3, b1, b2, left_corner, right_corner ]
    }
    
    @OverflowWrapping
    func convolveRGBA(src:Array<UInt32>, out: Array<UInt32>, line: Array<Float64>, coeff: Array<Float64>, width: Int, height: Int) {
    

        var rgba: Int64
        var prev_src_r: Float64; var prev_src_g: Float64; var prev_src_b: Float64; var prev_src_a: Float64
        var curr_src_r: Float64; var curr_src_g: Float64; var curr_src_b: Float64; var curr_src_a: Float64
        var curr_out_r: Float64; var curr_out_g: Float64; var curr_out_b: Float64; var curr_out_a: Float64
        var prev_out_r: Float64; var prev_out_g: Float64; var prev_out_b: Float64; var prev_out_a: Float64
        var prev_prev_out_r: Float64; var prev_prev_out_g: Float64; var prev_prev_out_b: Float64; var prev_prev_out_a: Float64

        var src_index: Int64
        var out_index: Int64
        var line_index:Int64
        var coeff_a0: Float64
        var coeff_a1: Float64
        var coeff_b1: Float64
        var coeff_b2:Float64

        for (i in 0..height) {
            src_index = i * width
            out_index = i
            line_index = 0

            // left to right
            rgba = Int64(src[src_index])
            prev_src_r = Float64(rgba & 0xff)
            prev_src_g = Float64((rgba >> 8) & 0xff)
            prev_src_b = Float64((rgba >> 16) & 0xff)
            prev_src_a = Float64((rgba >> 24) & 0xff)

            prev_prev_out_r = Float64(prev_src_r) * coeff[6]
            prev_prev_out_g = Float64(prev_src_g) * coeff[6]
            prev_prev_out_b = Float64(prev_src_b) * coeff[6]
            prev_prev_out_a = Float64(prev_src_a) * coeff[6]

            prev_out_r = prev_prev_out_r
            prev_out_g = prev_prev_out_g
            prev_out_b = prev_prev_out_b
            prev_out_a = prev_prev_out_a

            coeff_a0 = coeff[0]
            coeff_a1 = coeff[1]
            coeff_b1 = coeff[4]
            coeff_b2 = coeff[5]

            for (_ in 0..width) {
                rgba = Int64(src[src_index])
                curr_src_r = Float64(rgba & 0xff)
                curr_src_g = Float64((rgba >> 8) & 0xff)
                curr_src_b = Float64((rgba >> 16) & 0xff)
                curr_src_a = Float64((rgba >> 24) & 0xff)

                curr_out_r = curr_src_r * coeff_a0 + prev_src_r * coeff_a1 + prev_out_r * coeff_b1 + prev_prev_out_r * coeff_b2
                curr_out_g = curr_src_g * coeff_a0 + prev_src_g * coeff_a1 + prev_out_g * coeff_b1 + prev_prev_out_g * coeff_b2
                curr_out_b = curr_src_b * coeff_a0 + prev_src_b * coeff_a1 + prev_out_b * coeff_b1 + prev_prev_out_b * coeff_b2
                curr_out_a = curr_src_a * coeff_a0 + prev_src_a * coeff_a1 + prev_out_a * coeff_b1 + prev_prev_out_a * coeff_b2

                prev_prev_out_r = prev_out_r
                prev_prev_out_g = prev_out_g
                prev_prev_out_b = prev_out_b
                prev_prev_out_a = prev_out_a

                prev_out_r = curr_out_r
                prev_out_g = curr_out_g
                prev_out_b = curr_out_b
                prev_out_a = curr_out_a

                prev_src_r = curr_src_r
                prev_src_g = curr_src_g
                prev_src_b = curr_src_b
                prev_src_a = curr_src_a

                line[line_index] = prev_out_r
                line[line_index + 1] = prev_out_g
                line[line_index + 2] = prev_out_b
                line[line_index + 3] = prev_out_a
                line_index += 4
                src_index += 1
            }
            src_index -= 1
            line_index -= 4
            out_index += height * (width - 1)

            //right to left
            rgba = Int64(src[src_index])

            prev_src_r = Float64(rgba & 0xff)
            prev_src_g = Float64((rgba >> 8) & 0xff)
            prev_src_b = Float64((rgba >> 16) & 0xff)
            prev_src_a = Float64((rgba >> 24) & 0xff)

            prev_prev_out_r = prev_src_r * coeff[7]
            prev_prev_out_g = prev_src_g * coeff[7]
            prev_prev_out_b = prev_src_b * coeff[7]
            prev_prev_out_a = prev_src_a * coeff[7]

            prev_out_r = prev_prev_out_r
            prev_out_g = prev_prev_out_g
            prev_out_b = prev_prev_out_b
            prev_out_a = prev_prev_out_a;

            curr_src_r = prev_src_r
            curr_src_g = prev_src_g
            curr_src_b = prev_src_b
            curr_src_a = prev_src_a

            coeff_a0 = coeff[2]
            coeff_a1 = coeff[3]

            for (_ in 0..width) {
                curr_out_r = curr_src_r * coeff_a0 + prev_src_r * coeff_a1 + prev_out_r * coeff_b1 + prev_prev_out_r * coeff_b2
                curr_out_g = curr_src_g * coeff_a0 + prev_src_g * coeff_a1 + prev_out_g * coeff_b1 + prev_prev_out_g * coeff_b2
                curr_out_b = curr_src_b * coeff_a0 + prev_src_b * coeff_a1 + prev_out_b * coeff_b1 + prev_prev_out_b * coeff_b2
                curr_out_a = curr_src_a * coeff_a0 + prev_src_a * coeff_a1 + prev_out_a * coeff_b1 + prev_prev_out_a * coeff_b2

                prev_prev_out_r = prev_out_r
                prev_prev_out_g = prev_out_g
                prev_prev_out_b = prev_out_b
                prev_prev_out_a = prev_out_a

                prev_out_r = curr_out_r
                prev_out_g = curr_out_g
                prev_out_b = curr_out_b
                prev_out_a = curr_out_a

                prev_src_r = curr_src_r
                prev_src_g = curr_src_g
                prev_src_b = curr_src_b
                prev_src_a = curr_src_a

                rgba = Int64(src[src_index])
                curr_src_r = Float64(rgba & 0xff)
                curr_src_g = Float64((rgba >> 8) & 0xff)
                curr_src_b = Float64((rgba >> 16) & 0xff)
                curr_src_a = Float64((rgba >> 24) & 0xff)

                rgba = (Int64((line[line_index] + prev_out_r)) << 0) + 
		       (Int64(line[line_index + 1] + prev_out_g) << 8) + 
		       (Int64(line[line_index + 2] + prev_out_b) << 16) + 
		       (Int64(line[line_index + 3] + prev_out_a) << 24)

                out[out_index] = UInt32(rgba)

                src_index -= 1
                line_index -= 4
                out_index -= height
            }
        }        
      
    }
    
    func blurRGBA(src:Array<UInt32>, width:Int64, height:Int64, radius:Int64) {
      
        // Quick exit on zero radius    
        if ((radius == 0)) { return }
      
        // Unify input data type, to keep convolver calls isomorphic
        var src32 = src
     
        var out: Array<UInt32> = Array(src32.size, repeat:0)

        // tmp_line = [Float64](repeating: 0, count: max(width, height) * 4)
        var tmp_line = Array(max(width, height) * 4, repeat:0.0)

        let coeff = gaussCoef(radius)
    
        convolveRGBA(src32, out, tmp_line, coeff, width, height)
        convolveRGBA(out, src32, tmp_line, coeff, height, width)
    }           
}
/*
 *  @State
 *  @Tags Jetstream2
 */
class Benchmark{
    var width = 800
    var height = 450
    var radius = 15
    var buffer: Array<UInt32> = []
         
    //@Setup
    @OverflowWrapping
    init(){
        var seed:Int64 = 49734321
        let rand = { =>  
            seed = ((seed + 0x7ed55d16) + (seed << 12)) & 0xffffffff
            seed = ((seed ^ 0xc761c23c) ^ (seed >> 19)) & 0xffffffff
            seed = ((seed + 0x165667b1) + (seed << 5)) & 0xffffffff
            seed = ((seed + 0xd3a2646c) ^ (seed << 9)) & 0xffffffff
            seed = ((seed + 0xfd7046c5) + (seed << 3)) & 0xffffffff
            seed = ((seed ^ 0xb55a4f09) ^ (seed >> 16)) & 0xffffffff
            return Float64(seed & 0xfffffff) / Float64(0x10000000)
        }()
    
       
        var buffer:Array<UInt32> = Array(width * height, repeat:0)

        for (i in 0..buffer.size) {
            buffer[i] = UInt32(rand)
        }
        this.buffer = buffer
    }
    /*
     * @Benchmark
     */
    func runIteration() {
        let setupStart = Timer().getTime()
        for (_ in  0..20){
            GaussianBlur().blurRGBA(buffer, width, height, radius)
        }
       
        let setupEnd = Timer().getTime()
        println("gaussian-blur: ms = ${Float64((setupEnd - setupStart).toNanoseconds())/1000000.0}")
    }
}

func debugLog(str: String, object: Any) {
    let isLog = false
    if (isLog) {
        println("${str}: ${(object as String).getOrThrow()}")
    }
}

class Timer {
    // ms
    public func getTime() {
        let time = DateTime.now()
        return time
    }
}

main() {
    Benchmark().runIteration()
}
