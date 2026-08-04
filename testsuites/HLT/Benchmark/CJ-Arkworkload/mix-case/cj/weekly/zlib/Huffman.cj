/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.math.*
import std.collection.*

class Huffman {
    init() {
        
    }

    static func buildHuffmanTable(lengths: Array<UInt8>) : (Array<UInt32>, Int64, Int64) {
        let listSize:Int64 = lengths.size
        var maxCodeLength:Int64 = 0
        var minCodeLength:Int64 = Int64.Max
        var size: Int64
        var table: Array<UInt32>
        var bitLength:Int64 = 1
        var code:Int64 = 0
        var skip:Int64 = 2
        var reversed: UInt32
        var rtemp: UInt32

        var j: Int64
        var value: UInt32
        
        for (i in 0..listSize) {
            if (Int64(lengths[i]) > maxCodeLength) {
                maxCodeLength = Int64(lengths[i])
            }
            if (Int64(lengths[i]) < minCodeLength) {
                minCodeLength = Int64(lengths[Int64(i)])
            }
        }
        
        size = 1 << maxCodeLength
        table = Array<UInt32>(size, repeat:0)
        
        while (bitLength <= maxCodeLength) {
            var i:Int64 = 0
            while (i < Int64(listSize)) {
                if (Int64(lengths[i]) == bitLength) {
                    reversed = 0
                    rtemp = UInt32(code)
                    j = 0
                    
                    while (j < bitLength) {
                        reversed = (reversed << 1) | (rtemp & 1)
                        rtemp >>= 1
                        j += 1
                    }
                    
                    value = UInt32((bitLength << 16) | i)
                    j = Int64(reversed)
                    
                    while (j < size) {
                        table[j] = value
                        j += skip
                    }
                    
                    code += 1
                }
                i += 1
            }
            
            bitLength += 1
            code <<= 1
            skip <<= 1
        }
        
        return (table, maxCodeLength, minCodeLength)
    }
}
