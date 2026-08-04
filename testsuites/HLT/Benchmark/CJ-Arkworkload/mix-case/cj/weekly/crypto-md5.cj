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
class Timer {
    // ms
    public func getTime() {
        let time = DateTime.now()
        return time
    }
}

func currentTimestamp13() {
   return Timer().getTime() 
}


let hexcase:Bool = false
let chrsz:Int64 = 8

func safe_add(x: UInt32, y: UInt32):UInt32 {
    let lsw = (x & 0xFFFF) + (y & 0xFFFF)
    let msw = (x >> 16) + (y >> 16) + (lsw >> 16)
    return (msw << 16) | (lsw & 0xFFFF)
}

func bit_rol(num: UInt32, cnt: UInt32): UInt32 {
    return (num << cnt) | (num >> (32 - cnt))
}
func md5_cmn(q: UInt32, a: UInt32, b: UInt32, x: UInt32, s: UInt32, t: UInt32): UInt32 {
    return safe_add(bit_rol(safe_add(safe_add(a, q), safe_add(x, t)), s), b)
}

func md5_ff(a: UInt32, b: UInt32, c: UInt32, d: UInt32, x: UInt32, s: UInt32, t: UInt32): UInt32 {
    return md5_cmn((b & c) | ((!b) & d), a, b, x, s, t)
}

func md5_gg(a: UInt32, b: UInt32, c: UInt32, d: UInt32, x: UInt32, s: UInt32, t: UInt32): UInt32 {
    return md5_cmn((b & d) | (c & (!d)), a, b, x, s, t)
}

func md5_hh(a: UInt32, b: UInt32, c: UInt32, d: UInt32, x: UInt32, s: UInt32, t: UInt32): UInt32 {
    return md5_cmn(b ^ c ^ d, a, b, x, s, t)
}

func md5_ii(a: UInt32, b: UInt32, c: UInt32, d: UInt32, x: UInt32, s: UInt32, t: UInt32): UInt32 {
    return md5_cmn(c ^ (b | (!d)), a, b, x, s, t)
}

func str2binl(str: String): ArrayList<UInt32> {
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
        bin[eIndex] |= (charCode & mask) << (UInt32(i) % 32)
    }
    return bin
}

/*
 * Calculate the MD5 of an array of little-endian words, and a bit length
 */
func core_md5(xx:ArrayList<UInt32>, len:Int64):Array<UInt32> {
    var x = xx
    
    let eIndex1 = len >> 5
    let eIndex2 = (((len + 64) >> 9) << 4) + 14

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

    x[eIndex1] |= 0x80 << ((len) % 32)
    x[eIndex2] = UInt32(len)

    var a: UInt32 = 0x67452301
    var b: UInt32 = 0xEFCDAB89
    var c: UInt32 = 0x98BADCFE
    var d: UInt32 = 0x10325476
    
    for (_ in 0..(16 - (x.size%16))) {
        x.add(0)
    }

    for (j in 0..x.size:16) {
        let olda = a
        let oldb = b
        let oldc = c
        let oldd = d
        a = md5_ff(a, b, c, d, x[j + 0], 7, 0xd76aa478)
        d = md5_ff(d, a, b, c, x[j + 1], 12, 0xe8c7b756)
        c = md5_ff(c, d, a, b, x[j + 2], 17, 0x242070db)
        b = md5_ff(b, c, d, a, x[j + 3], 22, 0xc1bdceee)
        a = md5_ff(a, b, c, d, x[j + 4], 7, 0xf57c0faf)
        d = md5_ff(d, a, b, c, x[j + 5], 12, 0x4787c62a)
        c = md5_ff(c, d, a, b, x[j + 6], 17, 0xa8304613)
        b = md5_ff(b, c, d, a, x[j + 7], 22, 0xfd469501)

        a = md5_ff(a, b, c, d, x[j + 8], 7, 0x698098d8)
        d = md5_ff(d, a, b, c, x[j + 9], 12, 0x8b44f7af)
        c = md5_ff(c, d, a, b, x[j + 10], 17, 0xffff5bb1)
        b = md5_ff(b, c, d, a, x[j + 11], 22, 0x895cd7be)
        a = md5_ff(a, b, c, d, x[j + 12], 7, 0x6b901122)
        d = md5_ff(d, a, b, c, x[j + 13], 12, 0xfd987193)
        c = md5_ff(c, d, a, b, x[j + 14], 17, 0xa679438e)
        b = md5_ff(b, c, d, a, x[j + 15], 22, 0x49b40821)

        a = md5_gg(a, b, c, d, x[j + 1], 5, 0xf61e2562)
        d = md5_gg(d, a, b, c, x[j + 6], 9, 0xc040b340)
        c = md5_gg(c, d, a, b, x[j + 11], 14, 0x265e5a51)
        b = md5_gg(b, c, d, a, x[j + 0], 20, 0xe9b6c7aa)
        a = md5_gg(a, b, c, d, x[j + 5], 5, 0xd62f105d)
        d = md5_gg(d, a, b, c, x[j + 10], 9, 0x02441453)
        c = md5_gg(c, d, a, b, x[j + 15], 14, 0xd8a1e681)
        b = md5_gg(b, c, d, a, x[j + 4], 20, 0xe7d3fbc8)

        a = md5_gg(a, b, c, d, x[j + 9], 5, 0x21e1cde6)
        d = md5_gg(d, a, b, c, x[j + 14], 9, 0xc33707d6)
        c = md5_gg(c, d, a, b, x[j + 3], 14, 0xf4d50d87)
        b = md5_gg(b, c, d, a, x[j + 8], 20, 0x455a14ed)
        a = md5_gg(a, b, c, d, x[j + 13], 5, 0xa9e3e905)
        d = md5_gg(d, a, b, c, x[j + 2], 9, 0xfcefa3f8)
        c = md5_gg(c, d, a, b, x[j + 7], 14, 0x676f02d9)
        b = md5_gg(b, c, d, a, x[j + 12], 20, 0x8d2a4c8a)


        a = md5_hh(a, b, c, d, x[j + 5], 4, 0xfffa3942)
        d = md5_hh(d, a, b, c, x[j + 8], 11, 0x8771f681)
        c = md5_hh(c, d, a, b, x[j + 11], 16, 0x6d9d6122)
        b = md5_hh(b, c, d, a, x[j + 14], 23, 0xfde5380c)

        a = md5_hh(a, b, c, d, x[j + 1], 4, 0xa4beea44)
        d = md5_hh(d, a, b, c, x[j + 4], 11, 0x4bdecfa9)
        c = md5_hh(c, d, a, b, x[j + 7], 16, 0xf6bb4b60)
        b = md5_hh(b, c, d, a, x[j + 10], 23, 0xbebfbc70)

        a = md5_hh(a, b, c, d, x[j + 13], 4, 0x289b7ec6)
        d = md5_hh(d, a, b, c, x[j + 0], 11, 0xeaa127fa)
        c = md5_hh(c, d, a, b, x[j + 3], 16, 0xd4ef3085)
        b = md5_hh(b, c, d, a, x[j + 6], 23, 0x04881d05)

        a = md5_hh(a, b, c, d, x[j + 9], 4, 0xd9d4d039)
        d = md5_hh(d, a, b, c, x[j + 12], 11, 0xe6db99e5)
        c = md5_hh(c, d, a, b, x[j + 15], 16, 0x1fa27cf8)
        b = md5_hh(b, c, d, a, x[j + 2], 23, 0xc4ac5665)


        a = md5_ii(a, b, c, d, x[j + 0], 6, 0xf4292244)
        d = md5_ii(d, a, b, c, x[j + 7], 10, 0x432aff97)
        c = md5_ii(c, d, a, b, x[j + 14], 15, 0xab9423a7)
        b = md5_ii(b, c, d, a, x[j + 5], 21, 0xfc93a039)

        a = md5_ii(a, b, c, d, x[j + 12], 6, 0x655b59c3)
        d = md5_ii(d, a, b, c, x[j + 3], 10, 0x8f0ccc92)
        c = md5_ii(c, d, a, b, x[j + 10], 15, 0xffeff47d)
        b = md5_ii(b, c, d, a, x[j + 1], 21, 0x85845dd1)

        a = md5_ii(a, b, c, d, x[j + 8], 6, 0x6fa87e4f)
        d = md5_ii(d, a, b, c, x[j + 15], 10, 0xfe2ce6e0)
        c = md5_ii(c, d, a, b, x[j + 6], 15, 0xa3014314)
        b = md5_ii(b, c, d, a, x[j + 13], 21, 0x4e0811a1)

        a = md5_ii(a, b, c, d, x[j + 4], 6, 0xf7537e82)
        d = md5_ii(d, a, b, c, x[j + 11], 10, 0xbd3af235)
        c = md5_ii(c, d, a, b, x[j + 2], 15, 0x2ad7d2bb)
        b = md5_ii(b, c, d, a, x[j + 9], 21, 0xeb86d391)
        a = safe_add(a, olda)
        b = safe_add(b, oldb)
        c = safe_add(c, oldc)
        d = safe_add(d, oldd)
    }
    return [a, b, c, d]
}

func binl2hex(binarray: Array<UInt32>): String {
    var hex_tab = ""
    if (hexcase) {
        hex_tab = "0123456789ABCDEF"
    } else {
        hex_tab = "0123456789abcdef"
    }

    var str: String = ""
    for (i in 0..(binarray.size * 4)) {
        let index = i >> 2
        let shift = (i % 4) * 8
        var hexChar1 = hex_tab[Int64((binarray[index] >> (shift + 4)) & 0xF)]
        var hexChar2 = hex_tab[Int64((binarray[index] >> shift) & 0xF)]
        var hexString: String =  String.fromUtf8([hexChar1, hexChar2])
        str += hexString
    }
    return str
}

/*
 * These are the funcs you'll usually want to call
 * They take string arguments and return either hex or base-64 encoded strings
 */
func hex_md5(s:String):String {
    return binl2hex(core_md5(str2binl(s), s.size * chrsz)); 
}

func run() {
    var plainText = "Rebellious subjects, enemies to peace,\nProfaners of this neighbour-stained steel,--\nWill they not hear? What, ho! you men, you beasts,\nThat quench the fire of your pernicious rage\nWith purple fountains issuing from your veins,\nOn pain of torture, from those bloody hands\nThrow your mistemper'd weapons to the ground,\nAnd hear the sentence of your moved prince.\nThree civil brawls, bred of an airy word,\nBy thee, old Capulet, and Montague,\nHave thrice disturb'd the quiet of our streets,\nAnd made Verona's ancient citizens\nCast by their grave beseeming ornaments,\nTo wield old partisans, in hands as old,\nCanker'd with peace, to part your canker'd hate:\nIf ever you disturb our streets again,\nYour lives shall pay the forfeit of the peace.\nFor this time, all the rest depart away:\nYou Capulet; shall go along with me:\nAnd, Montague, come you this afternoon,\nTo know our further pleasure in this case,\nTo old Free-town, our common judgment-place.\nOnce more, on pain of death, all men depart."
    for (_ in 0..4) {
        plainText += plainText
    }
    let md5Output = hex_md5(plainText)
    let expected = "a831e91e0f70eddcb70dc61c6f82f6cd"
    if (md5Output != expected) {
        throw Exception("ERROR: bad result: expected ${expected} but got ${md5Output}")
    }
}

class Benchmark {
   /*
   * @Benchmark
   */
    func runIteration() {
        for (_ in 0..22) {
            run()
        }
    }
}

main() {
    let startTime = currentTimestamp13()
    let benchmark = Benchmark()

    for (i in 0..20) {
        let startTimeInLoop = currentTimestamp13()
        benchmark.runIteration()
        let endTimeInLoop = currentTimestamp13()
    }
    let endTime = currentTimestamp13()
    println("crypto-md5: ms = ${Float64((endTime-startTime).toNanoseconds())/1000000.0}")
}
