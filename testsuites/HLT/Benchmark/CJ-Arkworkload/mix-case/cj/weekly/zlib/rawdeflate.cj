/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.HashMap
import std.collection.LinkedList
import std.collection.*

public class OptionParams {
    var lazy: ?Int64 = Option<Int64>.None
    var compressionType: ?CompressionType = Option<CompressionType>.None
    var outputBuffer: ?Array<UInt8> = Option<Array<UInt8>>.None
    var outputIndex: ?Int64 = Option<Int64>.None

    init( lazy: ?Int64, compressionType: ?CompressionType, outputBuffer: ?Array<UInt8>, outputIndex: ?Int64) {
        this.lazy = lazy
        this.compressionType = compressionType
        this.outputBuffer = outputBuffer
        this.outputIndex = outputIndex

    }


}
public class TreeSymbols {
    var codes: Array<UInt32>
    var freqs: Array<UInt8>
    init( codes: Array<UInt32>, freqs: Array<UInt8>) {
        this.codes = codes
        this.freqs = freqs
    
    }
}

public enum CompressionType {
    | NONE
    | FIXED
    | DYNAMIC
    | RESERVED
    
   public func getRawValue() {
        match(this) {
            case NONE => return 0
            case FIXED => return 1
            case DYNAMIC => return 2
            case RESERVED => return 3
            case _ => throw Exception("invalid value for input of getRawValue")
 
        }
    
    }
}



class RawDeflate_1{
    let val_codeLength: Array<UInt8>
    let val_symbols: Int64
    let val_currentPosition: Array<UInt64>
    let val_type: Array<Array<UInt32>>
    init(val_type: Array<Array<UInt32>>, val_currentPosition: Array<UInt64>, val_symbols: Int64, val_codeLength: Array<UInt8>) {
        this.val_type = val_type
        this.val_currentPosition = val_currentPosition
        this.val_symbols = val_symbols
        this.val_codeLength = val_codeLength
    }

    public func apply(index: Int64): Unit {
        let x = val_type[Int64(index)][Int64(val_currentPosition[Int64(index)])]
        if (Int64(x) == Int64(val_symbols)) {
            this.apply(index + 1)
            this.apply(index + 1)
        } else {
            val_codeLength[Int64(Int32(x))] -= 1
        }
        val_currentPosition[Int64(index)] += 1
    }

}

public class Lz77Match {
    public var length: Int64
    public var backwardDistance: Int64
    
    init(length: Int64, backwardDistance: Int64) {
        this.length = length
        this.backwardDistance = backwardDistance
    }
    
    public var LengthCodeTable = {   =>
        let code  =  { length: Int64 =>
            
            if (length == 3) {
                return [257, length - 3, 0]
            } else if (length == 4) {
                return [258, length - 4, 0]
            } else if (length == 5) {
                return [259, length - 5, 0]
            } else if (length == 6) {
                return [260, length - 6, 0]
            } else if (length == 7) {
                return [261, length - 7, 0]
            } else if (length == 8) {
                return [262, length - 8, 0]
            } else if (length == 9) {
                return [263, length - 9, 0]
            } else if (length == 10) {
                return [264, length - 10, 0]
            } else if (length <= 12) {
                return [265, length - 11, 1]
            } else if (length <= 14) {
                return [266, length - 13, 1]
            } else if (length <= 16) {
                return [267, length - 15, 1]
            } else if (length <= 18) {
                return [268, length - 17, 1]
            } else if (length <= 22) {
                return [269, length - 19, 2]
            } else if (length <= 26) {
                return [270, length - 23, 2]
            } else if (length <= 30) {
                return [271, length - 27, 2]
            } else if (length <= 34) {
                return [272, length - 31, 2]
            } else if (length <= 42) {
                return [273, length - 35, 3]
            } else if (length <= 50) {
                return [274, length - 43, 3]
            } else if (length <= 58) {
                return [275, length - 51, 3]
            } else if (length <= 66) {
                return [276, length - 59, 3]
            } else if (length <= 82) {
                return [277, length - 67, 4]
            } else if (length <= 98) {
                return [278, length - 83, 4]
            } else if (length <= 114) {
                return [279, length - 99, 4]
            } else if (length <= 130) {
                return [280, length - 115, 4]
            } else if (length <= 162) {
                return [281, length - 131, 5]
            } else if (length <= 194) {
                return [282, length - 163, 5]
            } else if (length <= 226) {
                return [283, length - 195, 5]
            } else if (length <= 257) {
                return [284, length - 227, 5]
            } else if (length == 258) {
                return [285, length - 258, 0]
            } else {
                throw Exception("invalid length: ${length}")
            }
        
        }
        var table : Array<Int64> = Array(258, repeat:0)
        var c: Array<Int64> = []
        
        for (i in 3..258) {
            c = code(i)
            table[i] = (c[2] << 24) | (c[1] << 16) | c[0]
        }
        
        return table
    }
    
    private func getDistanceCode_(dist: Int64) :  Array<Int64> {
        /** @type {!Array.<number>} distance code table. */
        var r: Array<Int64>
        
        if (dist == 1) {
            r = [0, dist - 1, 0]
        } else if (dist == 2) { 
            r = [1, dist - 2, 0]
        } else if (dist == 3) { 
            r = [2, dist - 3, 0]
        } else if (dist == 4) {
            r = [3, dist - 4, 0]
        } else if (dist <= 6 ) {
            r = [4, dist - 5, 1]
        } else if (dist <= 8) {
            r = [5, dist - 7, 1]
        } else if (dist <= 12) {
            r = [6, dist - 9, 2]
        } else if (dist <= 16) {
            r = [7, dist - 13, 2]
        } else if (dist <= 24) {
            r = [8, dist - 17, 3]
        } else if (dist <= 32) {
            r = [9, dist - 25, 3]
        } else if (dist <= 48) {
            r = [10, dist - 33, 4]
        } else if (dist <= 64) {
            r = [11, dist - 49, 4]
        } else if (dist <= 96) {
            r = [12, dist - 65, 5]
        } else if (dist <= 128) {
            r = [13, dist - 97, 5]
        } else if (dist <= 192) {
            r = [14, dist - 129, 6]
        } else if (dist <= 256) {
            r = [15, dist - 193, 6]
        } else if (dist <= 384) {
            r = [16, dist - 257, 7]
        } else if (dist <= 512) {
            r = [17, dist - 385, 7]
        } else if (dist <= 768) {
            r = [18, dist - 513, 8]
        } else if (dist <= 1024) {
            r = [19, dist - 769, 8]
        } else if (dist <= 1536) {
            r = [20, dist - 1025, 9]
        } else if (dist <= 2048) {
            r = [21, dist - 1537, 9]
        } else if (dist <= 3072) {
            r = [22, dist - 2049, 10]
        } else if (dist <= 4096) {
            r = [23, dist - 3073, 10]
        } else if (dist <= 6144) {
            r = [24, dist - 4097, 11]
        } else if (dist <= 8192) {
            r = [25, dist - 6145, 11]
        } else if (dist <= 12288) {
            r = [26, dist - 8193, 12]
        } else if (dist <= 16384) {
            r = [27, dist - 12289, 12]
        } else if (dist <= 24576) {
            r = [28, dist - 16385, 13]
        } else if (dist <= 32768) {
            r = [29, dist - 24577, 13]
        } else {
            throw Exception("invalid distance")
        }
        return r
    }
    
    public func toLz77Array() : Array<Int64> {
        let length = this.length
        let dist = this.backwardDistance
        var codeArray:  Array<Int64> = [0, 0, 0, 0, 0, 0]
        var pos: Int64 = 0
        var code: Int64
        
        // length
        code = this.LengthCodeTable()[length]
        codeArray[pos] = code & 0xffff
        codeArray[pos + 1] = (code >> 16) & 0xff
        codeArray[pos + 2] = code >> 24
        pos += 3
        
        // distance
        let distCode = this.getDistanceCode_(dist)
        codeArray[pos] = distCode[0]
        codeArray[pos + 1] = distCode[1]
        codeArray[pos + 2] = distCode[2]
        
        return codeArray
    }
}

/**
 * @Generator
 */
public class RawDeflate {
   
    public var compressionType: CompressionType
    public var lazy: Int64 = 0
    public var freqsLitLen: Array<UInt32> = Array()
    public var freqsDist: Array<UInt32> = Array()
    public var input: Array<UInt8> = Array()
    public var output: Array<UInt8> = Array()
    public var op: Int64 = 0
    public var length: Int64 = 0
    public var backwardDistance: Int64
    public static let Lz77MaxLength: Int64 = 258
    public static let WindowSize: Int64 = 0x8000
    public static let MaxCodeLength: Int64 = 16
    public static let HUFMAX: Int64 = 286
    public static let Lz77MinLength: Int64 = 3
    
    public init(input: Array<UInt8>, opt_params!: ?OptionParams = Option<OptionParams>.None) {
        this.compressionType = CompressionType.DYNAMIC
        this.lazy = 0
        this.length = 0
        this.backwardDistance = 0
        this.input = input
        this.op = 0
        // option parameters

        if (opt_params.isSome()) {
            if (opt_params.getOrThrow().lazy.isSome()) {
                this.lazy = opt_params.getOrThrow().lazy.getOrThrow()
            }
            let compressionType = opt_params.getOrThrow().compressionType
            if (compressionType.isSome()) {
                this.compressionType = compressionType.getOrThrow()
            }
	    let outputBuffer = opt_params.getOrThrow().outputBuffer
            if (outputBuffer.isSome()) {
                this.output = outputBuffer.getOrThrow()
            }
	    let outputIndex = opt_params.getOrThrow().outputIndex
            if (outputIndex.isSome()) {
                this.op = outputIndex.getOrThrow()
            }
        }
        
        this.output = Array<UInt8>(0x8000, repeat:0)
    }
    
    public static func FixedHuffmanTable() :Array<Array<Int64>> { 
        var table: ArrayList<Array<Int64>> = ArrayList<Array<Int64>>()
        
        for (i in 0..288) {
            if(i <= 143) {
                table.add([i + 0x030, 8])
            } else if (i <= 255) {
                table.add([i - 144 + 0x190, 9])
            } else if (i <= 279) {
                table.add([i - 256 + 0x000, 7])
            } else if (i <= 287) {
                table.add([i - 280 + 0x0c0, 8])
            } else {
                throw Exception("invalid literal: ${i}")
            }
        }
        return table.toArray()
    }
    
    public func compress() : Array<UInt8> {
        var blockArray: Array<UInt8>
        let input: Array<UInt8> = this.input
        match( this.compressionType) {
        case CompressionType.NONE =>
            // each 65535-Byte (length header: 16-bit)
            var position = 0
            let length = input.size
            while (position < length) {
                blockArray = input.clone(position..min((position + 0xffff), length))
                position += blockArray.size
                this.makeNocompressBlock(blockArray, position == length)
            }
        case CompressionType.FIXED =>
            this.output = this.makeFixedHuffmanBlock(input, true)
            this.op = this.output.size
        case CompressionType.DYNAMIC =>
            this.output = this.makeDynamicHuffmanBlock(input, true)
            this.op = this.output.size
        case _ =>
            throw Exception("invalid compression type")
        }
        return this.output
    }
    
    func makeNocompressBlock(blockArray: Array<UInt8>, isFinalBlock: Bool) : Array<UInt8> {
        var bfinal: Int64
        var btype: CompressionType
        var len: Int64
        var nlen: Int64
        
        var output = this.output
        var op = this.op
        
        // expand buffer
        
        output = this.output.clone()
        while (output.size <= op + blockArray.size + 5) {
            output = Array<UInt8>(output.size << 1, repeat:0)
        }
        //output.replaceSubrange(0..this.output.size, with: this.output)
        this.output.copyTo(output, 0, 0, this.output.size)
    
        // header
        //bfinal = isFinalBlock ? 1 : 0
        if (isFinalBlock) {
            bfinal = 1
        } else {
            bfinal = 0
        }
        btype = CompressionType.NONE
        output[op] = UInt8(bfinal) | (UInt8(btype.getRawValue()) << 1)
        
        // length
        len = blockArray.size
        nlen = (!len + 0x10000) & 0xffff
        output[op+1] = UInt8(len & 0xff)
        output[op+2] = UInt8((len >> 8) & 0xff)
        output[op+3] = UInt8(nlen & 0xff)
        output[op+4] = UInt8((nlen >> 8) & 0xff)
        op += 5
        // copy buffer
        
        //output.replaceSubrange(op..blockArray.size, with: blockArray)
        blockArray.copyTo(output, 0, op, blockArray.size)

        op += blockArray.size
        output = output.clone(0..op)
	

        this.op = op
        this.output = output
        
        return output
    }
    
    public func makeFixedHuffmanBlock(blockArray: Array<UInt8>,  isFinalBlock: Bool) : Array<UInt8> {
        var stream = BitStream(this.output.clone(), this.op)
        var bfinal: Int64 = 0
        var btype: CompressionType = CompressionType.FIXED
        var data: Array<UInt16>
        
        // header
        //bfinal = isFinalBlock ? 1 : 0
        if (isFinalBlock) {
            bfinal = 1
        } else {
            bfinal = 0
        }
 
        stream.writeBits(bfinal, 1, reverse:true)
        stream.writeBits(btype.getRawValue(), 2, reverse:true)
        
        data = this.lz77(blockArray)
        this.fixedHuffman(data, stream)
        
        return stream.finish()
    }
    
    func makeDynamicHuffmanBlock(blockArray: ?Array<UInt8>, isFinalBlock: Bool) :  Array<UInt8> {
        let stream = BitStream(this.output, this.op)
        var bfinal: Int
        var btype: CompressionType
        var data: Array<UInt16>
        var hlit: Int64 = 0
        var hdist: Int64 = 0
        var hclen: Int64 = 0
        var hclenOrder = [16, 17, 18, 0, 8, 7, 9, 6, 10, 5, 11, 4, 12, 3, 13, 2, 14, 1, 15]
        var litLenLengths: Array<UInt8>
        var litLenCodes: Array<UInt16>
        var distLengths: Array<UInt8>
        var distCodes: Array<UInt16>
        var treeSymbols: TreeSymbols
        var treeLengths: Array<UInt8>
        var transLengths = Array<Int64>(19, repeat:0)
        var treeCodes: Array<UInt16>
        var code: Int64
        var bitlen: Int64
        
        // header
        //bfinal = isFinalBlock ? 1 : 0

        if (isFinalBlock) {
            bfinal = 1
        } else {
            bfinal = 0
        }

        btype = CompressionType.DYNAMIC
        
        stream.writeBits(bfinal, 1, reverse:true)
        stream.writeBits(btype.getRawValue(), 2, reverse:true)
        
        data = this.lz77(blockArray)
        
        litLenLengths = this.getLengths_(this.freqsLitLen, 15)
        litLenCodes = this.getCodesFromLengths_(litLenLengths)
        distLengths = this.getLengths_(this.freqsDist, 7)
        distCodes = this.getCodesFromLengths_(distLengths)
            
        hlit = 286
        do {
            if (litLenLengths[hlit - 1] == 0 ){
                break
            }
            hlit = hlit - 1
        } while( hlit > 257)
        
        hdist = 30
        do {
            if (distLengths[hdist - 1] == 0) {
                break
            }
            hdist = hdist -1
        } while( hdist > 1)
        
        // HCLEN
        treeSymbols = this.getTreeSymbols_(hlit, litLenLengths, hdist, distLengths)
        treeLengths = this.getLengths_((treeSymbols.freqs as Array<UInt32>).getOrThrow(), 7)
        for (i in 0..19) {
            transLengths[i] = Int64(treeLengths[hclenOrder[i]])
        }

        hclen = 19
        do {
            if (transLengths[hclen - 1] == 0) {
                break
            }
            hclen = hclen -1
        } while(hclen > 4)
        
        treeCodes = this.getCodesFromLengths_(treeLengths)
        
        stream.writeBits(hlit - 257, 5, reverse:true)
        stream.writeBits(hdist - 1, 5, reverse:true)
        stream.writeBits(hclen - 4, 4, reverse:true)
        for (i in 0..hclen) {
            stream.writeBits(Int64(transLengths[i]), 3, reverse:true)
        }
        
        var i : Int64 = 0
        let il = treeSymbols.codes.size
        while (i < il) {
            code = Int64(treeSymbols.codes[i])
            
            stream.writeBits(Int64(treeCodes[code]), Int64(treeLengths[code]), reverse:true)
            
            // extra bits
            if (code >= 16) {
                i += 1
                match(code) {
                case 16 =>
                    bitlen = 2
                case 17 =>
                    bitlen = 3
                case 18 =>
                    bitlen = 7
                case _ =>
                    throw Exception("invalid code: ${code}")
                }
                
                stream.writeBits(Int64(treeSymbols.codes[i]), bitlen, reverse:true)
            }
            
            i += 1
        }
        
        this.dynamicHuffman(data, (litLenCodes, litLenLengths), (distCodes, distLengths), stream)
        
        return stream.finish()
    }
    
    func dynamicHuffman(dataArray: Array<UInt16>, litLen: (Array<UInt16>,Array<UInt8>), dist: (Array<UInt16>,Array<UInt8>), stream: BitStream) : BitStream {
        var index = 0
        var literal: UInt16
        var code: UInt16
        let litLenCodes = litLen[0]
        let litLenLengths = litLen[1]
        let distCodes = dist[0]
        let distLengths = dist[1]
        
        // write symbols to BitStream
        while (index < dataArray.size) {
            literal = dataArray[index]
            
            // literal or length
            stream.writeBits(Int64(litLenCodes[Int64(literal)]), Int64(litLenLengths[Int64(literal)]), reverse:true)
            
            // length/distance symbol
            if (literal > 256) {
                // length extra
                stream.writeBits(Int64(dataArray[index+1]), Int64(dataArray[index+2]), reverse:true)
                // distance
                code = dataArray[index+3]
                stream.writeBits(Int64(distCodes[Int64(code)]), Int64(distLengths[Int64(code)]), reverse:true)
                // distance extra
                stream.writeBits(Int64(dataArray[index+4]), Int64(dataArray[index+5]), reverse:true)
                // end marker
                index += 5
            } else if (literal == 256) {
                break
            }
            index += 1
        }
        return stream
    }
    
    func fixedHuffman(dataArray: Array<UInt16>, stream: BitStream): BitStream {
        var index: Int64 = 0
        var literal: UInt16

        while (index < dataArray.size) {
            literal = dataArray[index]
            stream.writeBits(Int64(RawDeflate.FixedHuffmanTable()[Int64(literal)][0]), Int64(RawDeflate.FixedHuffmanTable()[Int64(literal)][1]))
            if (literal > 0x100) {
                stream.writeBits(Int64(dataArray[index+1]), Int64(dataArray[index+2]), reverse:true)
                stream.writeBits(Int64(dataArray[index+3]), 5)
                stream.writeBits(Int64(dataArray[index+4]), Int64(dataArray[index+5]), reverse:true)
                index += 5
            } else if (literal == 0x100) {
                break
            }
        }
        return stream
    }
    
    func lz77(dataArray: ?Array<UInt8>) : Array<UInt16> {
        
        var matchKey: UInt32 = 0
        var table: HashMap<?UInt32, ?ArrayList<Int64>> = HashMap<?UInt32, ?ArrayList<Int64>>()
        let windowSize:Int64 = RawDeflate.WindowSize
        var matchsList: ArrayList<Int64> = ArrayList<Int64>()
        var longestMatch: Lz77Match
        var prevMatch: ?Lz77Match = Option<Lz77Match>.None
        var lz77buf = Array<UInt16>(dataArray.getOrThrow().size * 2, repeat:0)
        var pos:Int64 = 0
        var skipLength:Int64 = 0
        var freqsLitLen:Array<UInt32> = Array<UInt32>(286, repeat:0)
        var freqsDist:Array<UInt32> = Array<UInt32>(30, repeat:0)
        let lazy: Int64 = this.lazy
        var tmp: UInt8
        
	
        freqsLitLen[256] = 1
        
        func writeMatch(match_tmp: Lz77Match, offset: Int64){
            let lz77Array: Array<Int64> = match_tmp.toLz77Array()
            
            for (i in 0..lz77Array.size) {
                lz77buf[pos] = UInt16(lz77Array[i])
                pos += 1
            }
            
            freqsLitLen[Int64(lz77Array[0])] += 1
            freqsDist[Int64(lz77Array[3])] += 1
            skipLength = match_tmp.length + offset - 1
            prevMatch =  Option<Lz77Match>.None
        } 
        

        for (position in 0..dataArray.getOrThrow().size) {
            let end:Int64 = min(position + RawDeflate.Lz77MinLength, dataArray.getOrThrow().size)
            for (i in 0..RawDeflate.Lz77MinLength) {
                if (position + i == dataArray.getOrThrow().size) {
                    break
                }
                matchKey = (matchKey << 8) | UInt32(dataArray.getOrThrow()[position + i])
            }
            

            
            if ( table.get(matchKey).isSome() ) {
                matchsList = table.get(matchKey).getOrThrow().getOrThrow()
            } else {
                
              matchsList = ArrayList<Int64>([]);
              table[matchKey] = matchsList;
            }
            
            if (skipLength > 0) {
                skipLength -= 1;
                matchsList.add(Int64(position))
                continue
            }
            
            while (matchsList.size > 0 && position - Int64(matchsList[0]) > windowSize) {
                matchsList.remove(at: 0)
            }
            
            if (position + RawDeflate.Lz77MinLength >= dataArray.getOrThrow().size) {
                if (prevMatch.isSome()) {
                    writeMatch(prevMatch.getOrThrow(), -1)
                }
                
                for (i in position..dataArray.getOrThrow().size) {
                    tmp = dataArray.getOrThrow()[i]
                    lz77buf[pos] = UInt16(tmp)
                    pos += 1
                    freqsLitLen[Int64(tmp)] += 1
                }
                
                break
            }
            
            if (matchsList.size > 0) {
                longestMatch = this.searchLongestMatch(dataArray, position,matchsList.toArray())
                if (prevMatch.isSome()) {
                    if (prevMatch.getOrThrow().length < longestMatch.length) {
                        // write previous literal
                        tmp = dataArray.getOrThrow()[position - 1]
                        lz77buf[pos] = UInt16(tmp)
                        pos += 1
                        freqsLitLen[Int64(tmp)] += 1

                        // write current match
                        writeMatch(longestMatch, 0)
                    } else {
                        // write previous match
                        writeMatch(prevMatch.getOrThrow(), -1)
                    }
                } else if (longestMatch.length < lazy) {
                    prevMatch = longestMatch
                } else {
                    writeMatch(longestMatch, 0)
                }
            } else if ( prevMatch.isSome()) {
                writeMatch(prevMatch.getOrThrow(), -1)
            } else {
                tmp = dataArray.getOrThrow()[position]
                lz77buf[pos] = UInt16(tmp)
                pos += 1
                freqsLitLen[Int64(tmp)] += 1
            }
            
            matchsList.add(position)
        }
        
        lz77buf[pos] = 256
	    pos += 1
        freqsLitLen[256] += 1
        
        this.freqsLitLen = freqsLitLen
        this.freqsDist = freqsDist
        /** @type {!(Uint16Array|Array.<number>)} */
        return lz77buf.clone(0..pos)
    }

    func searchLongestMatch(data: ?Array<UInt8>, position: Int64, matchList: Array<Int64> ) : Lz77Match {
        var match_tmp: Int64
        var currentMatch: ?Int64 = Option<Int64>.None
        var matchMax = 0;
        var matchLength: Int64
        let dl: Int64 = data.getOrThrow().size
        
        for (i in 0..matchList.size) {
            match_tmp = matchList[matchList.size - i - 1]
            matchLength = RawDeflate.Lz77MinLength
        
            if (matchMax > RawDeflate.Lz77MinLength) {
                var j = matchMax
                do {
                    if (data.getOrThrow()[match_tmp + j - 1] != data.getOrThrow()[position + j - 1]) {
                        continue 
                    }
                    j = j -1
                } while( j > RawDeflate.Lz77MinLength + 1)
                matchLength = matchMax
            }
        
            while (matchLength < RawDeflate.Lz77MaxLength && position + matchLength < dl &&  data.getOrThrow()[match_tmp + matchLength] == data.getOrThrow()[position + matchLength]) {
                matchLength += 1
            }
        
            if (matchLength > matchMax) {
                currentMatch = match_tmp
                matchMax = matchLength
            }
        
            if (matchLength == RawDeflate.Lz77MaxLength) {
                break
            }
        }
        return Lz77Match(matchMax, position - (currentMatch ?? 0))
    }
    
    func getTreeSymbols_ (hlit: Int64,  litlenLengths: Array<UInt8>, hdist: Int64, distLengths: Array<UInt8> ) : TreeSymbols {
            var src = Array<UInt32>(hlit + hdist, repeat:0)
            var j: Int64 = 0
            var runLength: Int64
            var result:Array<UInt32> = Array<UInt32>(286 + 30, repeat:0)
            var nResult: Int64
            var rpt: Int64
            var freqs:Array<UInt8> = Array<UInt8>(19, repeat:0)
        
        for (i in 0..hlit) {
            src[j] = UInt32(litlenLengths[i])
            j += 1
        }
        for (i in 0..hdist) {
            src[j] = UInt32(distLengths[i])
            j += 1
        }
        
        nResult = 0
        var i:Int64 = 0 
        while  (i < src.size) {
            j = 1
            while (i + j < src.size && src[i + j] == src[i]) {
                j += 1
            }
	    
	     runLength = j
            
            if (src[i] == 0) {
                if (runLength < 3) {
                    while (runLength > 0) {
                        result[nResult] = 0
                        freqs[0] += 1
                        nResult += 1
                        runLength -= 1
                    }
                } else {
                    while (runLength > 0) {
                        rpt = min(runLength, 138)
                        
                        if (rpt > runLength - 3 && rpt < runLength) {
                            rpt = runLength - 3
                        }
                        
                        if (rpt <= 10) {
                            result[nResult] = 17
                            result[nResult + 1] = UInt32(rpt - 3)
                            freqs[17] += 1
                            nResult += 2
                        } else {
                            result[nResult] = 18
                            result[nResult + 1] = UInt32(rpt - 11)
                            freqs[18] += 1
                            nResult += 2
                        }
                        
                        runLength -= rpt
                    }
                }
            } else {
                result[nResult] = src[i]
        	nResult += 1;
                freqs[Int64(src[i])] += 1
                runLength -= 1
                
                if (runLength < 3) {
                    while (runLength > 0) {
                        result[nResult] = src[i]
                        freqs[Int64(src[i])] += 1
                        nResult += 1
                        runLength -= 1
                    }
                } else {
                    while (runLength > 0) {
                        rpt = min(runLength, 6)
                        
                        if (rpt > runLength - 3 && rpt < runLength) {
                            rpt = runLength - 3
                        }
                        
                        result[nResult] = 16
                        result[nResult + 1] = UInt32(rpt - 3)
                        freqs[16] += 1
                        nResult += 2
                        runLength -= rpt
                    }
                }
            }
            i += j
        }
        return TreeSymbols(result.clone(0..nResult), freqs)
    }
    
    func getLengths_ ( freqs: Array<UInt32>, limit: Int64 ) : Array<UInt8> {
        let nSymbols:Int64 = freqs.size
        let heap:Heap = Heap(2 * RawDeflate.HUFMAX)
        var length:Array<UInt8> = Array<UInt8>(nSymbols, repeat:0)
        var nodes: Array<PopObject>
        var values: Array<UInt32>
        var codeLength: Array<UInt8>
        
        for (i in 0..nSymbols) {
            let intfreqs:Int64 = Int64(freqs[i])
            if (intfreqs > 0) {
                heap.push(i, intfreqs)
            }
        }
        nodes = Array(heap.length/2, repeat:PopObject(0, 0, 0))
        values = Array<UInt32>(heap.length/2, repeat:0)
        
        if (nodes.size == 1) {
            length[heap.pop().index] = 1
            return length
        }
         for (i in 0..heap.length/2) {
             nodes[i] = heap.pop()
             values[i] = UInt32(nodes[i].value)
         }
         codeLength = this.reversePackageMerge_(values, values.size, limit)
        
        for (i in 0..nodes.size) {
            length[nodes[i].index] = codeLength[i]
        }
        
        return length
    }
    
    func reversePackageMerge_(freqs: Any, symbols: Int64, limit: Int64) :Array<UInt8> {
            var minimumCost = Array<UInt16>(limit, repeat:0)
            var flag:Array<UInt8> = Array<UInt8>(limit, repeat:0)
            var codeLength:Array<UInt8> = Array<UInt8>(symbols, repeat:0)
            var value = Array<Array<UInt32>>(Int64(limit), repeat:Array<UInt32>())
            var type_tmp = Array<Array<UInt32>>(Int64(limit), repeat:Array<UInt32>())
            var currentPosition:Array<UInt64> = Array<UInt64>(limit, repeat:0)

            var excess:Int64 = (1 << limit) - symbols
            let half:Int64 = 1 << (limit - 1)
            var weight: Int64 = 0
            var next: Int64 = 0
            let takePackage = RawDeflate_1(type_tmp, currentPosition, symbols, codeLength)
        

            minimumCost[Int64(limit) - 1] = UInt16(symbols)

            for (j in 0..Int64(limit)) {
                if (excess < half) {
                    flag[j] = 0
                } else {
                    flag[j] = 1
                    excess -= half
                }
                excess <<= 1
                minimumCost[Int64(limit) - 2 - j] = ((UInt16(minimumCost[Int64(limit) - 1 - j] / 2))) + UInt16(symbols)
            }
            minimumCost[0] = UInt16(flag[0])

            value[0] = Array<UInt32>(Int64(minimumCost[0]), repeat:0)
            type_tmp[0] = Array<UInt32>(Int64(minimumCost[0]), repeat:0)
            for (j in 1..Int64(limit)) {
                if (minimumCost[j] > 2 * minimumCost[j - 1] + UInt16(flag[j])) {
                    minimumCost[j] = 2 * minimumCost[j - 1] + UInt16(flag[j])
                }
                value[j] = Array<UInt32>(Int64(minimumCost[j]), repeat:0)
                type_tmp[j] = Array<UInt32>(Int64(minimumCost[j]), repeat:0)
            }

            for (i in 0..Int64(symbols)) {
                codeLength[i] = UInt8(limit)
            }

            for (t in 0..Int64(minimumCost[Int64(limit) - 1])) {
                value[Int64(limit) - 1][t] = (freqs as Array<UInt32>).getOrThrow()[t]
                type_tmp[Int64(limit) - 1][t] = UInt32(t)
            }

            for (i in 0..Int64(limit)) {
                currentPosition[i] = 0
            }

            if (flag[Int64(limit) - 1] == 1) {
                codeLength[0] -= 1
                currentPosition[Int64(limit) - 1] += 1
            }

            var j = Int64(limit) - 2
            while (j >= 0) {
                var i: Int64 = 0
                weight = 0
                next = Int64(currentPosition[j + 1])
                var t :Int64 = 0
                while (t < Int64(minimumCost[j])) {
                    weight = Int64(value[j + 1][Int64(next)] + value[j + 1][Int64(next) + 1])

                    if (weight > (freqs as Array<Int64>).getOrThrow()[Int64(i)]) {
                        value[j][t] = UInt32(weight)
                        type_tmp[j][t] = UInt32(symbols)
                        next += 2
                    } else {
                        value[j][t] = (freqs as Array<UInt32>).getOrThrow()[i]
                        type_tmp[j][t] = UInt32(i)
                        i += 1
                    }
                    t += 1
                }
                
                currentPosition[j] = 0
                if (flag[j] == 1) {
                    takePackage.apply(j)
                }
                j -= 1
            }

            return codeLength
        }
    
    public func getCodesFromLengths_(lengths: Array<UInt8>) : Array<UInt16> {
        var codes = Array<UInt16>(lengths.size, repeat:0)
        var count = Array<Int64>()
        var startCode = Array<Int64>()
        var code: Int64 = 0
        
        // Count the codes of each length.
        for (i in 0..lengths.size) {
            count[Int64(lengths[i])] = (count[Int64(lengths[i])] | 0) + 1;
        }
        
        // Determine the starting code for each length block.
        for (i in 1..Int64(RawDeflate.MaxCodeLength)) {
            startCode[i] = code
            code += count[i] | 0
            code <<= 1
        }
        
        // Determine the code for each symbol. Mirrored, of course.
        for (i in 0..lengths.size) {
            code = startCode[Int64(lengths[i])]
            startCode[Int64(lengths[i])] += 1
            codes[i] = 0
            
            for (j in 0..Int64(lengths[i])) {
                codes[i] = (codes[i] << 1) | UInt16((code & 1))
                code >>= 1
            }
        }
        return codes
    }
}

