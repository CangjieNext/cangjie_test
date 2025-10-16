/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package test

// random seed:1650287111623

// All global variable need to be defined before use!
internal import test.b1.*

public let var14: Class7<Rune> = Class7<Rune>()
public var var1004: Unit = ()
public let var1024: ((Range<Int32>, Range<Int32>, Float32, Float64, Array<Range<Int8>>, (Range<Int32>, Range<UInt8>, 
    Range<Int64>, Range<UInt64>), Array<Range<UInt16>>, Int16, (Range<Int32>, Range<UInt8>, Range<Int64>, Range<UInt64>)), 
    Range<Int16>, Range<Int8>, String) = ((((Int32(Int32(72)) & 127)..=(Int32(UInt16(83)) & 127) : (((-39) | 1))), ((Int32(Int32(101)) &
            127)..=(Int32(Int16(79)) & 127) : ((Int64(Int32(40)) | 1))), Float32(99.0), 76.0, [((Int8(45) & 127)..=(Int8(111) &
            127) : ((-80) | 1)), ((Int8(-68) & 127)..(Int8(96) & 127) : ((45 | 1))),
            ((Int8(2) & 127)..(Int8(-65) & 127) : ((62 | 1))), ((Int8(106) & 127)..(Int8(81) & 127) : (((-54) | 1))),
            ((Int8(64) & 127)..(Int8(58) & 127) : (((-1) | 1))), ((Int8(91) & 127)..(Int8(-38) & 127) : (37 | 1)),
            ((Int8(96) & 127)..(Int8(-107) & 127) : (21 | 1)), ((Int8(46) & 127)..=(Int8(4) & 127) : ((9 | 1))),
            ((Int8(-56) & 127)..(Int8(60) & 127) : (((-73) | 1))), ((Int8(-106) & 127)..=(Int8(-13) & 127) : (86 | 1))],
        (((Int32(-35) & 127)..=(Int32(-94) & 127) : ((-104) | 1)), ((UInt8(218) & 127)..(UInt8(9) & 127) : (((-113) | 1))),
            (((-44) & 127)..=((-42) & 127) : (((-109) | 1))), ((UInt64(241) & 127)..(UInt64(198) & 127) : (((-79) | 1)))),
        [((UInt16(66) & 127)..=(UInt16(51) & 127) : (16 | 1)), ((UInt16(217) & 127)..=(UInt16(171) & 127) : (((-50) | 1))),
            ((UInt16(106) & 127)..=(UInt16(204) & 127) : (89 | 1)), ((UInt16(87) & 127)..(UInt16(120) & 127) : ((103 | 1))),
            ((UInt16(86) & 127)..=(UInt16(10) & 127) : (116 | 1)),
            ((UInt16(35) & 127)..=(UInt16(29) & 127) : (((-46) | 1))),
            ((UInt16(152) & 127)..(UInt16(219) & 127) : ((-113) | 1)),
            ((UInt16(161) & 127)..=(UInt16(251) & 127) : (125 | 1)), ((UInt16(25) & 127)..(UInt16(169) & 127) : (75 | 1)),
            ((UInt16(24) & 127)..(UInt16(37) & 127) : ((-61) | 1))], Int16(UInt8(UInt8(207))), (((Int32(-110) & 127)..(Int32(121) &
                127) : (((-120) | 1))), ((UInt8(11) & 127)..(UInt8(231) & 127) : (((-25) | 1))), ((105 & 127)..=((-73) &
                127) : (7 | 1)), ((UInt64(9) & 127)..(UInt64(66) & 127) : ((79 | 1))))), ((Int16(12) & 127)..=(Int16(Int8(UInt8(97))) &
        127) : (((-56) | 1))), ((Int8(-19) & 127)..=(Int8(-126) & 127) : ((Int64(UInt64(143)) | 1))), """
UJ0Yl
v:B|t
""")

public interface Interface10 {}

public interface Interface11 <: Interface12 {}

public open class Class7<T0> <: Interface10 & Interface11 {
    public init() { // block id: 9

    }
}

main(): Int64 {
    try {
        var14.func17(namedParam18: 4.0, namedParam19: 80, namedParam20: var1004);
        var var1011: UInt64 = UInt64(64);
        try { // block id: 1007

        } catch (_) { // block id: 1008
            var1011 /= ((var1011) | 1)
            var1004
        };
        let var1136: Int64 = (-93);
        match (Int64(var595)) {
            case caseVar1020 =>
                Class454();
                var1024;
                var1136;

            case -77 | -95 | -16 | -75 =>
                var var1144: Float32 = Float32(-38.0);
                var1144 -= Float32(-27.0)
                (-12) | (-20)

            case -14 | 34 | 14 | -2 =>
                var1004;
                if (var68) {
                    var1157
                } else {
                    Class7<Rune>()
                };
                var1136

            case 30 | 51 =>
                ();
                (-37);
                var1136

            case _ =>
                var68 ||= true
                var1136
        }
        // CRC Check All Variables
        var crccheck = CrcCheck(5000, 32)
        crccheck.updateBuffer(UInt64(var1011 * var1011), 64)
        crccheck.updateBuffer(UInt64(var1136 * var1136), 64)
        crccheck.crcCheck()
        crccheck.getCrcOutput()
        ()
    } catch (e: NoneValueException) {
        println("Exception: NoneValueException")
    }

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
        crc_output = Array<Int64>(crc_output_n, {i => 0})
        buffer = Array<Int64>(buffer_n, {i => 0})
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
        var byteArray = Array<Int64>(byte_n, {i => 0})
        var byte_c = 1
        var byte_index = 0
        while (value != 0) {
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
        var crc_buffer = Array<Int64>(crc_output_n, {i => 0})
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
        crc_output = Array<Int64>(crc_output_n, {i => 0})
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
            var hex_value = 2 ** 2 * crc_output[i] + 2 ** 1 * crc_output[i + 1] + 1 * crc_output[i + 2]
            print(hex_value.toString())
            i = i + 3
        }
        print("\n")
    }
}
