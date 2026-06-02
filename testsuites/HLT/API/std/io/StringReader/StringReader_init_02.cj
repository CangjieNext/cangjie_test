/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC: %run %run_opt %output %run_args

import std.io.*

main() {
    var a: ByteBuffer = ByteBuffer()
    var data1 = Array<Byte>(1, repeat: 65)
    var data2 = Array<Byte>(4095, repeat: 66)
    a.write(data1)
    var strReader = StringReader(a)
    var readStr = strReader.read()
    if ((readStr ?? r'@') != r'A') {
        return 1
    }
    a.write(data2)
    var strReader1 = StringReader(a)
    var readStr1 = strReader1.read()
    if ((readStr1 ?? r'@') != r'B') {
        return 2
    }
    return 0
}
