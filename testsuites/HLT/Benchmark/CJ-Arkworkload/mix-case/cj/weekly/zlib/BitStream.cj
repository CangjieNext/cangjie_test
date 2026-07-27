/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*
import std.math.*

class BitStream {
    public static let DefaultBlockSize = 0x8000
    private var index:Int64
    private var bitindex: Int64
    private var buffer:Array<UInt8>
    public static var ReverseTable:Array<UInt8> = Array<UInt8>()
    
    init(buffer:Array<UInt8>,bufferPosition:Int64) {
        this.index = bufferPosition
        this.bitindex = 0
        this.buffer = buffer
        BitStream.ReverseTable = getReverseTable()
        if (this.buffer.size * 2 <= this.index) {
            throw Exception("invalid index")
        } else if (buffer.size <= index) {
            expandBuffer()
        }
    }
    
    func expandBuffer() : Array<UInt8> {
        let oldbuf = this.buffer;
        let il = oldbuf.size;
      // copy buffer
        var uint8Buffer = Array<UInt8>((il << 1), repeat:0)

        oldbuf.copyTo(uint8Buffer, 0, 0, oldbuf.size)
        this.buffer = uint8Buffer
        return this.buffer;
    }
    
    public func writeBits(number:Int64, n:Int64, reverse!:Bool = false) {
        var numberTemp: Int64 = number
        var buffer: Array<UInt8> = this.buffer
        var index: Int64 = this.index
        var bitindex: Int64 = this.bitindex
        
        var current = buffer[index]
        
        let rev32_ : (Int64) -> Int32= { num:Int64  =>
            let A = Int32(BitStream.ReverseTable[num & 0xFF]) << 24
            let B = Int32(BitStream.ReverseTable[num >> 8 & 0xFF]) << 16
            let C = Int32(BitStream.ReverseTable[num >> 16 & 0xFF]) << 8
            let D = Int32(BitStream.ReverseTable[num >> 24 & 0xff])
            return Int32(A|B|C|D)
        }
        
        if (reverse && n > 1) {
            if (n > 8) {
                numberTemp =  Int64(rev32_(number) >> (32 - n))
            } else {
                numberTemp =  Int64((BitStream.ReverseTable[number]) >> (8 - n))
            }
        }
        
        if (n + bitindex < 8) {
            current = (current << n) | UInt8(numberTemp)
            bitindex += n
        } else {
            for (i in 0..n) {
                current = (current << 1) | UInt8(((number >> n - i - 1) & 1));
               
                // next byte
                if (bitindex == 8) {
		 
                 bitindex = 0;
                 buffer[index] = BitStream.ReverseTable[Int64(current)];
                 index += 1
                 current = 0;
                    
                 // expand
                 if (index == buffer.size) {
                     buffer = this.expandBuffer()
                 }
               }
            }
        }
        buffer[index] = current;
        this.buffer = buffer;
        this.bitindex = bitindex;
        this.index = index;
    }
    
    public func finish()  :  Array<UInt8> {
      var buffer: Array<UInt8> = this.buffer
        var index:Int64 = this.index
        var output:Array<UInt8>;

        if (this.bitindex > 0) {
            buffer[index] <<= UInt8(8 - this.bitindex)
            buffer[index] = BitStream.ReverseTable[Int64(buffer[index])];
            index += 1;
      }
	// array truncation

      output = (buffer[0..index] as Array<UInt8>).getOrThrow()

      return output;
    }

    private func getReverseTable()  :  Array<UInt8> {
      
        var table = Array<UInt8>(256, repeat:0)
        
        for (i in 0..256) {
            table[i] = UInt8({ n:Int64  =>
                var N : Int64 = n
                var r : Int64 = n
                var s : Int64 = 7
                N >>= 1
                while (N != 0)
                {
                    r <<= 1
                    r |= N & 1
                    s -= 1
                    N >>= 1
                }
                return Int8((r << s & 0xf) >> 0)
            }(Int64(i)))
        }
      return table;
    }
}
