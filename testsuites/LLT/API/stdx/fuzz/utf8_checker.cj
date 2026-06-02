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

@FastNative
foreign func CJ_fix_to_utf8(data: CPointer<UInt8>, dataLen: Int64): Int64

unsafe func simpleChecker(originalData: Array<UInt8>, targetData: Array<UInt8>, targetLength: Int64) {
    let dstHandler = acquireArrayRawData(originalData)
    let ret = CJ_fix_to_utf8(dstHandler.pointer, originalData.size)
    releaseArrayRawData(dstHandler)
    if (ret != targetLength) {
        throw Exception("fixed length mismatch")
    }
    if (originalData != targetData) {
        throw Exception("fixed data mismatch")
    }
}

unsafe main() {
    // 这里调用FuzzDataProvider是为了主动使用fuzz里的API，防止CJ_fix_to_utf8未被连接
    let dp = FuzzDataProvider.withCangjieData(Array<UInt8>())

    // 测试长度为1的UTF8-String
    simpleChecker([0x31], [0x31], 1)

    // 测试长度为1、首字节是0b10xxxxxx的UTF8-String
    simpleChecker([0b10000000], [0b10000000], 0)

    // 测试长度为2、首字节是0b10xxxxxx、且触发非法范围修复的UTF8-String
    simpleChecker([0b10000000, 0x80], [0b11000010, 0x80], 2)

    // 测试长度为2、首字节是0b10xxxxxx、且数值范围合理的UTF8-String
    simpleChecker([0b10111111, 0x80], [0b11011111, 0x80], 2)

    // 测试长度为2、首字节是0b110xxxxx、且触发非法范围修复的UTF8-String
    simpleChecker([0b11000000, 0x80], [0b11000010, 0x80], 2)

    // 测试长度为2、首字节是0b110xxxxx、且数值范围合理的UTF8-String
    simpleChecker([0b11011111, 0x80], [0b11011111, 0x80], 2)

    // 测试长度为1、首字节是0b1110xxxx的UTF8-String
    simpleChecker([0b11100000], [0b11100000], 0)

    // 测试长度为2、首字节是0b1110xxxx的UTF8-String
    simpleChecker([0b11100000, 0b10000000], [0b11100000, 0b10000000], 0)

    // 测试长度为3、首字节是0b1110xxxx、且触发非法范围修复的UTF8-String
    simpleChecker([0b11100000, 0b10000000, 0b10000000], [0b11100000, 0b10100000, 0b10000000], 3)

    // 测试长度为3、首字节是0b1110xxxx、且触发非法范围修复的UTF8-String
    simpleChecker([0b11101101, 0b10100000, 0b10000000], [0b11101101, 0b10000000, 0b10000000], 3)

    // 测试长度为3、首字节是0b1110xxxx、且数值范围合理的UTF8-String
    simpleChecker([0b11100000, 0b10111111, 0b10111111], [0b11100000, 0b10111111, 0b10111111], 3)

    // 测试长度为1、首字节是0b11110xxx的UTF8-String
    simpleChecker([0b11110000], [0b11110000], 0)

    // 测试长度为2、首字节是0b11110xxx的UTF8-String
    simpleChecker([0b11110000, 0b10000000], [0b11110000, 0b10000000], 0)

    // 测试长度为3、首字节是0b11110xxx的UTF8-String
    simpleChecker([0b11110000, 0b10000000, 0b10000000], [0b11110000, 0b10000000, 0b10000000], 0)

    // 测试长度为4、首字节是0b11110xxx的、且触发非法范围修复的UTF8-String
    simpleChecker([0b11110111, 0b10000000, 0b10000000, 0b10000000], [0b11110011, 0b10000000, 0b10000000, 0b10000000], 4)

    // 测试长度为4、首字节是0b11110xxx的、且触发非法范围修复的UTF8-String
    simpleChecker([0b11110000, 0b10000000, 0b10000000, 0b10000000], [0b11110000, 0b10010000, 0b10000000, 0b10000000], 4)

    // 测试长度为4、首字节是0b11110xxx的、且触发非法范围修复的UTF8-String
    simpleChecker([0b11110100, 0b10110000, 0b10000000, 0b10000000], [0b11110100, 0b10000000, 0b10000000, 0b10000000], 4)

    // 测试长度为4、首字节是0b11110xxx的、且数值范围合理的UTF8-String
    simpleChecker([0b11110011, 0b10000000, 0b10000000, 0b10000000], [0b11110011, 0b10000000, 0b10000000, 0b10000000], 4)

    return 0
}
