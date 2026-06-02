/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

let globals_r1 = Range<Int64>(0, 10, 1, true, true, true)
var globals_r2:Range<Int8> = 10..=0:-1
let globals_r3 = Range<UInt32>(0, 10, 1, true, true, true)
func test_range(ra:Range<Rune>){
    var a = ra
    return 0
}
main(): Int64 {
    let r1: Range<Int32> = 10..=0 : -1
    let r2 = Range<Int16>(0, 10, 1, true, true, true)
    let r3 = Range<UInt8>(0, 10, 1, true, true, true)
    let r4: Range<UInt16> = 0..=10 : 1
    let r5: Range<UInt64> = 10..=0 : -1
    let r6=Range<Rune>(r'a', r'z', 1, true, true, true)
    var test_lambda = {
        a: Range<Int16>,
        b: Range<UInt16>,
        c: Range<Rune>
        =>
        print("cangjie\n")
    }(r2, r4, r6)
    test_range(r6)
    return 0
}
