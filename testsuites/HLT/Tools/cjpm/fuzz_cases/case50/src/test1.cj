/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package test

// random seed:1706124042334
// All global variable need to be defined before use!
internal import test.a1.*

public var var_1706124042334_23: UInt16 = UInt16(UInt8(35))
let var_1706124042334_1501: Interface_1706124042334_10<Int64, UInt64> = Class_1706124042334_417<UInt8>()
let var_1706124042334_1526: ?Class_1706124042334_274 = (Option<Rune>.None as Class_1706124042334_274)

main(): Int64 {
    try {
        let var_1706124042334_13: Class_1706124042334_7 = Class_1706124042334_7();
        var var_1706124042334_28: Interface_1706124042334_11<Rune> = Class_1706124042334_7();
        if ((var_1706124042334_13.func_1706124042334_16(namedParam_1706124042334_17: var_1706124042334_23))) {
            (var_1706124042334_28.func_1706124042334_31(namedParam_1706124042334_32: Int16(115),
                namedParam_1706124042334_33: var_1706124042334_1501, namedParam_1706124042334_34: UInt16(140),
                namedParam_1706124042334_35: UInt16(114)))
        } else {
            (var_1706124042334_1511, UInt8(96), UInt64(238), [r'G', r'f', r'w', r'd', r'p', r'7', r'N', r'N', r'u', r'H'],
                (var_1706124042334_1526, var_1706124042334_690, ((UInt32(UInt32(137)) & 127)..=(UInt32(UInt32(186)) & 127) : (Int64(79) |
                        1)), var_1706124042334_1532, var_1706124042334_1538))[3][9]
        };
        var var_1706124042334_1559: Byte = UInt8(Int8(96));
        let var_1706124042334_1563: Range<Int16> = ((Int16(Int16(-34)) & 127)..=(Int16(Int16(-36)) & 127) : (Int64(-77) |
            1));
        var var_1706124042334_1587: UInt8 = UInt8(19);
        Int64(try { // block id: 1545
            var_1706124042334_1317
        } catch (_) { // block id: 1547
            const var_1706124042334_1554: UInt = 223;
            (true, Int64(-34), Float32(11.0), var_1706124042334_23, var_1706124042334_1554, (var_1706124042334_51,
                    var_1706124042334_1559, var_1706124042334_1563, (Option<Unit>.Some(()), Int64(-9),
                        var_1706124042334_623, ((Int32(Int32(-116)) & 127)..(Int32(Int32(94)) & 127) : (Int64(12) | 1)),
                        UInt8(240))), ((UInt8(UInt8(76)) & 127)..(UInt8(UInt8(22)) & 127) : (Int64(-37) | 1)), ((UInt8(UInt8(116)) &
                    127)..=(UInt8(UInt8(53)) & 127) : (Int64(104) | 1)))
        } finally { // block id: 1574
            var var_1706124042334_1591: (Option<Unit>, Int64, Int16, Range<Int32>, UInt8) = (Option<Unit>.None, Int64(106),
                Int16(Int16(Int8(4))), ((Int32(Int32(77)) & 127)..(Int32(Int32(95)) & 127) : (Int64(-72) | 1)), UInt8(119));
            (true, var_1706124042334_1578, Float32(-111.0), var_1706124042334_23, var_1706124042334_1463, (Option<Unit>
                        .Some(var_1706124042334_443), var_1706124042334_1587, ((Int16(Int16(-124)) & 127)..(Int16(Int16(81)) &
                        127) : (Int64(-77) | 1)), var_1706124042334_1591), var_1706124042334_1601, ((UInt8(UInt8(191)) &
                    127)..=(UInt8(UInt8(224)) & 127) : (Int64(0) | 1)))
        }[4])
        // CRC Check All Variables
        var crcCheck = CrcCheck(5000, 32)
        crcCheck.updateBuffer(UInt64(var_1706124042334_23 * var_1706124042334_23), 64)
        crcCheck.updateBuffer(UInt64(var_1706124042334_1559 * var_1706124042334_1559), 64)
        crcCheck.updateBuffer(UInt64(var_1706124042334_1587 * var_1706124042334_1587), 64)
        crcCheck.crcCheck()
        crcCheck.getCrcOutput()
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
            buffer[(i + buffer_index) % buffer.size] = byteArray[i + byte_index]
            i++
        }
        buffer_index = (buffer_index + i) % buffer.size
    }

    func updateBuffer(input: Bool, byte_n: Int64): Unit {
        if (input == true) {
            updateBuffer(1, byte_n)
        } else {
            updateBuffer(0, byte_n)
        }
    }

    func updateBuffer(input: Rune, byte_n: Int64): Unit {
        updateBuffer(UInt64(UInt32(input)), byte_n)
    }

    func updateBuffer(input: String, byte_n: Int64): Unit {
        for (c in input) {
            updateBuffer(c, byte_n)
        }
    }

    func updateBuffer(input: Unit, byte_n: Int64): Unit {
        updateBuffer(input.toString(), byte_n)
    }

    func updateBuffer(input: Any, byte_n: Int64): Unit {
        if (input is Hashable) {
            match (input as Hashable) {
                case Some(v) => updateBuffer(UInt64(v.hashCode()), byte_n)
                case _ => updateBuffer(1, byte_n)
            }
        } else if (input is ToString) {
            match (input as ToString) {
                case Some(v) => updateBuffer(v.toString(), byte_n)
                case _ => updateBuffer(1, byte_n)
            }
        } else {
            updateBuffer(1, byte_n)
        }
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
