/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// random seed:1654030064911

// All global variable need to be defined before use!
import f1.f2.f3.f4.*
var var124 : Class8 = Class8()
public let var170 : Result<Float64> = Result<Float64>.Err(Exception("LangFuzz Inner Exception"))
public var var182 : UInt16 = UInt16(104)
public var var237 : UInt64 = UInt64(196)
var var285 : Range<Int16> = ((Int16(-44)&127)..(Int16(24)&127):(70|1))
public open class Class8 {
    public init() { // block id: 10

    }
;
    public var var127 : Bool = true;
    static let var174 : Option<Option<Int64>> = Option<Option<Int64>>.None;
    open func func185(param186 : UInt16, param187 : UInt64, param188 : UInt16) : Unit { // block id: 189
        var var191 : (UInt8, Int8, Float32, Bool, UInt8) = (UInt8(Int8(63)), Int8(-80), Float32(Float32(Float32(-104.0))), (false is String), UInt8(Int8(Int8(Int8(54)))));
        var191;
        var174;
        var var249 : Float32 = Float32(Float32(Float32(Float32(Float32(-96.0)))));
        var var262 : Int32 = Int32(UInt16(Int16(2)));
        try { // block id: 207
            [(), var221, (), var221, (), var221, var221, (), (), ()][1];
            if (var127) { // block id: 234
                var237 += UInt64(105);
                ()
            };
            if (var127) { // block id: 243
                ()
            } else if (var127) { // block id: 246
                var249 *= var112
            }
        } catch (e: Exception) { // block id: 256
            ();
            try { // block id: 259
                var262 >>= ((var262) & 7);
                ();
                var221
            } catch (_) { // block id: 269
                ()
            }
        }
    }

}





public func func177() : UInt64 { // block id: 178
    ();
    UInt64(var182)
}

main(): Int64 {
    try {
        Class8.func13(92.0, var295, namedParam16 : Int8(-109))
        // CRC Check All Variables
        var crccheck = CrcCheck(5000, 32)
        crccheck.updateBuffer(UInt64(var182*var182), 64)
        crccheck.updateBuffer(UInt64(var237*var237), 64)
        crccheck.crcCheck()
        crccheck.getCrcOutput()
        ()
    } catch (e: NoneValueException) { println("Exception: NoneValueException") }

    return 0;
}

class CrcCheck {
    var buffer: Array<Int64>
    var poly: Array<Int64>
    var crc_output: Array<Int64>
    var poly_n: Int64
    var buffer_index: Int64
    var crc_output_n: Int64

    init(buffer_n: Int64, crc_n: Int64) {
        buffer_index = 0
        crc_output_n = 0
        crc_output = Array<Int64>(crc_output_n, { i => 0 })
        buffer = Array<Int64>(buffer_n, { i => 0 })
        poly_n = crc_n + 1
        if (crc_n == 32) {
            poly = [1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1]
        } else if (crc_n == 16) {
            poly = [1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1]
        } else if (crc_n == 8) {
            poly = [1, 0, 0, 0, 0, 0, 1, 1, 1]
        } else {
            poly = [1, 1, 0, 0, 1]
        }
    }

    func updateBuffer(input: UInt64, byte_n: Int64): Unit {
        var value = input
        if (byte_n == 64) {
            value = value & 0xffffffffffffffff
        } else if (byte_n == 32) {
            value = value & 0xffffffff
        } else if (byte_n == 16) {
            value = value & 0xffff
        } else {
            value = value & 0xff
        }
        var byteArray = Array<Int64>(byte_n, { i => 0 })
        var byte_c = 1
        var byte_index = 0
        while(value != 0) {
            if (value % 2 == 1) {
                byte_index = byte_n - byte_c
                byteArray[byte_index] = 1
            }
            byte_c++
            value = value >> 1
        }
        var i = 0
        while (i + byte_index < byte_n) {
            buffer[i + buffer_index] = byteArray[i + byte_index]
            i++
        }
        buffer_index = buffer_index + i
    }

    func crcCheck(): Unit {
        crc_output_n = buffer_index + poly_n - 1
        var crc_buffer = Array<Int64>(crc_output_n, { i => 0 })
        var i = 0
        while (i < buffer_index) {
            crc_buffer[i] = buffer[i]
            i++
        }
        i = 0
        while (i < buffer_index) {
            if (crc_buffer[i] == 1) {
                var j = 0
                while (j < poly_n) {
                    crc_buffer[j + i] = crc_buffer[j + i] ^ poly[j]
                    j++
                }
            }
            i++
        }
        let check_code = crc_buffer[buffer_index..]
        var byte_add = 3 - crc_output_n % 3
        crc_output_n = byte_add + crc_output_n
        crc_output = Array<Int64>(crc_output_n, { i => 0 })
        i = 0
        while (i < crc_output_n - byte_add) {
            if (i < buffer_index) {
                crc_output[i + byte_add] = buffer[i]
            } else {
                crc_output[i + byte_add] = check_code[i - buffer_index]
            }
            i++
        }
    }

    func getCrcOutput(): Unit {
        var i = 0
        while (i < crc_output_n) {
            var hex_value = 2**2 * crc_output[i] + 2**1 * crc_output[i + 1] + 1 * crc_output[i + 2]
            print(hex_value.toString())
            i = i + 3
        }
        print("\n")
    }
}
extend Class8 {
    public static func func13(param14 : Float64, param15 : Rune, namedParam16 ! : Int8) : Int64 { // block id: 17
        func func20<T0, T1, T2>(optionalParam21 ! : Int8 = Int8(UInt8(Int8(122))), optionalParam25 ! : Float64 = (-28.0), namedParam27 ! : UInt64, optionalParam28 ! : Unit = ()) : Class8 where T0 <: Class8, T1 <: Int16, T2 <: Array<Unit> { // block id: 30
            let var43 : Bool = (Int8(12) is String);
            var var51 : ?Int64 = Option<Int64>.None;
            ((if (var43) { Option<Option<Int64>>.Some(Option<Int64>.Some(125)) } else { Option<Option<Int64>>.Some(var51) }  ?? try { // block id: 54
                if (false) { var51 } else { var51 } 
            } finally { // block id: 59
                UInt8(67);
                Option<Int64>.None
            }) ?? match (param14) {
                case -103.0 | -79.0 | 5.0 => 
                    (-111) - 86
                
                case 24.0 | -77.0 | -21.0 | 112.0 => 
                    ();
                    (-23) / ((69) | 1)
                
                case _ => 
                    var81 % ((55) | 1)
                
            });
            try { // block id: 87
                var43 || var43
            } catch (e: Exception) { // block id: 91
                var97.var100;
                var var109 : Int8 = Int8(-41);
                (var106, var109, var112, var43, UInt8(143))[3];
                (var81 is String)
            } finally { // block id: 120
                ();
                var124.var127
            };
            match (((Option<Option<Int64>>.None as Aggregate93<Int32>) ?? Aggregate93<Int32>())) {
                case _ => 
                    if (false) { var124 } else { var124 } 
                
            }
        }
;
        let var290 : Int16 = Int16(-109);
        func20<Class8, Int16, Array<Unit>>(optionalParam25 : func145<Array<Unit>, Bool>(var174), namedParam27 : func177()).func185(try { // block id: 272
            Option<Int64>.Some((-100));
            var182
        } catch (e: Exception) { // block id: 276
            var221;
            var221;
            UInt16(219)
        }, (var237, var285)[0], UInt16(var290));
        53
    }

}

