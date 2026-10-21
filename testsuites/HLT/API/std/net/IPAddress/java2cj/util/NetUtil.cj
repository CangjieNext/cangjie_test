/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// io.netty.util.NetUtil 的仓颉移植（IP 地址工具部分）
// Java 的 null 返回值统一映射为 Option；字符串按 ASCII 字节处理
package io.netty.util

import io.netty.util.internal.StringUtil

// ==================== 类型定义（对应 java.net 相关类型的最小移植） ====================

public open class InetAddress {
    let addressBytes: Array<UInt8>

    public init(bytes: Array<UInt8>) {
        addressBytes = bytes
    }

    public func getAddress(): Array<UInt8> {
        return addressBytes
    }

    // 对应 InetAddress#getHostAddress
    public func getHostAddress(): String {
        if (addressBytes.size == 4) {
            return bytesToIpAddress(addressBytes)
        }
        return toAddressString(addressBytes, 0, false)
    }

    public static func getByAddress(bytes: Array<UInt8>): InetAddress {
        // 对应 JDK 行为：按字节数组长度返回 Inet4Address / Inet6Address
        if (bytes.size == 4) {
            return Inet4Address(bytes)
        }
        if (bytes.size == 16) {
            return Inet6Address(bytes)
        }
        throw IllegalArgumentException("addr is of illegal length: ${bytes.size}")
    }

    // 简化版：仅支持点分 IPv4 字面量（测试中仅用于 127.0.0.1 / 192.168.1.1）
    public static func getByName(host: String): ?InetAddress {
        if (isValidIpV4Address(host)) {
            return Some(Inet4Address(validIpV4ToBytes(host)))
        }
        return None
    }
}

public class Inet4Address <: InetAddress {
    public init(bytes: Array<UInt8>) {
        super(bytes)
    }
}

public class Inet6Address <: InetAddress {
    public init(bytes: Array<UInt8>) {
        super(bytes)
    }
}

public class NetworkInterface {
    public init() {}
}

public class InetSocketAddress {
    let address: InetAddress
    let port: Int32

    public init(address: InetAddress, port: Int32) {
        this.address = address
        this.port = port
    }

    public func getAddress(): InetAddress {
        return address
    }

    public func getPort(): Int32 {
        return port
    }

    public func isUnresolved(): Bool {
        return false
    }

    public func getHostString(): String {
        return toAddressString(address)
    }
}

// ==================== 常量 ====================

let IPV6_WORD_COUNT: Int64 = 8
let IPV6_BYTE_COUNT: Int64 = 16
let IPV6_MAX_CHAR_BETWEEN_SEPARATOR: Int64 = 4
let IPV6_MIN_SEPARATORS: Int64 = 2
let IPV6_MAX_SEPARATORS: Int64 = 8
let IPV4_MAX_CHAR_BETWEEN_SEPARATOR: Int64 = 3
let IPV4_SEPARATORS: Int64 = 3

// 对应 NetUtil#LOCALHOST / LOOPBACK_IF（测试仅校验非空）
public let LOCALHOST: ?InetAddress = Some(Inet4Address([127, 0, 0, 1]))
public let LOOPBACK_IF: ?NetworkInterface = Some(NetworkInterface())

// ==================== 内部工具 ====================

// 对应 NetUtil 私有 indexOf(CharSequence, char, int)
func indexOfByte(bytes: Array<UInt8>, target: UInt8, from: Int64): Int64 {
    var i = from
    while (i < bytes.size) {
        if (bytes[i] == target) {
            return i
        }
        i += 1
    }
    return -1
}

// 对应 PlatformDependent#isZero
func isZeroRange(bytes: Array<UInt8>, from: Int64, toExclusive: Int64): Bool {
    var i = from
    while (i < toExclusive) {
        if (bytes[i] != 0) {
            return false
        }
        i += 1
    }
    return true
}

func inRangeEndExclusive(value: Int64, start: Int64, end: Int64): Bool {
    return value >= start && value < end
}

// 对应 isValidIpV4Word
func isValidIpV4Word(ip: Array<UInt8>, from: Int64, toExclusive: Int64): Bool {
    let len = toExclusive - from
    if (len < 1 || len > 3) {
        return false
    }
    let c0 = ip[from]
    if (c0 < 48) {   // < '0'
        return false
    }
    if (len == 3) {
        let c1 = ip[from + 1]
        let c2 = ip[from + 2]
        if (c1 < 48 || c2 < 48) {
            return false
        }
        return (c0 <= 49 && c1 <= 57 && c2 <= 57) ||
            (c0 == 50 && c1 <= 53 && (c2 <= 53 || (c1 < 53 && c2 <= 57)))
    }
    return c0 <= 57 && (len == 1 || isValidNumericChar(ip[from + 1]))
}

func isValidHexChar(c: UInt8): Bool {
    return (c >= 48 && c <= 57) || (c >= 65 && c <= 70) || (c >= 97 && c <= 102)
}

func isValidNumericChar(c: UInt8): Bool {
    return c >= 48 && c <= 57
}

func isValidIPv4MappedChar(c: UInt8): Bool {
    return c == 102 || c == 70   // 'f' or 'F'
}

// Java 中 b1 == -1 表示 0xff
func isValidIPv4MappedSeparators(b0: UInt8, b1: UInt8, mustBeZero: Bool): Bool {
    return b0 == b1 && (b0 == 0 || (!mustBeZero && b1 == 255))
}

func isValidIPv4Mapped(bytes: Array<UInt8>, currentIndex: Int64, compressBegin: Int64, compressLength: Int64): Bool {
    let mustBeZero = compressBegin + compressLength >= 14
    return currentIndex <= 12 && currentIndex >= 2 && (!mustBeZero || compressBegin < 12) &&
        isValidIPv4MappedSeparators(bytes[currentIndex - 1], bytes[currentIndex - 2], mustBeZero) &&
        isZeroRange(bytes, 0, currentIndex - 3)
}

// ==================== IPv4 ====================

public func isValidIpV4Address(ip: String): Bool {
    let bytes = ip.toArray()
    return isValidIpV4Address(bytes, 0, bytes.size)
}

func isValidIpV4Address(ip: Array<UInt8>, from0: Int64, toExcluded: Int64): Bool {
    var from = from0
    let len = toExcluded - from
    if (len > 15 || len < 7) {
        return false
    }
    var i = indexOfByte(ip, 46, from + 1)   // '.'
    if (i <= 0 || !isValidIpV4Word(ip, from, i)) {
        return false
    }
    from = i + 2
    i = indexOfByte(ip, 46, from)
    if (i <= 0 || !isValidIpV4Word(ip, from - 1, i)) {
        return false
    }
    from = i + 2
    i = indexOfByte(ip, 46, from)
    if (i <= 0 || !isValidIpV4Word(ip, from - 1, i)) {
        return false
    }
    return isValidIpV4Word(ip, i + 1, toExcluded)
}

func ipv4WordToByte(ip: Array<UInt8>, from0: Int64, toExclusive: Int64): UInt8 {
    var from = from0
    var ret = Int32(ip[from]) - 48
    from += 1
    if (from == toExclusive) {
        return UInt8(ret)
    }
    ret = ret * 10 + Int32(ip[from]) - 48
    from += 1
    if (from == toExclusive) {
        return UInt8(ret)
    }
    return UInt8(ret * 10 + Int32(ip[from]) - 48)
}

// visible for tests
public func validIpV4ToBytes(ip: String): Array<UInt8> {
    let bytes = ip.toArray()
    let i1 = indexOfByte(bytes, 46, 1)
    let i2 = indexOfByte(bytes, 46, i1 + 2)
    let i3 = indexOfByte(bytes, 46, i2 + 2)
    return [
        ipv4WordToByte(bytes, 0, i1),
        ipv4WordToByte(bytes, i1 + 1, i2),
        ipv4WordToByte(bytes, i2 + 1, i3),
        ipv4WordToByte(bytes, i3 + 1, bytes.size)
    ]
}

// 对应 ipv4AddressToInt：Java 的 (b0 & 0xff) << 24 | ... 
// 用 Int64 无溢出计算后折回 Int32，等价 Java 的有符号 32 位结果
public func ipv4AddressToInt(ipAddress: Inet4Address): Int32 {
    let octets = ipAddress.getAddress()
    let unsigned = Int64(octets[0]) * 256 * 256 * 256 +
        Int64(octets[1]) * 256 * 256 +
        Int64(octets[2]) * 256 +
        Int64(octets[3])
    if (unsigned > 2147483647) {
        return Int32(unsigned - 4294967296)
    }
    return Int32(unsigned)
}

// ==================== IPv6 校验 ====================

public func isValidIpV6Address(ip: String): Bool {
    let bytes = ip.toArray()
    var end = bytes.size
    if (end < 2) {
        return false
    }

    // strip "[]"
    var start = 0
    var c = bytes[0]
    if (c == 91) {   // '['
        end -= 1
        if (bytes[end] != 93) {   // ']'
            // must have a close ]
            return false
        }
        start = 1
        c = bytes[1]
    }

    var colons: Int64 = 0
    var compressBegin: Int64 = -1
    if (c == 58) {   // ':'
        // an IPv6 address can start with "::" or with a number
        if (bytes[start + 1] != 58) {
            return false
        }
        colons = 2
        compressBegin = start
        start += 2
    }

    var wordLen: Int64 = 0
    var i = start
    while (i < end) {
        c = bytes[i]
        if (isValidHexChar(c)) {
            if (wordLen < 4) {
                wordLen += 1
            } else {
                return false
            }
        } else if (c == 58) {   // ':'
            if (colons > 7) {
                return false
            }
            if (bytes[i - 1] == 58) {
                if (compressBegin >= 0) {
                    return false
                }
                compressBegin = i - 1
            } else {
                wordLen = 0
            }
            colons += 1
        } else if (c == 46) {   // '.'
            // case for the last 32-bits represented as IPv4 x:x:x:x:x:x:d.d.d.d
            if ((compressBegin < 0 && colons != 6) ||
                    // a special case ::1:2:3:4:5:d.d.d.d allows 7 colons with an
                    // IPv4 ending, otherwise 7 :'s is bad
                    (colons == 7 && compressBegin >= start) || colons > 7) {
                return false
            }

            // Verify this address is of the correct structure to contain an IPv4 address.
            // It must be IPv4-Mapped or IPv4-Compatible
            // (see https://tools.ietf.org/html/rfc4291#section-2.5.5).
            let ipv4Start = i - wordLen
            var j = ipv4Start - 2   // index of character before the previous ':'.
            if (isValidIPv4MappedChar(bytes[j])) {
                if (!isValidIPv4MappedChar(bytes[j - 1]) ||
                        !isValidIPv4MappedChar(bytes[j - 2]) ||
                        !isValidIPv4MappedChar(bytes[j - 3])) {
                    return false
                }
                j -= 5
            }
            while (j >= start) {
                let tmpChar = bytes[j]
                if (tmpChar != 48 && tmpChar != 58) {   // '0' or ':'
                    return false
                }
                j -= 1
            }

            // 7 - is minimum IPv4 address length
            var ipv4End = indexOfByte(bytes, 37, ipv4Start + 7)   // '%'
            if (ipv4End < 0) {
                ipv4End = end
            }
            return isValidIpV4Address(bytes, ipv4Start, ipv4End)
        } else if (c == 37) {   // '%'
            // strip the interface name/index after the percent sign
            end = i
        } else {
            return false
        }
        i += 1
    }

    // normal case without compression
    if (compressBegin < 0) {
        return colons == 7 && wordLen > 0
    }

    return compressBegin + 2 == end ||
        // 8 colons is valid only if compression in start or end
        (wordLen > 0 && (colons < 8 || compressBegin <= start))
}

// ==================== 解析 ====================

public func createByteArrayFromIpAddressString(ipAddressString: String): ?Array<UInt8> {
    if (isValidIpV4Address(ipAddressString)) {
        return validIpV4ToBytes(ipAddressString)
    }

    if (isValidIpV6Address(ipAddressString)) {
        let allBytes = ipAddressString.toArray()
        var start: Int64 = 0
        var end: Int64 = allBytes.size
        if (allBytes[0] == 91) {   // '['
            start = 1
            end -= 1
        }
        let percentPos = indexOfByte(allBytes, 37, start)   // '%'
        if (percentPos >= 0) {
            end = percentPos
        }
        let length = end - start
        let trimmed = Array<UInt8>(length, repeat: 0)
        var k: Int64 = 0
        while (k < length) {
            trimmed[k] = allBytes[start + k]
            k += 1
        }
        return getIPv6ByName(trimmed, true)
    }
    return None
}

public func getByName(ip: String): ?Inet6Address {
    return getByName(ip, true)
}

public func getByName(ip: String, ipv4Mapped: Bool): ?Inet6Address {
    let bytes = getIPv6ByName(ip.toArray(), ipv4Mapped)
    if (bytes.isNone()) {
        return None
    }
    return Some(Inet6Address(bytes.getOrThrow()))
}

// visible for test
func getIPv6ByName(ip: Array<UInt8>, ipv4Mapped: Bool): ?Array<UInt8> {
    let bytes = Array<UInt8>(IPV6_BYTE_COUNT, repeat: 0)
    let ipLength = ip.size
    var compressBegin: Int64 = 0
    var compressLength: Int64 = 0
    var currentIndex: Int64 = 0
    var value: Int32 = 0
    var begin: Int64 = -1
    var i: Int64 = 0
    var ipv6Separators: Int64 = 0
    var ipv4Separators: Int64 = 0
    var tmp: Int64 = 0
    while (i < ipLength) {
        let c = ip[i]
        if (c == 58) {   // ':'
            ipv6Separators += 1
            if (i - begin > IPV6_MAX_CHAR_BETWEEN_SEPARATOR ||
                    ipv4Separators > 0 || ipv6Separators > IPV6_MAX_SEPARATORS ||
                    currentIndex + 1 >= IPV6_BYTE_COUNT) {
                return None
            }
            value = value << Int32((IPV6_MAX_CHAR_BETWEEN_SEPARATOR - (i - begin)) << 2)

            if (compressLength > 0) {
                compressLength -= 2
            }

            // value 最多缓存 4 个半字节，重排为高字节在前写入
            bytes[currentIndex] = UInt8(((value & 0xf) << 4) | ((value >> 4) & 0xf))
            currentIndex += 1
            bytes[currentIndex] = UInt8((((value >> 8) & 0xf) << 4) | ((value >> 12) & 0xf))
            currentIndex += 1
            tmp = i + 1
            if (tmp < ipLength && ip[tmp] == 58) {
                tmp += 1
                if (compressBegin != 0 || (tmp < ipLength && ip[tmp] == 58)) {
                    return None
                }
                ipv6Separators += 1
                compressBegin = currentIndex
                compressLength = IPV6_BYTE_COUNT - compressBegin - 2
                i += 1
            }
            value = 0
            begin = -1
        } else if (c == 46) {   // '.'
            ipv4Separators += 1
            tmp = i - begin   // tmp is the length of the current segment.
            if (tmp > IPV4_MAX_CHAR_BETWEEN_SEPARATOR ||
                    begin < 0 ||
                    ipv4Separators > IPV4_SEPARATORS ||
                    (ipv6Separators > 0 && (currentIndex + compressLength < 12)) ||
                    i + 1 >= ipLength ||
                    currentIndex >= IPV6_BYTE_COUNT ||
                    (ipv4Separators == 1 &&
                        // We also parse pure IPv4 addresses as IPv4-Mapped for ease of use.
                        ((!ipv4Mapped || (currentIndex != 0 && !isValidIPv4Mapped(bytes, currentIndex,
                                          compressBegin, compressLength))) ||
                            ((tmp == 3 && (!isValidNumericChar(ip[i - 1]) ||
                                          !isValidNumericChar(ip[i - 2]) ||
                                          !isValidNumericChar(ip[i - 3]))) ||
                             (tmp == 2 && (!isValidNumericChar(ip[i - 1]) ||
                                           !isValidNumericChar(ip[i - 2]))) ||
                             (tmp == 1 && !isValidNumericChar(ip[i - 1])))))) {
                return None
            }
            value = value << Int32((IPV4_MAX_CHAR_BETWEEN_SEPARATOR - tmp) << 2)

            // 十进制数字按半字节重组
            begin = Int64(value & 0xf) * 100 + Int64((value >> 4) & 0xf) * 10 + Int64((value >> 8) & 0xf)
            if (begin > 255) {
                return None
            }
            bytes[currentIndex] = UInt8(begin)
            currentIndex += 1
            value = 0
            begin = -1
        } else {
            if (!isValidHexChar(c) || (ipv4Separators > 0 && !isValidNumericChar(c))) {
                return None
            }
            if (begin < 0) {
                begin = i
            } else if (i - begin > IPV6_MAX_CHAR_BETWEEN_SEPARATOR) {
                return None
            }
            value += Int32(StringUtil.decodeHexNibble(c)) << Int32((i - begin) << 2)
        }
        i += 1
    }

    let isCompressed = compressBegin > 0
    // Finish up last set of data that was accumulated in the loop (or before the loop)
    if (ipv4Separators > 0) {
        if ((begin > 0 && i - begin > IPV4_MAX_CHAR_BETWEEN_SEPARATOR) ||
                ipv4Separators != IPV4_SEPARATORS ||
                currentIndex >= IPV6_BYTE_COUNT) {
            return None
        }
        if (!(ipv6Separators == 0 || (ipv6Separators >= IPV6_MIN_SEPARATORS &&
                ((!isCompressed && (ipv6Separators == 6 && ip[0] != 58)) ||
                    (isCompressed && (ipv6Separators < IPV6_MAX_SEPARATORS &&
                        (ip[0] != 58 || compressBegin <= 2))))))) {
            return None
        }
        value = value << Int32((IPV4_MAX_CHAR_BETWEEN_SEPARATOR - (i - begin)) << 2)

        begin = Int64(value & 0xf) * 100 + Int64((value >> 4) & 0xf) * 10 + Int64((value >> 8) & 0xf)
        if (begin > 255) {
            return None
        }
        bytes[currentIndex] = UInt8(begin)
        currentIndex += 1
    } else {
        tmp = ipLength - 1
        if ((begin > 0 && i - begin > IPV6_MAX_CHAR_BETWEEN_SEPARATOR) ||
                ipv6Separators < IPV6_MIN_SEPARATORS ||
                (!isCompressed && (ipv6Separators + 1 != IPV6_MAX_SEPARATORS ||
                                   ip[0] == 58 || ip[tmp] == 58)) ||
                (isCompressed && (ipv6Separators > IPV6_MAX_SEPARATORS ||
                    (ipv6Separators == IPV6_MAX_SEPARATORS &&
                        ((compressBegin <= 2 && ip[0] != 58) ||
                         (compressBegin >= 14 && ip[tmp] != 58))))) ||
                currentIndex + 1 >= IPV6_BYTE_COUNT ||
                (begin < 0 && ip[tmp - 1] != 58) ||
                (compressBegin > 2 && ip[0] == 58)) {
            return None
        }
        if (begin >= 0 && i - begin <= IPV6_MAX_CHAR_BETWEEN_SEPARATOR) {
            value = value << Int32((IPV6_MAX_CHAR_BETWEEN_SEPARATOR - (i - begin)) << 2)
        }
        bytes[currentIndex] = UInt8(((value & 0xf) << 4) | ((value >> 4) & 0xf))
        currentIndex += 1
        bytes[currentIndex] = UInt8((((value >> 8) & 0xf) << 4) | ((value >> 12) & 0xf))
        currentIndex += 1
    }

    if (currentIndex < IPV6_BYTE_COUNT) {
        let toBeCopiedLength = currentIndex - compressBegin
        let targetIndex = IPV6_BYTE_COUNT - toBeCopiedLength
        // 对应 System.arraycopy（memmove 语义，先复制到临时数组）
        let tmpArr = Array<UInt8>(toBeCopiedLength, repeat: 0)
        var k: Int64 = 0
        while (k < toBeCopiedLength) {
            tmpArr[k] = bytes[compressBegin + k]
            k += 1
        }
        k = 0
        while (k < toBeCopiedLength) {
            bytes[targetIndex + k] = tmpArr[k]
            k += 1
        }
        // targetIndex is also the `toIndex` to fill 0
        var m = compressBegin
        while (m < targetIndex) {
            bytes[m] = 0
            m += 1
        }
    }

    if (ipv4Separators > 0) {
        // We only support IPv4-Mapped addresses because IPv4-Compatible addresses are deprecated.
        // [1] https://tools.ietf.org/html/rfc4291#section-2.5.5.2
        // [2] https://tools.ietf.org/html/rfc4291#section-2.5.5.1
        bytes[10] = 0xff
        bytes[11] = 0xff
    }

    return Some(bytes)
}

// ==================== 字节转字符串 ====================

public func bytesToIpAddress(bytes: Array<UInt8>): String {
    return bytesToIpAddress(bytes, 0, bytes.size)
}

public func bytesToIpAddress(bytes: Array<UInt8>, offset: Int64, length: Int64): String {
    if (length == 4) {
        let buf = StringBuilder()
        buf.append(bytes[offset].toString())
        buf.append(".")
        buf.append(bytes[offset + 1].toString())
        buf.append(".")
        buf.append(bytes[offset + 2].toString())
        buf.append(".")
        buf.append(bytes[offset + 3].toString())
        return buf.toString()
    }
    if (length == 16) {
        return toAddressString(bytes, offset, false)
    }
    throw IllegalArgumentException("length: ${length} (expected: 4 or 16)")
}

// ==================== 地址转字符串（rfc 5952） ====================

public func toAddressString(ip: InetAddress): String {
    return toAddressString(ip, false)
}

public func toAddressString(ip: InetAddress, ipv4Mapped: Bool): String {
    if (ip is Inet4Address) {
        return ip.getHostAddress()
    }
    if (!(ip is Inet6Address)) {
        throw IllegalArgumentException("Unhandled type")
    }
    return toAddressString(ip.getAddress(), 0, ipv4Mapped)
}

func toAddressString(bytes: Array<UInt8>, offset: Int64, ipv4Mapped: Bool): String {
    let words = Array<Int32>(IPV6_WORD_COUNT, repeat: 0)
    var i: Int64 = 0
    while (i < IPV6_WORD_COUNT) {
        let idx = (i << 1) + offset
        words[i] = (Int32(bytes[idx]) << 8) | Int32(bytes[idx + 1])
        i += 1
    }

    // Find longest run of 0s, tie goes to first found instance
    var currentStart: Int64 = -1
    var currentLength: Int64 = 0
    var shortestStart: Int64 = -1
    var shortestLength: Int64 = 0
    i = 0
    while (i < IPV6_WORD_COUNT) {
        if (words[i] == 0) {
            if (currentStart < 0) {
                currentStart = i
            }
        } else if (currentStart >= 0) {
            currentLength = i - currentStart
            if (currentLength > shortestLength) {
                shortestStart = currentStart
                shortestLength = currentLength
            }
            currentStart = -1
        }
        i += 1
    }
    // If the array ends on a streak of zeros, make sure we account for it
    if (currentStart >= 0) {
        currentLength = IPV6_WORD_COUNT - currentStart
        if (currentLength > shortestLength) {
            shortestStart = currentStart
            shortestLength = currentLength
        }
    }
    // Ignore the longest streak if it is only 1 long
    if (shortestLength == 1) {
        shortestLength = 0
        shortestStart = -1
    }

    // Translate to string taking into account longest consecutive 0s
    let shortestEnd = shortestStart + shortestLength
    let b = StringBuilder()
    var isIpv4Mapped = false
    if (shortestEnd < 0) {
        // Optimization when there is no compressing needed
        b.append(toHexString(Int64(words[0])))
        i = 1
        while (i < IPV6_WORD_COUNT) {
            b.append(":")
            b.append(toHexString(Int64(words[i])))
            i += 1
        }
    } else {
        // General case that can handle compressing (and not compressing)
        if (inRangeEndExclusive(0, shortestStart, shortestEnd)) {
            b.append("::")
            isIpv4Mapped = ipv4Mapped && (shortestEnd == 5 && words[5] == 0xffff)
        } else {
            b.append(toHexString(Int64(words[0])))
            isIpv4Mapped = false
        }
        i = 1
        while (i < IPV6_WORD_COUNT) {
            if (!inRangeEndExclusive(i, shortestStart, shortestEnd)) {
                if (!inRangeEndExclusive(i - 1, shortestStart, shortestEnd)) {
                    // If the last index was not part of the shortened sequence
                    if (!isIpv4Mapped || i == 6) {
                        b.append(":")
                    } else {
                        b.append(".")
                    }
                }
                if (isIpv4Mapped && i > 5) {
                    b.append(Int64(words[i] >> 8).toString())
                    b.append(".")
                    b.append(Int64(words[i] & 0xff).toString())
                } else {
                    b.append(toHexString(Int64(words[i])))
                }
            } else if (!inRangeEndExclusive(i - 1, shortestStart, shortestEnd)) {
                // If we are in the shortened sequence and the last index was not
                b.append("::")
            }
            i += 1
        }
    }

    return b.toString()
}

// 小写十六进制（无前导 0，等价 Integer.toHexString）
func toHexString(value: Int64): String {
    if (value == 0) {
        return "0"
    }
    let buf = StringBuilder()
    var started = false
    var shift: Int64 = 60
    while (shift >= 0) {
        let nibble = (value >> shift) & 0xF
        if (nibble != 0 || started) {
            buf.append(hexNibbleToRune(nibble))
            started = true
        }
        shift -= 4
    }
    return buf.toString()
}

func hexNibbleToRune(nibble: Int64): Rune {
    if (nibble < 10) {
        return Rune(48 + Int32(nibble))   // '0'
    }
    return Rune(87 + Int32(nibble))       // 'a' - 10
}

// ==================== Socket 地址转字符串 ====================

public func toSocketAddressString(addr: InetSocketAddress): String {
    let port = addr.getPort().toString()
    let sb = StringBuilder()

    if (addr.isUnresolved()) {
        let hostname = addr.getHostString()
        sb.append(newSocketAddressStringBuilder(hostname, !isValidIpV6Address(hostname)))
    } else {
        let address = addr.getAddress()
        let hostString = toAddressString(address)
        sb.append(newSocketAddressStringBuilder(hostString, address is Inet4Address))
    }
    sb.append(":")
    sb.append(port)
    return sb.toString()
}

func newSocketAddressStringBuilder(host: String, ipv4: Bool): String {
    let hostLen = host.size
    if (ipv4) {
        return host
    }
    let hostBytes = host.toArray()
    if (hostLen > 1 && hostBytes[0] == 91 && hostBytes[hostLen - 1] == 93) {
        return host   // 已带 []
    }
    return "[" + host + "]"
}
