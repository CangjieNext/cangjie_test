/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package test

// random seed:1694984613120

// All global variable need to be defined before use!
internal import test.c1.c2.c3.c4.c5.*

var var_1694984613120_29: UInt32 = UInt32(44)
public let var_1694984613120_38: Enum_1694984613120_35 = Enum_1694984613120_35.enumValue_1694984613120_40
public let var_1694984613120_66: Array<UInt64> = [UInt64(247), UInt64(252), UInt64(240), UInt64(44), UInt64(92),
    UInt64(0), UInt64(101), UInt64(169), UInt64(49), UInt64(24)]
public var var_1694984613120_1065: UInt64 = UInt64(Int64(88))

public const func func_1694984613120_100<T0>(namedParam_1694984613120_101!: Int8,
    optionalParam_1694984613120_102!: Int32 = 3, namedParam_1694984613120_104!: Unit,
    namedParam_1694984613120_105!: Unit): Int64 { // block id: 106
    func_1694984613120_108()
}

main(): Int64 {
    try {
        let var_1694984613120_22: Bool = (UInt64(43) is Range<Int8>);
        var var_1694984613120_70: Bool = false;
        var var_1694984613120_81: UInt8 = UInt8(105);
        if ((var_1694984613120_22, ((Int8(Int8(96)) & 127)..=(Int8(Int8(-53)) & 127) : (Int64(66) | 1)), ((Int64(Int64(36)) &
                127)..=(Int64(Int64(68)) & 127) : (Int64(-48) | 1)), ((UInt32(var_1694984613120_29) & 127)..=(UInt32(UInt32(134)) &
                127) : (Int64(-4) | 1)))[0]) {
            match (var_1694984613120_38) {
                case caseVar_1694984613120_43: Float32 =>
                    var var_1694984613120_48: VArray<Float64, $8> = [Float64(94.0), Float64(-112.0), Float64(100.0),
                        Float64(-81.0), Float64(-5.0), Float64(-13.0), Float64(74.0), Float64(66.0)];
                    if (true) {
                        var_1694984613120_48
                    } else {
                        VArray<Float64, $8>(repeat: Float64(7.0))
                    }

                case _: Bool =>
                    var_1694984613120_66;
                    if (var_1694984613120_70) {
                        var_1694984613120_73
                    } else {
                        var_1694984613120_73
                    }

                case _ =>
                    var_1694984613120_81 += var_1694984613120_81
                    var_1694984613120_73
            }
        } else {
            (if (false) {
                VArray<Float64, $8>(repeat: var_1694984613120_54)
            } else {
                var_1694984613120_73
            })
        }[2];
        ((Int8(Int8(63)) & 127)..=(Int8(Int8(32)) & 127) : (Int64(117) | 1));
        var var_1694984613120_117: Int16 = Int16(-21);
        var var_1694984613120_1033: (Range<UInt32>) -> Enum_1694984613120_35 = func_1694984613120_129;
        func_1694984613120_100<UInt32>(namedParam_1694984613120_101: try { // block id: 113
            ((UInt16(UInt16(26)) & 127)..=(UInt16(UInt16(97)) & 127) : (Int64(22) | 1));
            ((Int16(var_1694984613120_117) & 127)..=(Int16(Int16(75)) & 127) : (Int64(-82) | 1));
            Int8(-26)
        } finally { // block id: 122
            Int16(6) * var_1694984613120_117;
            Int8(113)
        },
            optionalParam_1694984613120_102: match ((((UInt32(UInt32(21)) & 127)..=(UInt32(UInt32(114)) & 127) : (Int64(123) |
                1)) |> var_1694984613120_1033)) {
                case _ =>
                    let var_1694984613120_1044: Int8 = Int8(-118);
                    var var_1694984613120_1049: Int64 = Int64(40);
                    (true, ((Int8(Int8(-123)) & 127)..=(Int8(var_1694984613120_1044) & 127) : (Int64(56) | 1)), ((Int64(var_1694984613120_1049) &
                            127)..(Int64(var_1694984613120_1049) & 127) : (Int64(11) | 1)), ((UInt32(UInt32(56)) & 127)..(UInt32(UInt32(168)) &
                            127) : (Int64(-110) | 1)));
                    ();
                    var_1694984613120_1057 / ((Int32(78)) | 1)
            },
            namedParam_1694984613120_104: try (resource = Class_1694984613120_150<String, Range<UInt32>, UInt8>()) { // block id: 1062
                var_1694984613120_1065 >>= ((var_1694984613120_1065) & 7)
                var_1694984613120_379
            } catch (_) { // block id: 1070
                UInt32(242);
                var_1694984613120_1073;
                var_1694984613120_1065 <<= ((var_1694984613120_1065) & 7)
            } finally { // block id: 1087

            }, namedParam_1694984613120_105: var_1694984613120_379)
        // CRC Check All Variables
        var crccheck = CrcCheck(5000, 32)
        crccheck.updateBuffer(UInt64(var_1694984613120_29 * var_1694984613120_29), 64)
        crccheck.updateBuffer(UInt64(var_1694984613120_81 * var_1694984613120_81), 64)
        crccheck.updateBuffer(UInt64(var_1694984613120_117 * var_1694984613120_117), 64)
        crccheck.updateBuffer(UInt64(var_1694984613120_1065 * var_1694984613120_1065), 64)
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
