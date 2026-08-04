/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 --no-sub-pkg %f -o %output
// RUN-EXEC: %export cjHeapSize=512mb && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ms


import std.time.*
import std.collection.*

let inDebug = false
func log(str: String) {
    if (inDebug) {
        print(str)
    }
}
func currentTimestamp13() {
    return Timer().getTime()
}

/*
 * Configurable variables. You may need to tweak these to be compatible with
 * the server-side, but the defaults work in most cases.
 */
let hexcase: Bool = false  /* hex output format. 0 - lowercase; 1 - uppercase        */
let b64pad: String = "" /* base-64 pad character. "=" for strict RFC compliance   */
let chrsz: Int64   = 8  /* bits per input character. 8 - ASCII; 16 - Unicode      */

/*
 * Calculate the SHA-1 of an array of big-endian words, and a bit length
 */
func core_sha1(xx:ArrayList<UInt32>, len:Int64):Array<UInt32> {
    var x = xx
    
    let eIndex1 = len >> 5
    let eIndex2 = (((len + 64) >> 9) << 4) + 15

    var maxIndex:Int64 = 0
    if (eIndex1 > eIndex2) {
        maxIndex = eIndex1
    } else {
        maxIndex = eIndex2
    }
    
    if (maxIndex+1 > x.size) {
        for (_ in 0..maxIndex+1-x.size) {
            x.add(0)
        }
    }

    x[eIndex1] |= 0x80 << (24 - len % 32)
    x[eIndex2] = UInt32(len)

    var w:Array<UInt32> = Array(80, repeat:0)

    var a: UInt32 = 0x67452301
    var b: UInt32 = 0xEFCDAB89
    var c: UInt32 = 0x98BADCFE
    var d: UInt32 = 0x10325476
    var e: UInt32 = 0xC3D2E1F0
    
    for (i in 0..x.size:16) {
        let olda = a
        let oldb = b
        let oldc = c
        let oldd = d
        let olde = e

        for (j in 0..80) {
            if (j < 16) {
                w[j] = x[i+j]
            } else {
                w[j] = rol(w[j-3] ^ w[j-8] ^ w[j-14] ^ w[j-16],1)
            }
            let t = safe_add(safe_add(rol(a, 5),sha1_ft(j,b,c,d)),safe_add(safe_add(e, w[j]),sha1_kt(j)))
            e = d
            d = c
            c = rol(b, 30)
            b = a
            a = t
        }

        a = safe_add(a, olda)
        b = safe_add(b, oldb)
        c = safe_add(c, oldc)
        d = safe_add(d, oldd)
        e = safe_add(e, olde)
    }
    return [a, b, c, d, e]
}

/*
 * These are the funcs you'll usually want to call
 * They take String arguments and return either hex or base-64 encoded Strings
 */
func hex_sha1(s: String): String {
    return binb2hex(core_sha1(str2binb(s),s.size * chrsz))
}

/*
 * Perform the appropriate triplet combination func for the current
 * iteration
 */
func sha1_ft(t: Int64, b: UInt32, c: UInt32, d: UInt32): UInt32 {
    if (t < 20) {
        return (b & c) | ((!b) & d)
    } else if (t < 40) {
        return b ^ c ^ d
    } else if (t < 60) {
        return (b & c) | (b & d) | (c & d)
    } else {
        return b ^ c ^ d
    }
}

/*
 * Determine the appropriate additive constant for the current iteration
 */
func sha1_kt(t: Int64): UInt32 {
    if (t < 20) {
        return 0x5A827999
    } else if (t < 40) {
        return 0x6ED9EBA1
    } else if (t < 60) {
        return 0x8F1BBCDC
    } else {
        return 0xCA62C1D6
    }
}

/*
 * Add integers, wrapping at 2^32. This uses 16-bit operations internally
 * to work around bugs in some JS interpreters.
 */
func safe_add(x: UInt32, y: UInt32):UInt32 {
    let lsw = (x & 0xFFFF) + (y & 0xFFFF)
    let msw = (x >> 16) + (y >> 16) + (lsw >> 16)
    return (msw << 16) | (lsw & 0xFFFF)
}

/*
 * Bitwise rotate a 32-bit Int to the left.Int32();
 */
func rol(num: UInt32, cnt: UInt32): UInt32 {
    return (num << cnt) | (num >> (32 - cnt))
}

/*
 * Convert an 8-bit or 16-bit String to an array of big-endian words
 * In 8-bit func, characters >255 have their hi-byte silently ignored.
 */
func str2binb(str: String): ArrayList<UInt32> {
    var bin:ArrayList<UInt32> = ArrayList<UInt32>()
    let mask: UInt32 = (1 << chrsz) - 1
    for (i in 0..(str.size * chrsz):chrsz) {
        let index = i / chrsz
        let charIndex = index
        let char = str[charIndex]
        let charCode = UInt32(char)
        
        let eIndex = i >> 5
        if (eIndex+1 > bin.size) {
            bin.add(0)
        }
        bin[eIndex] |= (charCode & mask) << (UInt32(32 - chrsz - i % 32))
    }
    return bin
}

/*
 * Convert an array of big-endian words to a hex String.
 */
func binb2hex(binarray: Array<UInt32>): String {
    var hex_tab = ""
    if (hexcase) {
        hex_tab = "0123456789ABCDEF"
    } else {
        hex_tab = "0123456789abcdef"
    }

    var str: String = ""
    for (i in 0..(binarray.size * 4)) {
        var hex_tab1 = hex_tab[Int64((binarray[i >> 2] >> ((3 - i % 4) * 8 + 4)) & 0xF)]
        var hex_tab2 = hex_tab[Int64((binarray[i >> 2] >> ((3 - i % 4) * 8)) & 0xF)]
        var hexString: String =  String.fromUtf8([hex_tab1, hex_tab2])
        str += hexString
    }
    return str
}

func run() {
    var plainText = "Two households, both alike in dignity,\nIn fair Verona, where we lay our scene,\nFrom ancient grudge break to new mutiny,\nWhere civil blood makes civil hands unclean.\nFrom forth the fatal loins of these two foes\nA pair of star-cross'd lovers take their life;\nWhole misadventured piteous overthrows\nDo with their death bury their parents' strife.\nThe fearful passage of their death-mark'd love,\nAnd the continuance of their parents' rage,\nWhich, but their children's end, nought could remove,\nIs now the two hours' traffic of our stage;\nThe which if you with patient ears attend,\nWhat here shall miss, our toil shall strive to mend."
    for (_ in 0..4) {
        plainText += plainText
    }

    let sha1Output = hex_sha1(plainText)
    let expected = "2524d264def74cce2498bf112bedf00e6c0b796d"

    if (sha1Output != expected) {
        throw Exception("ERROR: bad result: expected ${expected} but got ${sha1Output}")
    }
}

class Timer {
    // ms
    public func getTime() {
        let time = DateTime.now()
        return time 
    }
}
/*
 * @State
 * @Tags Jetstream2
 */
class Benchmark {
  /*
   * @Benchmark
   */
    func runIteration() {
        let startTime = currentTimestamp13()
        for (_ in 0..25) {
            run()
        }
        let endTime = currentTimestamp13()
       
    }
}

main() {
    let startTime = currentTimestamp13()
    for (i in 0..20) {
        let startTimeInLoop = currentTimestamp13()
        Benchmark().runIteration()
        let endTimeInLoop = currentTimestamp13()
       
    }
    let endTime = currentTimestamp13()
    println("crypto-sha1: ms = ${Float64((endTime-startTime).toNanoseconds())/1000000.0}")
}