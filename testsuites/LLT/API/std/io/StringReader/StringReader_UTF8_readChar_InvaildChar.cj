/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %stdx-package -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_args | compare %f
// ASSERT: scan ContentFormatException: Invalid unicode scalar value.

/*
 * Test description: Test the IOException for calss StringReader
 * Test API: public func read(): Option<Rune>
 */

internal import std.io.*

main() {
    var str = """
0 1 2 3 4 5 6 7 8 9 10
零 一 二 三 四 五 六 七 八 九 十
one two three four five six seven eight nine ten
"""
    var arr: Array<Byte> = str.toArray()
    arr[arr.size / 2] = 255 // Invalid character encoding: 11111111 (255)
    var bas: ByteBuffer = ByteBuffer()
    bas.write(arr)
    var strReader = StringReader(bas)
    try {
        while (true) {
            strReader.read()
        }
    } catch (e: ContentFormatException) {
        println(e)
    }
    return 0
}
