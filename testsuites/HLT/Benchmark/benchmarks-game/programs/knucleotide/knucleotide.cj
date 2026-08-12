/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %optimization_level_2 %overflow_wrapping %f -o %output
import std.collection.*
import std.sync.*
import std.fs.*
import std.convert.*
import std.math.*
import std.time.*
import std.sort.SortByExtension
import std.runtime.*

let threadNum: Int64 = ProcessorInfo.processorCount
let toChar: Array<Rune> = [r'A', r'C', r'T', r'G']

struct KV {
    public let key: UInt64
    public let value: Int64
    public init(k: UInt64, v: Int64) {
        key = k
        value = v
    }
}

func GetDataStart(arr: Array<UInt8>): Int64 {
    var arrSize = arr.size
    var i = 0
    while (i < arrSize) {
        if (arr[i] == 62 && arr[i + 2] == 72) { // 62 is r'>', 72 is r'H'
            i++
            while (i < arrSize) {
                if (arr[i] == 10) {  // 10 is r'\n'
                    return i + 1
                }
                i++
            }
        }
        i++
    }
    return 0
}

func GetData(): Array<UInt8> {
    let arr: Array<UInt8> = File.readFrom("/dev/stdin")
    let arrSize: Int64 = arr.size
    var i: Int64 = GetDataStart(arr)
    let dataLen = arrSize - i
    let newLen = dataLen - (dataLen / 61) - if((dataLen % 61) > 0) { 1 } else { 0 }
    let newArr: Array<UInt8> = Array<UInt8>(newLen, repeat:0)
    var j = 0
    while (i < arrSize && j < newLen) {
        if (arr[i] == 10) {  // 10 is r'\n'
            i++
            continue
        }
        newArr[j] = arr[i] >> 1 & 3
        i++
        j++
    }
    return newArr
}

func processSize(arr: Array<UInt8>, size: Int64, begin: Int64): HashMap<UInt64, Int64> {
    var map = HashMap<UInt64, Int64>()
    var key: UInt64 = 0
    var idxEnd = 0
    var nsize = size

    for (i in 0..size) {
      key = key << 2
      key = key | UInt64(arr[i+begin])
    }

    map.add(key, 0)

    let mask : UInt64 = ! (UInt64.Max << (2*size))

    if (threadNum < size) {
        nsize = threadNum
    }

    var idx = begin + threadNum
    let arrSize = arr.size- size + 1
    while (idx < arrSize) {
        idxEnd = idx + nsize
        for (k in idx..idxEnd) {
            key = key << 2
            key = key | UInt64(arr[k])
        }

        key = key & mask

        var entry = map.entryView(key)
        entry.value = (entry.value ?? 0) + 1
        idx += threadNum
    }
    return map
}

func startCount(arr: Array<UInt8>, size: Int64): HashMap<UInt64, Int64> {
    var threads: ArrayList<Future<HashMap<UInt64, Int64>>> = ArrayList<Future<HashMap<UInt64, Int64>>>(threadNum)
    for (i in 0..threadNum) {
        var future: Future<HashMap<UInt64, Int64>> = spawn { processSize(arr, size, i) }
        threads.add(future)
    }
    var res0: HashMap<UInt64, Int64> = threads[0].get()
    var i = 1
    while (i < threadNum) {
        let res: HashMap<UInt64, Int64> = threads[i].get()
        for ((k, v) in res) {
            var entry = res.entryView(k)
            entry.value = (entry.value ?? 0) + v
        }
        i++
    }
    return res0
}

func WriteFrequencies(arr: Array<UInt8>, size: Int64): Unit {
    let counts = startCount(arr, size)
    let countsSize: Int64 = counts.size
    let sum = Float64(arr.size - size + 1)
    let sb: StringBuilder = StringBuilder()
    var kvs = Array<KV>(countsSize, repeat:KV(0, 0))
    var i: Int64 = 0
    for ((k, v) in counts) {
        kvs[i] = KV(k, v)
        i++
    }
    kvs.sortBy(comparator: {a: KV, b: KV => b.value.compare(a.value)}, stable: true)
    i = 0
    while (i < countsSize) {
        decompress(kvs[i].key, size, sb)
        sb.append(r' ')
        var value: Float64 = Float64(kvs[i].value * 100) / sum
        sb.append(value.format(".3"))
        sb.append(r'\n')
        i++
    }
    println(sb)
}

func GetStringKey(str: String): UInt64 {
    let arr = str.toArray()
    var key: UInt64 = 0
    for (c in arr) {
        var cc: UInt8 = (c + 32) >> 1 & 3
        key = key << 2
        key = key | UInt64(cc)
    }
    return key
}

func WriteCount(arr: Array<UInt8>, str: String): Unit {
    let counts = startCount(arr, str.size)
    var key = GetStringKey(str)
    var count = counts.get(key) ?? 0
    print(count)
    print(r'\t')
    println(str)
}

func decompress(num: UInt64, size: Int64, sb: StringBuilder): Unit {
    var key: UInt64 = num
    for (i in 0..size) {
        sb.append(toChar[Int64(key & 3)])
        key = key >> 2
    }
}


@OverflowWrapping
main(): Int64 {
    let dna = GetData()
    WriteFrequencies(dna, 1)
    WriteFrequencies(dna, 2)
    WriteCount(dna, "GGT");
    WriteCount(dna, "GGTA");
    WriteCount(dna, "GGTATT");
    WriteCount(dna, "GGTATTTTAATT");
    WriteCount(dna, "GGTATTTTAATTTATAGT");
    return 0
}
