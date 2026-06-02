/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package test

// random seed:1654427862548

// All global variable need to be defined before use!
internal import test.a1.a2.a3.a4.*

let var38: Enum12 = Enum12.defaultValue
public var var60: Unit = ()

public enum Enum12 {
    defaultValue
    | enumValue41(Float64, UInt32, Option<Unit>)
}

main(): Int64 {
    try {
        let var25: Unit = ();
        let var48: ?Unit = Option<Unit>.Some(());
        (match (Enum12.defaultValue) {
            case _: Int64 =>
                var var20: Int8 = Int8(48);
                var20 ^ var20;
                Option<Unit>.Some(var25)

            case defaultValue =>
                var var31: UInt16 = UInt16(202);
                var31;
                if (var35) {
                    var38
                } else {
                    Enum12.enumValue41(90.0, UInt32(237), var48)
                };
                if (var35) {
                    Option<Unit>.Some(())
                } else {
                    Option<Unit>.Some(var25)
                }

            case _ =>
                var60;
                ();
                Option<Unit>.Some(())
        } ?? ());
        func67<Unit, UInt32>(match (Option<UInt8>.Some(var155)) {
            case _ =>
                ();
                Int8(-19)
        });
        let var190: Range<UInt64> = ((UInt64(227) & 127)..=(UInt64(68) & 127) : ((-3) | 1));
        match (match (((Int32(26) & 127)..=(Int32(4) & 127) : ((-114) | 1))) {
            case _: Int8 =>
                ((UInt8(109) & 127)..(UInt8(197) & 127) : ((-33) | 1));
                var48

            case _: Float64 =>
                if (false) {
                    var190
                } else {
                    ((UInt64(159) & 127)..(UInt64(46) & 127) : ((-9) | 1))
                };
                let var197: Unit = ();
                var197;
                var48

            case caseVar202: String =>
                if (true) {
                    Option<Unit>.None
                } else {
                    var48
                }

            case caseVar210: Enum89 => Option<Unit>.Some(())

            case _ =>
                if (false) {
                    Option<Unit>.None
                } else {
                    Option<Unit>.Some(())
                }
        }) {
            case caseVar223 =>
                var60;
                10

            case _: Enum89 =>
                var232 *= var232
                (-58)

            case caseVar238 => var106

            case _: Enum89 => var106

            case _ =>
                UInt32(132);
                var106
        }
        // CRC Check All Variables
        var crccheck = CrcCheck(5000, 32)
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
