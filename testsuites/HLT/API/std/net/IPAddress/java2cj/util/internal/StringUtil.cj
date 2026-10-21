/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// io.netty.util.internal.StringUtil 的仓颉移植（仅移植 IP 工具所需的方法）
package io.netty.util.internal

public class StringUtil {

    // 对应 BYTE2HEX_NOPAD 查表：小于 0x10 的值输出 1 位十六进制（不补零），小写
    public static func byteToHexString(value: UInt8): String {
        let buf = StringBuilder()
        let high = value >> 4
        if (high > 0) {
            buf.append(hexDigitToRune(high))
        }
        buf.append(hexDigitToRune(value & 0x0F))
        return buf.toString()
    }

    // 对应 HEX2B 查表：返回 0~15，非法字符返回 -1
    public static func decodeHexNibble(b: UInt8): Int32 {
        if (b >= 48 && b <= 57) {          // '0'..'9'
            return Int32(b - 48)
        }
        if (b >= 65 && b <= 70) {          // 'A'..'F'
            return Int32(b - 65) + 10
        }
        if (b >= 97 && b <= 102) {         // 'a'..'f'
            return Int32(b - 97) + 10
        }
        return -1
    }

    // 对应 decodeHexDump(CharSequence, int, int)
    private static func decodeHexDump(hexDump: Array<UInt8>, fromIndex: Int64, length: Int64): Array<UInt8> {
        if (length < 0 || (length & 1) != 0) {
            throw IllegalArgumentException("length: ${length}")
        }
        let bytes = Array<UInt8>(length >> 1, repeat: 0)
        var i: Int64 = 0
        while (i < length) {
            bytes[i >> 1] = decodeHexByte(hexDump, fromIndex + i)
            i += 2
        }
        return bytes
    }

    // 对应 decodeHexByte：两位十六进制转一个字节
    private static func decodeHexByte(s: Array<UInt8>, pos: Int64): UInt8 {
        let hi = decodeHexNibble(s[pos])
        let lo = decodeHexNibble(s[pos + 1])
        if (hi == -1 || lo == -1) {
            throw IllegalArgumentException("invalid hex byte at index ${pos}")
        }
        return UInt8((hi << 4) + lo)
    }

    // 对应 decodeHexDump(CharSequence)
    public static func decodeHexDump(hexDump: String): Array<UInt8> {
        let bytes = hexDump.toArray()
        return decodeHexDump(bytes, 0, bytes.size)
    }

    private static func hexDigitToRune(v: UInt8): Rune {
        if (v < 10) {
            return Rune(48 + Int32(v))     // '0'
        }
        return Rune(87 + Int32(v))         // 'a' - 10
    }
}
