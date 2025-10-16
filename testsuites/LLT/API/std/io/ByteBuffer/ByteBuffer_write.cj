/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE-0: %compiler %cmp_opt -o %n.%suffix %f
// EXEC-PIPE-0: %run %run_opt %n.%suffix %run_args | compare %f
// ASSERT: scan 23
// ASSERT: scan 9999999999hello cangjie
// ASSERT: scan 28
// ASSERT: scan 9999999999hello cangjielo ca
// ASSERT: scan 9999999999
// ASSERT: scan hello cangjielo ca
// ASSERT: scan 23
// ASSERT: scan hello cangjielo cacangj
// ASSERT: scan a

internal import std.io.ByteBuffer

main() {
    var bas = ByteBuffer()
    var data = Array<Byte>(10, repeat: 57)
    bas.write(data)
    bas.write("hello cangjie".toArray())
    println(bas.length)
    println(String.fromUtf8(bas.bytes()))
    bas.write("hello cangjie".toArray().slice(3, 5))
    println(bas.length)
    println(String.fromUtf8(bas.bytes()))

    data = Array<Byte>(10, repeat: 0)
    bas.read(data)
    println(String.fromUtf8(data))
    println(String.fromUtf8(bas.bytes()))

    bas.write("hello cangjie".toArray().slice(6, 5))
    println(bas.length)
    println(String.fromUtf8(bas.bytes()))

    var dataLeng = Array<Byte>(2048, repeat: 0)
    bas.read(dataLeng)
    bas.writeByte(97)
    println(String.fromUtf8(bas.bytes()))
    return 0
}
