/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_args

/*
 * Test description:This test case is designed to test the hard-to-reach branches of the code.
 * Test API: public func read(buffer: Array<Byte>): Int64
 */

internal import std.io.*

main() {
    var bas = ByteBuffer()
    var fileArr: Array<InputStream> = [bas]
    var chainedInputStream = ChainedInputStream(fileArr)
    var buff = Array<Byte>()
    var readLen = 0
    try {
        readLen = chainedInputStream.read(buff)
    } catch (e: Exception) {
        if (e.message != "The buffer cannot be empty!") {
            return 1
        }
    }

    buff = [1]
    //第一次读取数据，因为bas为空，readNum为0，此时curIndex=1;
    //第二次读数据，进入(curIndex >= inputArrSize)分支，返回0.
    readLen = chainedInputStream.read(buff)
    readLen = chainedInputStream.read(buff)
    if (readLen != 0) {
        return 2
    }

    return 0
}
