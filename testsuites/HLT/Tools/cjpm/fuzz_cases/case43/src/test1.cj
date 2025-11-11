/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package test

// random seed:1691269712694

// All global variable need to be defined before use!
internal import test.g1.g2.g3.g4.g5.*
internal import test.h1.h2.h3.h4.*

public let var_1691269712694_30: UInt16 = UInt16(Int8(90))
public let var_1691269712694_210: Int16 = Int16(91)
public let var_1691269712694_611: ((Int64, UInt64, Float64, Int32, UInt16), UInt16, Array<Float32>, Rune) = ((Int64(UInt32(Int32(-25))),
        UInt64(UInt64(UInt32(134))), Float64((-70.0)), Int32(Int8(118)), UInt16(210)), UInt16(247), [Float32(24.0),
        Float32(-32.0), Float32(94.0), Float32(82.0), Float32(-78.0), Float32(-126.0), Float32(-101.0), Float32(68.0),
        Float32(78.0), Float32(8.0)], r'h')
public let var_1691269712694_640: ?UInt64 = (Option<Array<UInt16>>.None as UInt64)

public func func_1691269712694_8(param_1691269712694_9: Float64): Float32 { // block id: 10
    ["00?Qx-qo/J", "vHx[ZvS+n1", "0l@\"jXOt%a", "48|9+Dw%/N", "a/,ku-.:b0", ###"'J[7*2D6%r"###, "o9H6+ ?y_*",
        "$k8!eVbJpg", "(|~jF5,.^$", "1u^U~\"o}#U"][0];
    [try { // block id: 28
        var_1691269712694_30
    } catch (_) { // block id: 33
        ((UInt64(UInt64(250)) & 127)..=(UInt64(UInt64(92)) & 127) : (62 | 1));
        ();
        UInt16(180) / ((UInt16(240)) | 1)
    } finally { // block id: 39
        var_1691269712694_42 -= Int32(125)
        var_1691269712694_30 / ((var_1691269712694_30) | 1)
    }, UInt16(UInt8(174)),
        [UInt16(49), UInt16(218), UInt16(224), UInt16(109), UInt16(11), UInt16(251), UInt16(183), UInt16(155),
        UInt16(167), UInt16(215)][9],
        func_1691269712694_54<Float64, Float32>(namedParam_1691269712694_55: var_1691269712694_210), UInt16(122),
        ((-94) |> func_1691269712694_214<UInt32>), (var_1691269712694_178 ?? UInt16(53)), -var_1691269712694_30,
        if (false) { // block id: 382
        var var_1691269712694_384: Class_1691269712694_62 = Class_1691269712694_62(UInt16(182),
            ((Int8(Int8(Int8(UInt8(217)))) & 127)..=(Int8(Int8(UInt8(Int8(-8)))) & 127) : (47 | 1)), Int32(29));
        var_1691269712694_384;
        var_1691269712694_397;
        UInt16(226)
    } else { // block id: 443
        var var_1691269712694_446: UInt16 = UInt16(143);
        var_1691269712694_446 ^= var_1691269712694_446
        var_1691269712694_30
    }, UInt16(UInt16(78))][9];
    var var_1691269712694_583: UInt32 = UInt32(Int16(-111));
    var var_1691269712694_604: Int32 = Int32(-88);
    func_1691269712694_454(
        namedParam_1691269712694_455: (Option<Float32>.Some(var_1691269712694_556) ?? Float32(95.0)) + [Float32(-106.0),
            Float32(22.0), Float32(-56.0), Float32(60.0), Float32(-22.0), Float32(123.0), Float32(-22.0), Float32(-11.0),
            Float32(-12.0), Float32(66.0)][8], optionalParam_1691269712694_456: match (try { // block id: 565
            var_1691269712694_292;
            Option<UInt16>.None
        } catch (_) { // block id: 568
            var_1691269712694_571 <<= ((var_1691269712694_571) & 7)
            ();
            Option<UInt16>.None
        } finally { // block id: 580
            var_1691269712694_583 <<= ((var_1691269712694_583) & 7)
            var_1691269712694_178
        }) {
            case caseVar_1691269712694_590: UInt32 =>
                var_1691269712694_571 *= UInt64(97)
                ();
                if (var_1691269712694_199) {
                    var_1691269712694_178
                } else {
                    Option<UInt16>.None
                }

            case _ =>
                var_1691269712694_604 += var_1691269712694_604
                var_1691269712694_178
        }, optionalParam_1691269712694_463: var_1691269712694_611[3],
        namedParam_1691269712694_465: ([121, (-16), (-14), (-37), (-67), 61, 0, 104, (-95), 36][5], (var_1691269712694_640 ??
                UInt64(66)), Float64(117.0), (Option<Int32>.None ?? var_1691269712694_42), UInt16(Int16(17))))
}

main(): Int64 {
    try {
        var_1691269712694_658.var_1691269712694_661 |> func_1691269712694_8;
        Float32(35.0);
        (-81)
        // CRC Check All Variables
        var crccheck = CrcCheck(5000, 32)
        crccheck.updateBuffer(UInt64(var_1691269712694_30 * var_1691269712694_30), 64)
        crccheck.updateBuffer(UInt64(var_1691269712694_210 * var_1691269712694_210), 64)
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
