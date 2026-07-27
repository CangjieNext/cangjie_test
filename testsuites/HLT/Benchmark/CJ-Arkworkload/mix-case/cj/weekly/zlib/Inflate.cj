/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*
import std.math.*

struct InOptionParams {
    var index: ?Int64 = Option<Int64>.None
    var bufferSize: ?Int64  = Option<Int64>.None
    var bufferType: ?BufferType = Option<BufferType>.None
    var resize: ?Bool = Option<Bool>.None

    init(index: ?Int64, bufferSize: ?Int64, bufferType: ?BufferType, resize: ?Bool) {
        this.index = index
        this.bufferSize = bufferSize
        this.bufferType = bufferType
        this.resize = resize
    }
}
struct ExpandOption {
    var fixRatio: ?Int64 = Option<Int64>.None
    var addRatio: ?Int64 = Option<Int64>.None

    init(fixRatio: ?Int64, addRatio: ?Int64) {
        this.fixRatio = fixRatio
        this.addRatio = addRatio
    }
}

enum BufferType {
    | BLOCK
    | ADPTIVE
}

/*
 *@Generator
 */
class  RawInflate {
    static let ZLIB_RAW_INFLATE_BUFFER_SIZE:Int64 = 0x8000
    static let buildHuffmanTable:(lengths: Array<UInt8>) -> (Array<UInt32>, Int64, Int64) = Huffman.buildHuffmanTable
    static let MaxBackwardLength:Int64 = 32768
    static let MaxCopyLength:Int64 = 258
    var currentLitlenTable: ?Any = Option<Any>.None
    
    static let order: Array<UInt16> = {  =>
        let table:Array<UInt16> = [16, 17, 18, 0, 8, 7, 9, 6, 10, 5, 11, 4, 12, 3, 13, 2, 14, 1, 15]
        return table.clone()
    }()
    
    static let LengthCodeTable:(Array<UInt16>) = {table:Array<UInt16> =>
        return table.clone()
    }([
        0x0003, 0x0004, 0x0005, 0x0006, 0x0007, 0x0008, 0x0009, 0x000a, 0x000b,
        0x000d, 0x000f, 0x0011, 0x0013, 0x0017, 0x001b, 0x001f, 0x0023, 0x002b,
        0x0033, 0x003b, 0x0043, 0x0053, 0x0063, 0x0073, 0x0083, 0x00a3, 0x00c3,
        0x00e3, 0x0102, 0x0102, 0x0102
    ])
    
    static let LengthExtraTable: Array<UInt8> = {table:Array<UInt8> =>
        return table.clone()
    }([
        0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5,
        5, 5, 0, 0, 0
    ])
    
    static let DistCodeTable: Array<UInt16> = {table:Array<UInt16> =>
        return table.clone()
    }([
        0x0001, 0x0002, 0x0003, 0x0004, 0x0005, 0x0007, 0x0009, 0x000d, 0x0011,
        0x0019, 0x0021, 0x0031, 0x0041, 0x0061, 0x0081, 0x00c1, 0x0101, 0x0181,
        0x0201, 0x0301, 0x0401, 0x0601, 0x0801, 0x0c01, 0x1001, 0x1801, 0x2001,
        0x3001, 0x4001, 0x6001
    ])
    
    static let DistExtraTable: Array<UInt8> = { =>
        let table:Array<UInt8> = [
            0, 0, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11,
            11, 12, 12, 13, 13
        ]
        return return table.clone()
    }()
    
    static let FixedLiteralLengthTable: (Array<UInt32>, Int64, Int64) = { =>
        var lengths = Array<UInt8>(288, repeat:0)
        
        for (i in 0..lengths.size) {
            if (i <= 143) {
               lengths[i] = 8
            } else {
                if (i <= 255) {
                    lengths[i] = 9
                } else {
                    if (i <= 279) {
                        lengths[i] = 7
                    } else {
                        lengths[i] = 8
                    }
                }
            }
        }
        return RawInflate.buildHuffmanTable(lengths)
    }()
    static let FixedDistanceTable: (Array<UInt32>, Int64, Int64) = { =>
        var lengths = Array<UInt8>(30, repeat:5)

        for (i in 0..lengths.size) {
            lengths[i] = 5;
          }

        return RawInflate.buildHuffmanTable(lengths)
    }()
    var buffer: ?Array<UInt8> = Option<Array<UInt8>>.None
    var blocks: ArrayList<Array<UInt8>>
    var bufferSize: Int64
    var totalpos: Int64
    var ip: Int64
    var bitsbuf: UInt64
    var bitsbuflen: Int64
    var input: Array<UInt8>
    var output: Array<UInt8>
    var op: Int64
    var bfinal: Bool = false
    var bufferType: BufferType = BufferType.ADPTIVE
    var resize: Bool = false
    
    init(input: Array<UInt8>, optParams!: ?InOptionParams = Option<InOptionParams>.None) {
        this.blocks = ArrayList<Array<UInt8>>()
        this.bufferSize = RawInflate.ZLIB_RAW_INFLATE_BUFFER_SIZE
        this.totalpos = 0
        this.ip = 0
        this.bitsbuf = 0
        this.bitsbuflen = 0
        this.input = input.clone()
        this.bfinal = false
        this.bufferType = BufferType.ADPTIVE
        this.resize = false
        
        // option parameters
   
        if (optParams.isSome()) {
            let index = optParams.getOrThrow().index
            if (index.isSome()) {
                this.ip = index.getOrThrow()
            }
            let bufferSize = optParams.getOrThrow().bufferSize
            if (bufferSize.isSome()) {
                this.bufferSize = bufferSize.getOrThrow()
            }
            let bufferType = optParams.getOrThrow().bufferType
            if (bufferType.isSome()) {
                this.bufferType = bufferType.getOrThrow()
            }
            let resize = optParams.getOrThrow().resize
            if (resize.isSome()) {
                this.resize = resize.getOrThrow()
            }
        }
        
        // initialize
        match(this.bufferType) {
        case BufferType.BLOCK =>
            this.op = RawInflate.MaxBackwardLength
            this.output = Array<UInt8>(RawInflate.MaxBackwardLength + this.bufferSize + RawInflate.MaxCopyLength, repeat:0)
        case BufferType.ADPTIVE =>
            this.op = 0
            this.output = Array<UInt8>(this.bufferSize, repeat:0)
        case _ =>
            throw Exception("invalid inflate mode")
        }
    }
    
    func decompress() : Array<UInt8> {
        while (!this.bfinal) {
            this.parseBlock()
        }
        match( this.bufferType) {
        case BufferType.BLOCK =>
            return this.concatBufferBlock()
        case BufferType.ADPTIVE =>
            return this.concatBufferDynamic()
        case _ =>
            throw Exception("invalid inflate mode")
        }
    }
    
    func parseBlock() {
        var hdr:UInt64 = this.readBits(3)
        
        // BFINAL
        if ((hdr & 0x1) != 0) {
            this.bfinal = true
        }
        
        // BTYPE
        hdr >>= 1
        match(hdr) {
            // uncompressed
        case 0 =>
            this.parseUncompressedBlock()
            // fixed huffman
        case 1 =>
            this.parseFixedHuffmanBlock()
            // dynamic huffman
        case 2 =>
            this.parseDynamicHuffmanBlock()
            // reserved or other
        case _ =>
            throw Exception("unknown BTYPE: ${hdr}")
        }
    }
    
    func readBits(length: Int64) : UInt64 {
        var bitsbuf: UInt64 = this.bitsbuf
        var bitsbuflen: Int64 = this.bitsbuflen
        let input: Array<UInt8> = this.input
        var ip: Int64 = this.ip
        /** @type {int} */
        let inputLength: Int64 = input.size
        /** @type {UInt} input and output byte. */
        var octet: UInt64
        
        // input byte
        if (ip + ((length - bitsbuflen + 7) >> 3) >= inputLength) {
            throw Exception("input buffer is broken")
        }
        
        // not enough buffer
        while (bitsbuflen < length) {
            bitsbuf |= UInt64(input[ip]) << bitsbuflen
            ip += 1
            bitsbuflen += 8
        }
        
        // output byte
        octet = bitsbuf & ((1 << length) - 1)
        bitsbuf >>= UInt64(length)
        bitsbuflen -= length
        
        this.bitsbuf = bitsbuf
        this.bitsbuflen = bitsbuflen
        this.ip = ip
        
        return octet
    }
    
    func readCodeByTable(table: Any) : Int64 {
        var bitsbuf:UInt64 = this.bitsbuf
        var bitsbuflen:Int64 = this.bitsbuflen
        let input:Array<UInt8> = this.input
        var ip:Int64 = this.ip
        
        let inputLength:Int64 = input.size
        let codeTable:Array<UInt32> = (table as (Array<UInt32>,Int64,Int64)).getOrThrow()[0]
        let maxCodeLength:Int64 = (table as Array<Int64>).getOrThrow()[1]
        var codeWithLength: UInt32
        var codeLength: Int64
        
        // not enough buffer
        while (bitsbuflen < maxCodeLength) {
            if (ip >= inputLength) {
                break
            }
            bitsbuf |= UInt64(input[ip]) << bitsbuflen
            ip += 1
            bitsbuflen += 8
        }
        
        // read max length
        codeWithLength = codeTable[Int64(bitsbuf & UInt64((1 << maxCodeLength) - 1))]
        codeLength = Int64(codeWithLength >> 16)
        
        if (codeLength > bitsbuflen) {
            throw Exception("invalid code length: ${codeLength}")
        }
        
        bitsbuf >>= UInt64(codeLength)
        bitsbuflen -= codeLength
        ip += 1
        
        this.bitsbuf = bitsbuf
        this.bitsbuflen = bitsbuflen
        this.ip = ip
        
        return Int64(codeWithLength & 0xffff)
    }
    
    func parseUncompressedBlock() {
        let input:Array<UInt8> = this.input
        var ip:Int64 = this.ip
        var output: Array<UInt8> = this.output
        var op:Int64 = this.op
        
        let inputLength:Int64 = input.size
        var len: Int64
        var nlen: Int64
        let olength:Int64 = output.size
        var preCopy: Int64
        
        // skip buffered header bits
        this.bitsbuf = 0
        this.bitsbuflen = 0
        
        // len
        if (ip + 1 >= inputLength) {
            throw Exception("invalid uncompressed block header: LEN")
        }
        len = Int64(input[ip]) | (Int64(input[ip + 1]) << 8)
        ip += 2
        
        // nlen
        if (ip + 1 >= inputLength) {
            throw Exception("invalid uncompressed block header: NLEN")
        }
        nlen = Int64(input[ip]) | (Int64(input[ip + 1]) << 8)
        ip += 2
        
        // check len & nlen
        if (len == !nlen) {
            throw Exception("invalid uncompressed block header: length verify")
        }
        
        // check size
        if (ip + len > input.size) {
            throw Exception("input buffer is broken")
        }
        
        // expand buffer
        match(this.bufferType) {
        case BufferType.BLOCK =>
            // pre copy
            while (op + len > output.size){
                preCopy = olength - op
                len -= preCopy

                input.copyTo(output, ip, op, preCopy)
                op += preCopy
                ip += preCopy
                
                this.op = op
                output = this.expandBufferBlock()
                op = this.op
            }
        case BufferType.ADPTIVE =>
            while (op + len > output.size) {                
                output = this.expandBufferAdaptive(ExpandOption(2,Option<Int64>.None))
            }
        case _  =>
            throw Exception("invalid inflate mode")
        }

        input.copyTo(output, ip, op, len)
        op += len
        ip += len
        
        this.ip = ip
        this.op = op
        this.output = output
    }
    
    func parseFixedHuffmanBlock() {
        match(this.bufferType) {
        case BufferType.ADPTIVE =>
            this.decodeHuffmanAdaptive(
                RawInflate.FixedLiteralLengthTable,
                RawInflate.FixedDistanceTable
	    )
        case BufferType.BLOCK =>
            this.decodeHuffmanBlock(
                RawInflate.FixedLiteralLengthTable,
                RawInflate.FixedDistanceTable
            )
        case _  =>
            throw Exception("invalid inflate mode");
        }
    }
    
    func parseDynamicHuffmanBlock() {
        let hlit:Int64 = Int64(this.readBits(5)) + 257
        let hdist:Int64 = Int64(this.readBits(5)) + 1
        let hclen:Int64 = Int64(this.readBits(4)) + 4
        var codeLengths:Array<UInt8> = Array<UInt8>(RawInflate.order.size, repeat:0)
        var codeLengthsTable: (Array<UInt32>, Int64, Int64)
        var litlenTable : ?Any
        var distTable: ?Any
        var lengthTable: Array<UInt8>
        var code: UInt8
        var prev: ?UInt8 = Option<UInt8>.None
        var repeats: Int64
        // decode code lengths
        for (i in 0..hclen) {
            codeLengths[Int64(RawInflate.order[i])] = UInt8(this.readBits(3))
        }

	// decode length table
        codeLengthsTable = RawInflate.buildHuffmanTable(codeLengths)
        lengthTable = Array<UInt8>(hlit + hdist, repeat:0)
        
        var i = 0
        while(i < (hlit + hdist)) {
            code = UInt8(this.readCodeByTable(codeLengthsTable))
            match(code) {
            case 16 =>
                repeats = 3 + Int64(this.readBits(2))
                while (repeats > 0) {
                    lengthTable[i] = prev ?? 0
                    i += 1
                    repeats -= 1
                }
            case 17 =>
                repeats = 3 + Int64(this.readBits(3))
                while (repeats > 0) {
                    lengthTable[i] = 0
                    i += 1
                    repeats -= 1
                }
                prev = 0
            case 18 =>
                repeats = 11 + Int64(this.readBits(7))
                while (repeats > 0) {
                    lengthTable[i] = 0
                    repeats -= 1
                    i += 1
                }
                prev = 0
            case _ =>
                lengthTable[i] = code
                prev = code
                i += 1
                break
            }
        }
        
        litlenTable = RawInflate.buildHuffmanTable(lengthTable.clone(0..hlit))
        
        distTable = RawInflate.buildHuffmanTable(lengthTable.clone(hlit..lengthTable.size-1))
        
           match(this.bufferType) {
             case BufferType.ADPTIVE =>
               this.decodeHuffmanAdaptive(litlenTable, distTable);
             case BufferType.BLOCK  =>
               this.decodeHuffmanBlock(litlenTable, distTable);
             case _ =>
               throw Exception("invalid inflate mode")
           }
    }
    
    func decodeHuffmanBlock(litlen: Any, dist: Any) {
        var output:Array<UInt8> = this.output
        var op:Int64 = this.op

        this.currentLitlenTable = litlen
        
        let olength = output.size - RawInflate.MaxCopyLength
        var code: Int
        var ti: Int
        var codeDist: Int
        var codeLength: UInt32

        let lengthCodeTable = RawInflate.LengthCodeTable
        let lengthExtraTable = RawInflate.LengthExtraTable
        let distCodeTable = RawInflate.DistCodeTable
        let distExtraTable = RawInflate.DistExtraTable

        code = this.readCodeByTable(litlen)
        while (code != 256) {
            // literal
            if (code < 256) {
                if (op >= olength) {
                    this.op = op
                    output = this.expandBufferBlock()
                    op = this.op
                }
                output[op] = UInt8(code)
                op += 1
                continue
            }

            // length code
            ti = code - 257
            codeLength = UInt32(lengthCodeTable[Int64(ti)])
            if (lengthExtraTable[Int64(ti)] > 0 ){
                codeLength += UInt32(this.readBits(Int64(lengthExtraTable[Int64(ti)])))
            }

            // dist code
            code = this.readCodeByTable(dist)
            codeDist = Int64(distCodeTable[code])
            if (distExtraTable[code] > 0) {
                codeDist += Int64(this.readBits(Int64(distExtraTable[code])))
            }

            // lz77 decode
            if (op >= olength) {
                this.op = op
                output = this.expandBufferBlock()
                op = this.op
            }
            while (codeLength > 0) {
                output[op] = output[Int64(op) - Int64(codeDist)]
                op += 1
                codeLength -= 1
            }
            code = this.readCodeByTable(litlen)
        }

        while (this.bitsbuflen >= 8) {
            this.bitsbuflen -= 8
            this.ip -= 1
        }
        this.op = op
    }
    
    func decodeHuffmanAdaptive(litlen: Any, dist: Any) {
        var output: Array<UInt8> = this.output
        var op: Int64 = this.op
	
        this.currentLitlenTable = litlen

        var olength: Int64 = output.size
        var code: Int64
        var ti: Int64
        var codeDist: UInt32
        var codeLength: Int64

        let lengthCodeTable: Array<UInt16> = RawInflate.LengthCodeTable
        let lengthExtraTable: Array<UInt8> = RawInflate.LengthExtraTable
        let distCodeTable: Array<UInt16> = RawInflate.DistCodeTable
        let distExtraTable: Array<UInt8> = RawInflate.DistExtraTable
        
        code = this.readCodeByTable(litlen)
        while (code != 256 ){
            // literal
            if (code < 256) {
                if (op >= olength) {
                    output = this.expandBufferAdaptive(Option<ExpandOption>.None)
                    olength = output.size
                }
                output[Int64(op)] = UInt8(code)
                op += 1
                continue
            }

            // length code
            ti = code - 257
            codeLength = Int64(lengthCodeTable[ti])
            if (lengthExtraTable[ti] > 0) {
                codeLength += Int64(this.readBits(Int64(lengthExtraTable[ti])))
            }

            // dist code
            code = this.readCodeByTable(dist)
            codeDist = UInt32(distCodeTable[code])
            if (distExtraTable[Int64(code)] > 0) {
                codeDist += UInt32(this.readBits(Int64(distExtraTable[Int64(code)])))
            }

            // lz77 decode
            if (op + codeLength > olength) {
                output = this.expandBufferAdaptive(Option<ExpandOption>.None)
                olength = output.size
            }
            while (codeLength > 0) {
                output[Int64(op)] = output[Int64(op) - Int64(codeDist)]
                op += 1
                codeLength -= 1
            }
            code = this.readCodeByTable(litlen)
        }

        while (this.bitsbuflen >= 8) {
            this.bitsbuflen -= 8
            this.ip -= 1
        }
        this.op = Int64(op)
    }
    
    func expandBufferBlock() : Array<UInt8> {

        var buffer = Array<UInt8>(Int64(this.op - RawInflate.MaxBackwardLength), repeat:0)
        let backward: Int64 = this.op - RawInflate.MaxBackwardLength

        var output: Array<UInt8> = this.output
        // copy to output buffer
        
        output.copyTo(buffer, Int64(RawInflate.MaxBackwardLength), Int64(RawInflate.MaxBackwardLength), Int64(buffer.size))


        this.blocks.add(buffer)
        this.totalpos += buffer.size

        // copy to backward buffer
        //output.replaceSubrange(backward..<Int64(backward+RawInflate.MaxBackwardLength), with: output)

        output.copyTo(output, 0, backward, Int64(backward+RawInflate.MaxBackwardLength))

        this.op = RawInflate.MaxBackwardLength

        return output
    }
    
    func expandBufferAdaptive(optParam: ?ExpandOption) : Array<UInt8> {
        var buffer: Array<UInt8>
        var ratio:Int64 = (this.input.size / this.ip + 1) | 0
        var maxHuffCode: Int64
        var newSize: Int64
        var maxInflateSize: Int64

        let input: Array<UInt8> = this.input
        let output: Array<UInt8> = this.output
    
        if (optParam.isSome())  {
            let fixRatio = optParam.getOrThrow().fixRatio
            if (fixRatio.isSome()) {
                ratio = fixRatio.getOrThrow()
            }
            let addRatio = optParam.getOrThrow().addRatio
            if (addRatio.isSome()) {
                ratio += addRatio.getOrThrow()
            }
        }

        // calculate new buffer size
        if (ratio < 2) {
            maxHuffCode = (input.size - this.ip) / Int64(((this.currentLitlenTable as Array<UInt16>).getOrThrow()[2]))
            maxInflateSize = (Int64(maxHuffCode) / 2 * 258) | 0

            if (maxInflateSize < output.size) {
                newSize = output.size + maxInflateSize
            } else {
                newSize = output.size << 1
            }
            
        } else {
            newSize = output.size * ratio
        }

        // buffer expansion
        buffer = Array<UInt8>(newSize, repeat:0)

        output.copyTo(buffer, 0, 0, output.size)


        this.output = buffer

        return this.output
    }

    func concatBufferBlock() : Array<UInt8> {
        var pos: Int64 = 0
        let limit: Int64 = this.totalpos + (this.op - RawInflate.MaxBackwardLength)
        let output: Array<UInt8> = this.output
        let blocks: ArrayList<Array<UInt8>> = this.blocks
        var buffer: Array<UInt8> = Array<UInt8>(limit, repeat:0)
        
        // Single buffer
        if (blocks.size == 0) {
            return output.clone(RawInflate.MaxBackwardLength..this.op)
        }
        
        // Copy to buffer        
        for (i in 0..blocks.size) {
            let block: Array<UInt8> = blocks[i]
            for (j in 0..block.size) {
                buffer[pos] = block[j]
                pos += 1
            }
        }

        // Current buffer
        for (i in RawInflate.MaxBackwardLength..this.op) {
            buffer[pos] = output[i]
            pos += 1
        }

        this.blocks = ArrayList<Array<UInt8>>()
        this.buffer = buffer

        return this.buffer ?? Array<UInt8>()
    }

    func concatBufferDynamic() : Array<UInt8> {
        var tempBuffer: Array<UInt8>
        let op: Int64 = this.op

        
        if (this.resize) {
            tempBuffer = Array<UInt8>(op, repeat:0)
            output.copyTo(tempBuffer, 0, 0, op)
        } else {
            return this.output.clone(0..op-1)
        }


        this.buffer = tempBuffer

        return this.buffer ?? Array<UInt8>()
    }
}
