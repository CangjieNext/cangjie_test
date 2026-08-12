/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %overflow_wrapping %cmp_opt %f -o %output
// RUN-EXEC-1: %run %run_opt %output %run_args

// random seed:1770555746335
// All global variable need to be defined before use!
import std.collection.*
import std.runtime.*
import std.time.*

public let var_1770555746335_44: Unit = ()
let var_1770555746335_140: Rune = r'l'
@Deprecated
let var_1770555746335_149: UInt64 = UInt64(185)

public interface Interface_1770555746335_11 {}

public interface Interface_1770555746335_13 {}

public interface Interface_1770555746335_12 <: Interface_1770555746335_11 & Interface_1770555746335_13 {}

@Deprecated
public open class Class_1770555746335_8 <: Interface_1770555746335_11 & Interface_1770555746335_12 {
    public Class_1770555746335_8() { // block id: 10

    }

    init(namedParam_1770555746335_136!: Enum_1770555746335_36, namedParam_1770555746335_137!: UInt64) { // block id: 138
        throw Exception("demangle test");
        var_1770555746335_140
    };

    @Frozen
    static prop var_1770555746335_155: UInt8 { // block id: 156
        get() { // block id: 158
            UInt8(UInt8(140))
        }
    }

    @Frozen
    public static func func_1770555746335_16(): Int64 { // block id: 17
        let iter18 = ((func_1770555746335_31(
            ((UInt8(UInt8(32)) & 127)..(UInt8(var_1770555746335_155) & 127) : (Int64(90) | 1))))).iterator()
        while (true) {
            match (iter18.next()) {
                case None => break
                case Some(v) => match (v) {
                    case i where (false) => ();
                    case _ => continue
                }
            }
        };

        Int64(UInt32(105))
    }
}

public enum Enum_1770555746335_36 {
    defaultValue
}

@Deprecated
func func_1770555746335_31(param_1770555746335_32: Range<UInt8>): Range<UInt64> { // block id: 33
    let var_1770555746335_57: Float32 = Float32(Float32(Float32(Float32(-68.0))));
    var var_1770555746335_78: Int64 = Int64(97);
    const var_1770555746335_93: UInt32 = 214;
    match (match (Enum_1770555746335_36.defaultValue) {
        case caseVar_1770555746335_41: Rune =>
            var_1770555746335_44;
            const var_1770555746335_47: Float32 = 107.0;
            var_1770555746335_47

        case _ => Float32(75.0)

        case _: Range<Int64> => var_1770555746335_57

        case _: Int16 =>
            var_1770555746335_44;
            Float32(-119.0) / Float32((Int32(var_1770555746335_57)) | 1)

        case _ => Float32(58.0)
    }) {
        case _: Range<UInt16> =>
            var_1770555746335_78 = var_1770555746335_78 - 1
            var_1770555746335_57

        case _: Range<Int16> =>
            const var_1770555746335_85: Unit = ();
            var_1770555746335_85;
            Float32(-69.0)

        case _ =>
            ((UInt32(var_1770555746335_93) & 127)..(UInt32(UInt32(146)) & 127) : (var_1770555746335_78 | 1));
            Float32(79.0)
    };
    const var_1770555746335_103: String = "NMg/cLcf[c";
    let var_1770555746335_110: Range<UInt64> = ((UInt64(UInt64(13)) & 127)..=(UInt64(UInt64(22)) & 127) : (Int64(118) | 1));
    func func_1770555746335_130(
        optionalParam_1770555746335_131!: Range<Int64> = ((Int64(Int64(-33)) & 127)..=(Int64(Int64(116)) & 127) : (Int64(19) |
            1)),
        optionalParam_1770555746335_133!: Class_1770555746335_8 = Class_1770555746335_8(
            namedParam_1770555746335_136: Enum_1770555746335_36.defaultValue, namedParam_1770555746335_137: UInt64(83))): Range<UInt64> { // block id: 144
        ((UInt64(UInt64(192)) & 127)..=(UInt64(UInt64(20)) & 127) : (Int64(74) | 1))
    };

    try { // block id: 99
        var_1770555746335_93;
        match (var_1770555746335_103) {
            case ",`PSBhbL\"J" | "RcpqbPUiK5" | """
Ow(}&
|X_EX
""" =>
                var_1770555746335_44;
                var_1770555746335_110

            case _ =>
                ();
                var_1770555746335_110

            case _ =>
                ();
                ((UInt64(UInt64(139)) & 127)..=(UInt64(UInt64(175)) & 127) : (Int64(-79) | 1))

            case _ => var_1770555746335_110
        }
    } catch (_) { // block id: 126
        var_1770555746335_110
    } finally { // block id: 128
        func_1770555746335_130(
            optionalParam_1770555746335_133: Class_1770555746335_8(
                namedParam_1770555746335_136: Enum_1770555746335_36.defaultValue,
                namedParam_1770555746335_137: var_1770555746335_149))
    }
}

var _: Future<Unit> = {
    => spawn {
        while (true) {
            sleep(1000 * Duration.second)
            GC()
        }
    }
}()

main(): Int64 {
    Class_1770555746335_8.func_1770555746335_16()
    // CRC Check All Variables
    println(CrcCheck.str)
    return 0
}

class CrcCheck {
    static var str: String = ""
    private static var crcTable = Array<UInt32>(
        256,
        {
            i =>
                var crc = UInt32(i)
                for (_ in 0..8) {
                    crc = (crc >> 1) ^ (if ((crc & 1) != 0) {
                        0xEDB88320u32
                    } else {
                        0u32
                    })
                }
                crc
        }
    )
    static func crc32(value: UInt64) {
        var crc = 0xFFFFFFFFu32
        var buffer = Array<UInt8>(8, {i => UInt8((value >> (7 - i) * 8) & 0xFF)})
        for (b in buffer) {
            var index = Int64((crc & 0xFF) ^ UInt32(b))
            crc = (crc >> 8) ^ crcTable[index]
        }
        str += (!crc).toString()
    }
}

func printMemInfo() {
    println("getMaxHeapSize = ${getMaxHeapSize()}")
    println("getAllocatedHeapSize = ${getAllocatedHeapSize()}")
    println("getUsedHeapSize = ${getUsedHeapSize()}")
    println("getGCCount = ${getGCCount()}")
    println("getGCFreedSize = ${getGCFreedSize()}")
    println("getGCTime = ${getGCTime()}")
}

extend UInt32 {
    operator func ()(x: UInt32): UInt32 {
        return this - x
    }
}

extend Enum_1770555746335_36 {}
