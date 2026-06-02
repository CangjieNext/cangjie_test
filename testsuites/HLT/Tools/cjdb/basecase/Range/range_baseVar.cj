/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

main() {
    let n = 10
    let r0 = 0..10 // r0 contains 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    let r1 = 0..10 : 1 // r1 contains 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    let r2 = 0..=n : 1 // r2 contains 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    let r3 = n..0 : -2 // r3 contains 10, 8, 6, 4, 2
    let r4 = 10..=0 : -2 // r4 contains 10, 8, 6, 4, 2, 0
    let r5: Range<Rune> = r'A'..r'Z':1
    let r6: Range<Rune> = r'z'..r'a':-1

    var r00: Range<Int64> = Range<Int64>(0, 10, 2, true, true, false)
    var r11: Range<Int64> = Range<Int64>(0, 10, 2, true, false, false)
    var r22: Range<Int64> = Range<Int64>(0, 10, 2, true, false, true)
    var r33: Range<Int64> = Range<Int64>(0, 10, 2, false, true, true)
    var r44: Range<Int64> = Range<Int64>(0, 10, 2, false, true, false)

}
