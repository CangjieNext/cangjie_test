/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE-0: %compiler %cmp_opt -o %n.%suffix %f
// EXEC-PIPE-0: %run %run_opt %n.%suffix %run_args | compare %f
// ASSERT: scan 150
// ASSERT: scan 170
// ASSERT: scan setLength: 20, 20, 20

internal import std.io.ByteBuffer

main(): Unit {
    let buffer = ByteBuffer(100)
    buffer.write(Array<Byte>(60, repeat: 0))
    buffer.reserve(80)
    println(buffer.capacity)

    let consumedBuffer = ByteBuffer(100)
    consumedBuffer.write(Array<Byte>(90, repeat: 0))
    consumedBuffer.read(Array<Byte>(30, repeat: 0))
    consumedBuffer.reserve(80)
    println(consumedBuffer.capacity)

    let lengthBuffer = ByteBuffer(10)
    lengthBuffer.setLength(20)
    println("setLength: ${lengthBuffer.capacity}, ${lengthBuffer.length}, ${lengthBuffer.bytes().size}")
}
