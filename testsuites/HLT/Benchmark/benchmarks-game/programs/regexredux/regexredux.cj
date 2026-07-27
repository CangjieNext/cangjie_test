/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// (LLVM) EXEC: %compiler %cmp_opt %optimization_level_2 --fast-math %overflow_wrapping %f -o %output
// (JET) EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output

import std.fs.*
import std.regex.*

func countMatches(pat: String, str: String): Int64 {
    Regex(pat).matcher(str).allCount()
}

main() {
    let variants = [
        "agggtaaa|tttaccct",
        "[cgt]gggtaaa|tttaccc[acg]",
        "a[act]ggtaaa|tttacc[agt]t",
        "ag[act]gtaaa|tttac[agt]ct",
        "agg[act]taaa|ttta[agt]cct",
        "aggg[acg]aaa|ttt[cgt]ccct",
        "agggt[cgt]aa|tt[acg]accct",
        "agggta[cgt]a|t[acg]taccct",
        "agggtaa[cgt]|[acg]ttaccct"
    ]

    let replacements = [
        (Regex("tHa[Nt]"), "<4>"),
        (Regex("aND|caN|Ha[DS]|WaS"), "<3>"),
        (Regex("a[NSt]|BY"), "<2>"),
        (Regex("<[^>]*>"), "|"),
        (Regex("\\|[^|][^|]*\\|"), "-")
    ]

    var arr = File.readFrom("/dev/stdin")
    var str = String.fromUtf8(arr)
    var inputLength = str.size
    str = Regex(">[^\n]*\n|\n").matcher(str).replaceAll("")
    let codeLength = str.size

    var counts = Array<Int64>(variants.size, repeat: 0)
    let l_str = str
    var threads = Array<Future<Int64>>(variants.size, {
            n => spawn { countMatches(variants[n], l_str) }
        })

    for (n in 0..threads.size) {
        var temp_count = threads[n].get()
        counts[n] = temp_count
    }

    var future = spawn {
        var tmp_str = l_str
        for (rep in replacements) {
            tmp_str = rep[0].matcher(tmp_str).replaceAll(rep[1])
        }
        tmp_str
    }

    str = future.get()
    let resultLength = str.size

    for (n in 0..variants.size) {
        print(variants[n])
        print(' ')
        println(counts[n])
    }
    print('\n')
    println(inputLength)
    println(codeLength)
    println(resultLength)
}
