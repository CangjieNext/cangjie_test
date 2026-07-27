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
import std.random.*

let inDebug = false
func log(str: String) {
    if (inDebug) {
        print(str)
    }
}

/* Convert data (an array of integers) to a Base64 string. */
let toBase64Table = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".toArray()
let base64Pad = UInt8(UInt32(r'='))

func toBase64(data: String): String {
    var result:ArrayList<UInt8> = ArrayList<UInt8>()
    let length = data.size
    var i = 0

    while (i < (length - 2)) {
        result.add(toBase64Table[Int64(data[i] >> 2)])
        result.add(toBase64Table[Int64(((data[i] & 0x03) << 4) + (data[i+1] >> 4))])
        result.add(toBase64Table[Int64(((data[i+1] & 0x0f) << 2) + (data[i+2] >> 6))])
        result.add(toBase64Table[Int64(data[i+2] & 0x3f)])

        i += 3
    }

    if ((length % 3) != 0) {
        i = length - (length % 3)
        result.add(toBase64Table[Int64(data[i] >> 2)])
        if ((length % 3) == 2) {
            result.add(toBase64Table[Int64(((data[i] & 0x03) << 4) + (data[i+1] >> 4))])
            result.add(toBase64Table[Int64((data[i+1] & 0x0f) << 2)])
            result.add(base64Pad)
        } else {
            result.add(toBase64Table[Int64((data[i] & 0x03) << 4)])
            result.add(base64Pad)
            result.add(base64Pad)
        }
    }
    var res_str:String = String.fromUtf8(result.toArray())
    return res_str
}

/* Convert Base64 data to a string */
let toBinaryTable: Array<Int64> = [
    -1,-1,-1,-1, -1,-1,-1,-1, -1,-1,-1,-1, -1,-1,-1,-1,
    -1,-1,-1,-1, -1,-1,-1,-1, -1,-1,-1,-1, -1,-1,-1,-1,
    -1,-1,-1,-1, -1,-1,-1,-1, -1,-1,-1,62, -1,-1,-1,63,
    52,53,54,55, 56,57,58,59, 60,61,-1,-1, -1, 0,-1,-1,
    -1, 0, 1, 2,  3, 4, 5, 6,  7, 8, 9,10, 11,12,13,14,
    15,16,17,18, 19,20,21,22, 23,24,25,-1, -1,-1,-1,-1,
    -1,26,27,28, 29,30,31,32, 33,34,35,36, 37,38,39,40,
    41,42,43,44, 45,46,47,48, 49,50,51,-1, -1,-1,-1,-1
]

func base64ToString(data: String): String {
    var result = StringBuilder("")
    var leftbits = 0 // number of bits decoded, but yet to be appended
    var leftdata = 0 // bits decoded, but yet to be appended

    // Convert one by one.
    for (i in 0..data.size) {
        let charCode = data[i]
        let c: Int64 = toBinaryTable[Int64(data[i] & 0x7f)]
        let padding: Bool = (charCode == base64Pad)
        // Skip illegal characters and whitespace
        if (c == -1) { continue }
        // Collect data into leftdata, update bitcount
        leftdata = (leftdata << 6) | c
        leftbits += 6
        // If we have 8 or more bits, append 8 bits to the result
        if (leftbits >= 8) {
            leftbits -= 8
            // Append if not padding.
            if (!padding) {
                result.append(Rune(UInt8((leftdata >> leftbits) & 0xff)).toString())
            }
            leftdata &= (1 << leftbits) - 1
        }
    }

    // If there are any bits left, the base64 string was corrupted
    if (leftbits > 0) {
        throw Exception("Corrupted base64 string")
    }
    return result.toString()
}


func run() {
    var str = StringBuilder("")
    var random = Random()
    for (_ in 0..8192) {
        str.append(Rune(UInt8(25.0 * random.nextFloat64()) + UInt8(97)).toString())
    }

    var i = 8192
    while (i < 16384) {
        var base64 = toBase64(str.toString())
        let encoded = base64ToString(base64)

        if (encoded != str.toString()) {
            throw Exception("bad result: expected ${str.toString()} but got ${encoded}")
        }
        // Double the string
        str.append(str)
        i *= 2
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
        for (i in 0..8) {
            let startTimeInLoop = Timer().getTime()
            run()
            let endTimeInLoop = Timer().getTime()
        }
    }
}

class Timer {
    // ms
    public func getTime() {
        let time = DateTime.now()
        return time
    }
}

main() {
    let startTime = Timer().getTime()
    let benchmark = Benchmark()
    for (_ in 0..20) {
        benchmark.runIteration()
    }
    let endTime = Timer().getTime()
    println("base64: ms = ${Float64((endTime-startTime).toNanoseconds())/1000000.0}")
}
