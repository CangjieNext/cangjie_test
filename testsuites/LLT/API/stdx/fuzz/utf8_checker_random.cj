/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (CJNATIVE) DEPENDENCE: mock_libfuzzer.c
// (CJNATIVE and Unix) EXEC: %clang -c -fPIC mock_libfuzzer.c -o mock_libfuzzer.o
// (CJNATIVE and Unix) EXEC: %compiler %import-stdx-fuzz %cmp_opt -o %n.%suffix %f mock_libfuzzer.o
// (CJNATIVE and Unix) EXEC: %set_stdx_path %run %n.%suffix
import stdx.fuzz.FuzzDataProvider
import std.random.Random

@FastNative
foreign func CJ_fix_to_utf8(data: CPointer<UInt8>, dataLen: Int64): Int64

unsafe main() {
    // 这里调用FuzzDataProvider是为了主动使用fuzz里的API，防止CJ_fix_to_utf8未被连接
    let dp = FuzzDataProvider.withCangjieData(Array<UInt8>())

    // 随机，没有异常
    let random = Random()
    let random_len = 1024
    let data = Array<UInt8>(random_len, repeat: 0)
    random.nextUInt8s(data)
    let dstHandler = acquireArrayRawData(data)
    let ret = CJ_fix_to_utf8(dstHandler.pointer, data.size)
    releaseArrayRawData(dstHandler)
    if (ret > random_len) {
        return -1
    }
    try {
        String.fromUtf8(data[0..ret])
    } catch (e: Exception) {
        println("Cannot fix random string to utf8, print it:")
        println(data)
        return -1
    }
    return 0
}
