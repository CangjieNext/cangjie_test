/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE-0: %compiler %cmp_opt -o %n.%suffix %f
// EXEC-PIPE-0: %run %run_opt %n.%suffix %run_args | compare %f
// ASSERT: scan hello cangjie

internal import std.io.ByteBuffer

main() {
    var bas = ByteBuffer(123)
    var data = "hello cangjie".toArray()
    bas.write(data)
    println(String.fromUtf8(bas.bytes()))
    return 0
}
