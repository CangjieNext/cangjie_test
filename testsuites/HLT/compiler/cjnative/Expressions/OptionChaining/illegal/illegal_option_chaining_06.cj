/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output
import std.collection.*
func test(y: Int64) {
    let arrList = ArrayList<Int64>([100,200])

    let a = Option<ArrayList<Int64>>.Some(arrList)
    var m = a?[y]
    var m1 = a?[y]?
    var n= match (m){
        case Some(x) => x
        case None => -1
    }
    return n
}

main(): Int64 {
    test(1)
    return 0
}
// ASSERT: scan parse_expected_character_after
// ASSERT: scan parse_expected_expression
