/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_args | compare %f
// ASSERT: scan catch it!
/*
 * Test description: Test the funcs for ByteBuffer
 * Test API: public func indexOf(src: Array<Byte>, byte: Byte, start!: Int64 = 0): Option<Int64>
 *           public func indexOf(src: SubArray<Byte>, byte: Byte, start!: Int64 = 0): Option<Int64>
 *           public func indexOf(src: Array<Byte>, bytes: Array<Byte>, start!: Int64 = 0): Option<Int64>
 *           public func indexOf(src: SubArray<Byte>, bytes: Array<Byte>, start!: Int64 = 0): Option<Int64>
 *           public func trim(src: Array<Byte>, start: Int64, length: Int64, trimBytes: Array<Byte>): SubArray<Byte>
 *           public func read(buffer: SubArray<Byte>): Int64
 */

internal import std.io.*

main() {
    var basm = ByteBuffer()
    basm.write("".toArray())
    var dataa = readToEnd(basm)
    var bytess = "".toArray()

    var bas115 = ByteBuffer()
    bas115.write("".toArray())
    var subArrayfrombas = bas115.bytes()
    var int64fromread = bas115.read(subArrayfrombas)
    if (int64fromread != 0) {
        return 17
    }
    var bas19 = ByteBuffer()
    bas19.write("nihao".toArray())
    var subArrayfrombas19 = bas19.bytes()
    var int64fromread19 = bas19.read(subArrayfrombas19)
    if (int64fromread19 != 5) {
        return 18
    }
    var bas28 = ByteBuffer()
    var subArrayfrombas28 = bas28.bytes()
    bas28.write("nihao".toArray())
    try {
        var int64fromread28 = bas28.read(subArrayfrombas28)
    } catch (_) {
        println("catch it!")
    }
    return 0
}
