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
 * Description:       Encrypts a text fragment using the SHA1 Secure Hash
 *                    Algorithm, producing a 160-bit hash value.
 * Main Focus:        Bit operations.
 */

import std.process.*
import std.time.*
import std.convert.*
import std.convert.*

class CryptoSHA1 {
    private static var TEXT_FRAGMENT: String =
        "Two households, both alike in dignity,\n" +
        "In fair Verona, where we lay our scene,\n" +
        "From ancient grudge break to new mutiny,\n" +
        "Where civil blood makes civil hands unclean.\n" +
        "From forth the fatal loins of these two foes\n" +
        "A pair of star-cross'd lovers take their life;\n" +
        "Whole misadventured piteous overthrows\n" +
        "Do with their death bury their parents' strife.\n" +
        "The fearful passage of their death-mark'd love,\n" +
        "And the continuance of their parents' rage,\n" +
        "Which, but their children's end, nought could remove,\n" +
        "Is now the two hours' traffic of our stage;\n" +
        "The which if you with patient ears attend,\n" +
        "What here shall miss, our toil shall strive to mend."

    private static var TEXT: String = TEXT_FRAGMENT * 16

    private static var SHA1_EXPECTED: String = "2524d264def74cce2498bf112bedf00e6c0b796d"

    // bits per input character. 8 - ASCII 16 - Unicode
    private static var CHRSZ: Int32 = 8
    private static var MASK: Int32 = (1 << CHRSZ) - 1

    // to convert binary values into a hex string digest
    private static var HEX_UPPER_CASE: Bool = false
    private static var HEX_CHARS: Array<Rune> = "0123456789abcdef".toRuneArray()

    /*
     * Convert a string to an array of little-endian words
     * If CHRSZ is ASCII, characters >255 have their hi-byte silently ignored.
     */
     @OverflowWrapping
    private func str2binb(str: String, padding: Int32): Array<Int32> {
        var len: Int32 = Int32(str.size) / 4
        var paddedLen: Int32 = len
        var rem: Int32 = paddedLen % padding

        if ((padding != 0) && (rem != 0)) {
            paddedLen += padding - rem
        }

        var bin: Array<Int32> = Array<Int32>(Int64(paddedLen), repeat:0)

        for (i in 0..str.size*Int64(CHRSZ): Int64(CHRSZ)) {
            var index = Int64(i >> 5)
            bin[index] |= (Int32(UInt32(str[i / Int64(CHRSZ)])) & MASK) << (32 - Int64(CHRSZ) - i % 32)
        }
        return bin
    }

    /* Default padding of 16 as in the original Javascript implementation. */
    @OverflowWrapping
    private func str2binb(str: String): Array<Int32> {
        return str2binb(str, 16)
    }

    /* Convert an array of little-endian words to a hex string. */
    @OverflowWrapping
    private func binb2hex(bin: Array<Int32>): String {
        var str: String = ""

        for (i in 0..bin.size*4) {
            str = str + HEX_CHARS[Int64(bin[i >> 2] >> ((3 - i % 4) * 8 + 4)) & 0xF].toString()
            str = str + HEX_CHARS[Int64(bin[i >> 2] >> ((3 - i % 4) * 8)) & 0xF].toString()
        }
        return str
    }

    /* Bitwise rotate a 32-bit number to the left. */
    @OverflowWrapping
    private func bitRotateLeft(num: Int32, cnt: Int32): Int32 {
        return (num << cnt) | Int32((UInt32(num) >> (32 - cnt)))
    }

    /* Perform the appropriate triplet combination function for the current iteration. */
    @OverflowWrapping
    private func sha1FT(t: Int32, b: Int32, c: Int32, d: Int32): Int32 {
        if (t < 20) {
            return (b & c) | ((!b) & d);
        } else if (t < 40) {
            return b ^ c ^ d;
        } else if (t < 60) {
            return (b & c) | (b & d) | (c & d);
        } else {
            return b ^ c ^ d;
        }
    }

    /* Determine the appropriate additive constant for the current iteration. */
    @OverflowWrapping
    private func sha1KT(t: Int32): Int32 {
        if (t< 20) {
            return 1518500249
        } else if (t < 40) {
            return 1859775393
        } else if (t < 60) {
            return -1894007588
        } else {
            return -899497514
        }
    }

    @OverflowWrapping
    private func coreSHA1(x: Array<Int32>, len: Int32): Array<Int32> {
        /* append padding */
        x[Int64(len >> 5)] |= 0x80 << (24 - len % 32)
        x[Int64((((len + 64) >> 9) << 4) + 15)] = len

        var w: Array<Int32> = Array<Int32>(80, repeat:0)
        var a: Int32 = 1732584193
        var b: Int32 = -271733879
        var c: Int32 = -1732584194
        var d: Int32 = 271733878
        var e: Int32 = -1009589776

        for (i in 0..x.size: 16) {
            var olda: Int32 = a
            var oldb: Int32 = b
            var oldc: Int32 = c
            var oldd: Int32 = d
            var olde: Int32 = e

            for (j in 0..80) {
                if (j < 16) {
                    w[j] = x[Int64(i + j)]
                } else {
                    w[j] = bitRotateLeft(w[j - 3] ^ w[j - 8] ^ w[j - 14] ^ w[j - 16], 1)
                }
                var t: Int32 = bitRotateLeft(a, 5) + sha1FT(Int32(j), b, c, d) + e + w[j] + sha1KT(Int32(j))
                e = d
                d = c
                c = bitRotateLeft(b, 30)
                b = a
                a = t
            }
            a = a + olda
            b = b + oldb
            c = c + oldc
            d = d + oldd
            e = e + olde
        }
        return [a, b, c, d, e]
    }

    @OverflowWrapping
    public func hexSHA1(stringData: String): String {
        var bin: Array<Int32> =str2binb(stringData)
        var sha1: Array<Int32> = coreSHA1(bin, Int32(stringData.size)*CHRSZ)
        var hex: String = binb2hex(sha1)
        return hex
    }

    @OverflowWrapping
    public func timeHexSHA1(iters: Int32): Unit {
        for (i in 0..iters) {
            hexSHA1(TEXT)
        }
    }

    @OverflowWrapping
    public func verify(): Bool {
        var sha1Output: String = hexSHA1(TEXT)
        return sha1Output == SHA1_EXPECTED
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
    var reps: Int32 = 1600

    var args = Process.current.arguments
    if (args.size == 1) {
        var num = Int32.tryParse(args[0])??0

        if (num != 0) {
            reps = num
        }
    }

    var obj: CryptoSHA1 = CryptoSHA1()
    
    var startTime = DateTime.now()
    obj.timeHexSHA1(reps)
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
