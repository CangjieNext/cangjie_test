/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %stdx-package -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_args | compare %f
// ASSERT: scan ok

/*
 * Test description: Test the func for calss StringReader
 * Test API: public func read(): Option<Rune>
 */

internal import std.io.*
internal import std.collection.*

main() {
    var str = """
0 1 2 3 4 5 6 7 8 9 10
零 一 二 三 四 五 六 七 八 九 十
one two three four five six seven eight nine ten
"""
    var bas: ByteBuffer = ByteBuffer()
    bas.write(str.toArray())
    var strReader = StringReader(bas)
    var sb: StringBuilder = StringBuilder()
    while (true) {
        var ret = strReader.read()
        match (ret) {
            case Some(c) => sb.append(c)
            case None => break
        }
    }
    if (sb.toString() != str) {
        return 1
    }
    println("ok")
    return 0
}
