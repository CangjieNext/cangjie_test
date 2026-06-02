/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
import std.collection.*

func strToChar(data: Array<Rune>): Option<Rune> {
    if (data.size < 2 || data[0] != r'r' || data[data.size - 1] != r'\'') {
        println("1")
        println(data[0])
        println(data[0] != r'\'')
        println(data[data.size - 1])
        println(data[data.size - 1] != r'\'')
        return None
    }
    /* Check special characters. */
    if (data.size == 4 && data[1] == r'\\') {
        match (data[2]) {
            case r'n' => return Option<Rune>.Some(r'\n')
            case r'r' => return Option<Rune>.Some(r'\r')
            case r't' => return Option<Rune>.Some(r'\t')
            case r'b' => return Option<Rune>.Some(r'\b')
            case r'f' => return Option<Rune>.Some(r'\f')
            case r'v' => return Option<Rune>.Some(r'\v')
            case r'0' => return Option<Rune>.Some(r'\0')
            case r'$' => return Option<Rune>.Some(r'$')
            case r'\\' => return Option<Rune>.Some(r'\\')
            case r'\'' => return Option<Rune>.Some(r'\'')
            case _ => return Option<Rune>.None
        }
    }
    /* Determine a single character. */
    if (data.size == 4) {
        return Option<Rune>.Some(data[2])
    }
    /* Check whether it is Unicode. */
    if (data[1] == r'\\' && data[2] == r'u') {
        return None
    }
    println("2")
    return None
}

main(): Int64 {
    var arr1 = ["'1'", "'s'", #"'s'"#, "'！'", "'$'", "'中'"]
    var arr2 = ArrayList<Rune>()
    var arr3 = ArrayList<Rune>([r'1', r's', r's', r'！', r'$', r'中'])
    for (i in arr1) {
        println(strToChar(i.toRuneArray()))
        arr2.add(Rune.parse(i))
    }
    if (arr2 != arr3) {
        return 1
    }
    return 0
}
