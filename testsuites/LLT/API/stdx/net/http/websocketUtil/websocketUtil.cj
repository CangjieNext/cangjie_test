/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
 * only for LLT tests
 */
package websocketUtil

import stdx.encoding.base64.*

class SHA1 {
    var data: Array<UInt8> = Array<UInt8>(64, {_ => 0})
    var datalen: Int64 = 0
    var bitlen: Int64 = 0
    var state: Array<UInt32> = [0x67452301, 0xEFCDAB89, 0x98BADCFE, 0x10325476, 0xc3d2e1f0]
    var k: Array<UInt32> = [0x5a827999, 0x6ed9eba1, 0x8f1bbcdc, 0xca62c1d6]
    var hash: Array<UInt8> = Array<UInt8>(20, {_ => 0})

    static func digestBytes(buf: Array<UInt8>): Array<UInt8> {
        var sha1 = SHA1()
        sha1.sha1Update(buf, buf.size)
        sha1.sha1Final()
        return sha1.hash
    }

    private func rotLeft(a: UInt32, b: UInt32): UInt32 {
        ((a << b) | (a >> (32 - b)))
    }

    private func sha1Update(other: Array<UInt8>, len: Int64) {
        for (i in 0..len) {
            this.data[this.datalen] = other[i]
            this.datalen = this.datalen + 1
            if (this.datalen == 64) {
                sha1Transform()
                this.bitlen = this.bitlen + 512
                this.datalen = 0
            }
        }
    }

    @OverflowWrapping
    private func sha1Final() {
        var i: Int64 = this.datalen

        if (this.datalen < 56) {
            this.data[i] = UInt8(0b1000_0000)
            i = i + 1
            while (i < 56) {
                this.data[i] = 0x00
                i = i + 1
            }
        } else {
            this.data[i] = UInt8(0b1000_0000)
            i = i + 1
            while (i < 64) {
                this.data[i] = UInt8(0x00)
                i = i + 1
            }
            sha1Transform()
            for (j in 0..56) {
                this.data[j] = 0
            }
        }

        this.bitlen = this.bitlen + (this.datalen * 8)
        this.data[63] = UInt8(this.bitlen)
        this.data[62] = UInt8(this.bitlen >> 8)
        this.data[61] = UInt8(this.bitlen >> 16)
        this.data[60] = UInt8(this.bitlen >> 24)
        this.data[59] = UInt8(this.bitlen >> 32)
        this.data[58] = UInt8(this.bitlen >> 40)
        this.data[57] = UInt8(this.bitlen >> 48)
        this.data[56] = UInt8(this.bitlen >> 56)
        sha1Transform()

        for (j in 0..4) {
            hash[j] = UInt8((this.state[0] >> (24 - j * 8)) & 0x000000ff)
            hash[j + 4] = UInt8((this.state[1] >> (24 - j * 8)) & 0x000000ff)
            hash[j + 8] = UInt8((this.state[2] >> (24 - j * 8)) & 0x000000ff)
            hash[j + 12] = UInt8((this.state[3] >> (24 - j * 8)) & 0x000000ff)
            hash[j + 16] = UInt8((this.state[4] >> (24 - j * 8)) & 0x000000ff)
        }
    }

    @OverflowWrapping
    private func sha1Transform() {
        var j: Int64 = 0

        var m: Array<UInt32> = Array<UInt32>(80, {_ => 0})
        for (i in 0..16) {
            m[i] = (UInt32(this.data[j]) << 24) + (UInt32(this.data[j + 1]) << 16) + (UInt32(this.data[j + 2]) << 8) +
                UInt32(this.data[j + 3])
            j = j + 4
        }
        for (i in 16..80) {
            m[i] = (m[i - 3] ^ m[i - 8] ^ m[i - 14] ^ m[i - 16])
            m[i] = (m[i] << 1) | (m[i] >> 31)
        }

        var a: UInt32 = this.state[0]
        var b: UInt32 = this.state[1]
        var c: UInt32 = this.state[2]
        var d: UInt32 = this.state[3]
        var e: UInt32 = this.state[4]
        var t: UInt32 = 0

        for (i in 0..20) {
            t = UInt32((rotLeft(a, 5)) + ((b & c) ^ ((!b) & d)) + (e) + (this.k[0]) + (m[i]))
            e = d
            d = c
            c = rotLeft(b, 30)
            b = a
            a = t
        }
        for (i in 20..40) {
            t = UInt32((rotLeft(a, 5)) + (b ^ c ^ d) + (e) + (this.k[1]) + (m[i]))
            e = d
            d = c
            c = rotLeft(b, 30)
            b = a
            a = t
        }
        for (i in 40..60) {
            t = UInt32((rotLeft(a, 5)) + ((b & c) ^ (b & d) ^ (c & d)) + (e) + (this.k[2]) + (m[i]))
            e = d
            d = c
            c = rotLeft(b, 30)
            b = a
            a = t
        }
        for (i in 60..80) {
            t = UInt32((rotLeft(a, 5)) + (b ^ c ^ d) + (e) + (this.k[3]) + (m[i]))
            e = d
            d = c
            c = rotLeft(b, 30)
            b = a
            a = t
        }

        this.state[0] = this.state[0] + a
        this.state[1] = this.state[1] + b
        this.state[2] = this.state[2] + c
        this.state[3] = this.state[3] + d
        this.state[4] = this.state[4] + e
    }
}

public func generateAcceptValue(key: String): String {
    let hashBytes = SHA1.digestBytes((key + "258EAFA5-E914-47DA-95CA-C5AB0DC85B11").toArray())
    return toBase64String(hashBytes)
}

public func maskAndUnmask(maskingKey: Array<UInt8>, bytes: Array<UInt8>): Array<UInt8> {
    let masked = Array<UInt8>(bytes.size, repeat: 0)
    for (i in 0..bytes.size) {
        masked[i] = bytes[i] ^ maskingKey[i % 4]
    }
    return masked
}
