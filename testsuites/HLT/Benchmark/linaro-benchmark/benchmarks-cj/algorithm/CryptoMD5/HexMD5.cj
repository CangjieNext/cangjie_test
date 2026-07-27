/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 %overflow_wrapping %f -o %output
// RUN-EXEC: %export cjHeapSize=16GB && %export JETVMPROP="-Xmx2G" && %run %run_opt %output %run_args

/*
 * Description:       Encrypts a text fragment using the MD5 message-digest
 *                    algorithm, producing a 128-bit hash value.
 * Main Focus:        Bit operations.
 */

import std.process.*
import std.time.*
import std.convert.*
import std.convert.*

class CryptoMD5 {
    private static var TEXT_FRAGMENT: String =
        "Rebellious subjects, enemies to peace,\n" +
        "Profaners of this neighbour-stained steel,--\n" +
        "Will they not hear? What, ho! you men, you beasts,\n" +
        "That quench the fire of your pernicious rage\n" +
        "With purple fountains issuing from your veins,\n" +
        "On pain of torture, from those bloody hands\n" +
        "Throw your mistemper'd weapons to the ground,\n" +
        "And hear the sentence of your moved prince.\n" +
        "Three civil brawls, bred of an airy word,\n" +
        "By thee, old Capulet, and Montague,\n" +
        "Have thrice disturb'd the quiet of our streets,\n" +
        "And made Verona's ancient citizens\n" +
        "Cast by their grave beseeming ornaments,\n" +
        "To wield old partisans, in hands as old,\n" +
        "Canker'd with peace, to part your canker'd hate:\n" +
        "If ever you disturb our streets again,\n" +
        "Your lives shall pay the forfeit of the peace.\n" +
        "For this time, all the rest depart away:\n" +
        "You Capulet; shall go along with me:\n" +
        "And, Montague, come you this afternoon,\n" +
        "To know our further pleasure in this case,\n" +
        "To old Free-town, our common judgment-place.\n" +
        "Once more, on pain of death, all men depart."

    private static var TEXT: String = TEXT_FRAGMENT * 16

    private static var MD5_EXPECTED: String = "a831e91e0f70eddcb70dc61c6f82f6cd"

    // bits per input character. 8 - ASCII 16 - Unicode
    private static var CHRSZ: Int32 = 8
    private static var MASK: Int32 = (1 << CHRSZ) - 1

    // to convert binary values into a hex string digest
    private static var HEX_UPPER_CASE: Bool = false
    private static var HEX_CHARS: Array<Rune> = "0123456789abcdef".toRuneArray()

    /* Bitwise rotate a 32-bit number to the left. */
    @OverflowWrapping
    private func bitRotateLeft(num: Int32, cnt: Int32): Int32 {
        return (num << cnt) | Int32((UInt32(num) >> (32 - cnt)))
    }

    /*
     * Convert a string to an array of little-endian words
     * If CHRSZ is ASCII, characters >255 have their hi-byte silently ignored.
     */
    @OverflowWrapping
    private func str2binl(str: String, padding: Int32): Array<Int32> {
        var len: Int32 = Int32(str.size) / 4
        var paddedLen: Int32 = len
        var rem: Int32 = paddedLen % padding

        if ((padding != 0) && (rem != 0)) {
            paddedLen += padding - rem
        }

        var bin: Array<Int32> = Array<Int32>(Int64(paddedLen), repeat:0)
        for (i in 0..str.size*Int64(CHRSZ): Int64(CHRSZ)) {
            var index = Int64(i >> 5)
            bin[index] |= (Int32(UInt32(str[i / Int64(CHRSZ)])) & MASK) << (i % 32)
        }
        return bin
    }

    /* Default padding of 16 as in the original Javascript implementation. */
    @OverflowWrapping
    private func str2binl(str: String): Array<Int32> {
        return str2binl(str, 16)
    }

    /* Convert an array of little-endian words to a hex string. */
    @OverflowWrapping
    private func binl2hex(bin: Array<Int32>): String {
        var str: String = ""

        for (i in 0..bin.size*4) {
            str = str + HEX_CHARS[Int64(bin[i >> 2] >> ((i % 4) * 8 + 4)) & 0xF].toString()
            str = str + HEX_CHARS[Int64(bin[i >> 2] >> ((i % 4) * 8)) & 0xF].toString()
        }
        return str
    }

    @OverflowWrapping
    private func md5Common(q: Int32, a: Int32, b: Int32, x: Int32, s: Int32, t: Int32): Int32 {
        return bitRotateLeft(a + q + x + t, s) + b
    }

    @OverflowWrapping
    private func md5FF(a: Int32, b: Int32, c: Int32, d: Int32, x: Int32, s: Int32, t: Int32): Int32 {
        return md5Common((b & c) | ((! b) & d), a, b, x, s, t)
    }

    @OverflowWrapping
    private func md5GG(a: Int32, b: Int32, c: Int32, d: Int32, x: Int32, s: Int32, t: Int32): Int32 {
        return md5Common((b & d) | (c & (! d)), a, b, x, s, t)
    }

    @OverflowWrapping
    private func md5HH(a: Int32, b: Int32, c: Int32, d: Int32, x: Int32, s: Int32, t: Int32): Int32 {
        return md5Common(b ^ c ^ d, a, b, x, s, t)
    }

    @OverflowWrapping
    private func md5II(a: Int32, b: Int32, c: Int32, d: Int32, x: Int32, s: Int32, t: Int32): Int32 {
        return md5Common(c ^ (b | (! d)), a, b, x, s, t)
    }

    @OverflowWrapping
    private func getArrElement(index: Int64, x: Array<Int32>): Int32 {
        var op = x.get(Int64(index))
        var res = matchResult<Int32>(op, 0)
        return res
    }

    @OverflowWrapping
    private func coreMD5(x: Array<Int32>, len: Int32): Array<Int32> {
        /* append padding */
        var op = x.get(Int64(len >> 5))
        var res = matchResult<Int32>(op, 0)
        x[Int64(len >> 5)] = res | 0x80 << (len % 32)

        var index = (Int32(UInt32(len + 64) >> 9) << 4) + 14
        x[Int64(index)] = len

        var a: Int32 = 1732584193
        var b: Int32 = -271733879
        var c: Int32 = -1732584194
        var d: Int32 = 271733878

        var i = 0
        while (i < x.size) {
            var olda: Int32 = a
            var oldb: Int32 = b
            var oldc: Int32 = c
            var oldd: Int32 = d

            a = md5FF(a, b, c, d, getArrElement(Int64(i + 0), x), 7, -680876936)
            d = md5FF(d, a, b, c, getArrElement(Int64(i + 1), x), 12, -389564586)
            c = md5FF(c, d, a, b, getArrElement(Int64(i + 2), x), 17,  606105819)
            b = md5FF(b, c, d, a, getArrElement(Int64(i + 3), x), 22, -1044525330)
            a = md5FF(a, b, c, d, getArrElement(Int64(i + 4), x), 7, -176418897)
            d = md5FF(d, a, b, c, getArrElement(Int64(i + 5), x), 12,  1200080426)
            c = md5FF(c, d, a, b, getArrElement(Int64(i + 6), x), 17, -1473231341)
            b = md5FF(b, c, d, a, getArrElement(Int64(i + 7), x), 22, -45705983)
            a = md5FF(a, b, c, d, getArrElement(Int64(i + 8), x), 7,  1770035416)
            d = md5FF(d, a, b, c, getArrElement(Int64(i + 9), x), 12, -1958414417)
            c = md5FF(c, d, a, b, getArrElement(Int64(i + 10), x), 17, -42063)
            b = md5FF(b, c, d, a, getArrElement(Int64(i + 11), x), 22, -1990404162)
            a = md5FF(a, b, c, d, getArrElement(Int64(i + 12), x), 7,  1804603682)
            d = md5FF(d, a, b, c, getArrElement(Int64(i + 13), x), 12, -40341101)
            c = md5FF(c, d, a, b, getArrElement(Int64(i + 14), x), 17, -1502002290)
            b = md5FF(b, c, d, a, getArrElement(Int64(i + 15), x), 22,  1236535329)

            a = md5GG(a, b, c, d, getArrElement(Int64(i + 1), x), 5 , -165796510)
            d = md5GG(d, a, b, c, getArrElement(Int64(i + 6), x), 9 , -1069501632)
            c = md5GG(c, d, a, b, getArrElement(Int64(i + 11), x), 14,  643717713)
            b = md5GG(b, c, d, a, getArrElement(Int64(i + 0), x), 20, -373897302)
            a = md5GG(a, b, c, d, getArrElement(Int64(i + 5), x), 5 , -701558691)
            d = md5GG(d, a, b, c, getArrElement(Int64(i + 10), x), 9 ,  38016083)
            c = md5GG(c, d, a, b, getArrElement(Int64(i + 15), x), 14, -660478335)
            b = md5GG(b, c, d, a, getArrElement(Int64(i + 4), x), 20, -405537848)
            a = md5GG(a, b, c, d, getArrElement(Int64(i + 9), x), 5 ,  568446438)
            d = md5GG(d, a, b, c, getArrElement(Int64(i + 14), x), 9 , -1019803690)
            c = md5GG(c, d, a, b, getArrElement(Int64(i + 3), x), 14, -187363961)
            b = md5GG(b, c, d, a, getArrElement(Int64(i + 8), x), 20,  1163531501)
            a = md5GG(a, b, c, d, getArrElement(Int64(i + 13), x), 5 , -1444681467)
            d = md5GG(d, a, b, c, getArrElement(Int64(i + 2), x), 9 , -51403784)
            c = md5GG(c, d, a, b, getArrElement(Int64(i + 7), x), 14,  1735328473)
            b = md5GG(b, c, d, a, getArrElement(Int64(i + 12), x), 20, -1926607734)

            a = md5HH(a, b, c, d, getArrElement(Int64(i + 5), x), 4 , -378558)
            d = md5HH(d, a, b, c, getArrElement(Int64(i + 8), x), 11, -2022574463)
            c = md5HH(c, d, a, b, getArrElement(Int64(i + 11), x), 16,  1839030562)
            b = md5HH(b, c, d, a, getArrElement(Int64(i + 14), x), 23, -35309556)
            a = md5HH(a, b, c, d, getArrElement(Int64(i + 1), x), 4 , -1530992060)
            d = md5HH(d, a, b, c, getArrElement(Int64(i + 4), x), 11,  1272893353)
            c = md5HH(c, d, a, b, getArrElement(Int64(i + 7), x), 16, -155497632)
            b = md5HH(b, c, d, a, getArrElement(Int64(i + 10), x), 23, -1094730640)
            a = md5HH(a, b, c, d, getArrElement(Int64(i + 13), x), 4 ,  681279174)
            d = md5HH(d, a, b, c, getArrElement(Int64(i + 0), x), 11, -358537222)
            c = md5HH(c, d, a, b, getArrElement(Int64(i + 3), x), 16, -722521979)
            b = md5HH(b, c, d, a, getArrElement(Int64(i + 6), x), 23,  76029189)
            a = md5HH(a, b, c, d, getArrElement(Int64(i + 9), x), 4 , -640364487)
            d = md5HH(d, a, b, c, getArrElement(Int64(i + 12), x), 11, -421815835)
            c = md5HH(c, d, a, b, getArrElement(Int64(i + 15), x), 16,  530742520)
            b = md5HH(b, c, d, a, getArrElement(Int64(i + 2), x), 23, -995338651)

            a = md5II(a, b, c, d, getArrElement(Int64(i + 0), x), 6 , -198630844)
            d = md5II(d, a, b, c, getArrElement(Int64(i + 7), x), 10,  1126891415)
            c = md5II(c, d, a, b, getArrElement(Int64(i + 14), x), 15, -1416354905)
            b = md5II(b, c, d, a, getArrElement(Int64(i + 5), x), 21, -57434055)
            a = md5II(a, b, c, d, getArrElement(Int64(i + 12), x), 6 ,  1700485571)
            d = md5II(d, a, b, c, getArrElement(Int64(i + 3), x), 10, -1894986606)
            c = md5II(c, d, a, b, getArrElement(Int64(i + 10), x), 15, -1051523)
            b = md5II(b, c, d, a, getArrElement(Int64(i + 1), x), 21, -2054922799)
            a = md5II(a, b, c, d, getArrElement(Int64(i + 8), x), 6 ,  1873313359)
            d = md5II(d, a, b, c, getArrElement(Int64(i + 15), x), 10, -30611744)
            c = md5II(c, d, a, b, getArrElement(Int64(i + 6), x), 15, -1560198380)
            b = md5II(b, c, d, a, getArrElement(Int64(i + 13), x), 21,  1309151649)
            a = md5II(a, b, c, d, getArrElement(Int64(i + 4), x), 6 , -145523070)
            d = md5II(d, a, b, c, getArrElement(Int64(i + 11), x), 10, -1120210379)
            c = md5II(c, d, a, b, getArrElement(Int64(i + 2), x), 15,  718787259)
            b = md5II(b, c, d, a, getArrElement(Int64(i + 9), x), 21, -343485551)

            a = a + olda
            b = b + oldb
            c = c + oldc
            d = d + oldd

            i += 16
        }
        return [a, b, c, d]
    }

    @OverflowWrapping
    public func hexMD5(stringData: String): String {
        var bin: Array<Int32> =str2binl(stringData)
        var md5: Array<Int32> = coreMD5(bin, Int32(stringData.size)*CHRSZ)
        var hex: String = binl2hex(md5)
        return hex
    }

    @OverflowWrapping
    public func timeHexMD5(iters: Int32): Unit {
        for (i in 0..iters) {
            hexMD5(TEXT)
        }
    }

    @OverflowWrapping
    public func verify(): Bool {
        var md5Output: String = hexMD5(TEXT)
        return md5Output == MD5_EXPECTED
    }
 }

func matchResult<T>(x: Option<T>, default: T): T {
    var result = match (x) {
        case Some(y) => y
        case None => default
    }
    return result
}

@OverflowWrapping
main(): Int64 {
    var reps: Int32 = 2305

    var args = Process.current.arguments
    if (args.size == 1) {
        var num = Int32.tryParse(args[0])??0

        if (num != 0) {
            reps = num
        }
    }

    var obj: CryptoMD5 = CryptoMD5()
    
    var startTime = DateTime.now()
    obj.timeHexMD5(reps)
    var endTime = DateTime.now()
    var durTime = endTime - startTime
    var perTime: Float64 = Float64(durTime.toNanoseconds())/Float64(reps)

    if (obj.verify() == true) {
        print(perTime.format(".2") + "ns\n")
    } else {
        print("Error!\n")
    }

    return 0
}
