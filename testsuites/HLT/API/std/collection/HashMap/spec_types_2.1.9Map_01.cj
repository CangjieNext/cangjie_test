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

import std.collection.*

open class A {}

class B <: A {}

func foo() {
    var mapThree: HashMap<Int64, Rune>
    mapThree = HashMap<Int64, Rune>([(7, r'g'), (8, r'h'), (9, r'i')])
}

main() {
    let mapZero: HashMap<Int32, Rune> = HashMap<Int32, Rune>() // empty Map
    let mapOne: HashMap<Int32, String> = HashMap<Int32, String>([(1, "Aa"), (2, "Bb"), (3, "Cc"), (1, "fir")]) // mapOne = #{1 : "Aa", 2 : "Bb", 3 : "Cc"}, as duplicated key and its value '1 : "fir"' is removed
    var mapTwo = HashMap<Int32, String>([(4, "Dd"), (5, "Ee"), (6, "Ff")]) // The type of mapTwo is inferred to be HashMap<Int64, String>
    return 0
}
