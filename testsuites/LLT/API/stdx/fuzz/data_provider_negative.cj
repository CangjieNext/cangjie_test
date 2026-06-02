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
import stdx.fuzz.*

main() {
    let dp1 = FuzzDataProvider.withCangjieData([0])
    dp1.consumeByte()
    try {
        dp1.consumeByte()
        return -1
    } catch (e: ExhaustedException) {
        // should reach here
    }

    let dp2 = FuzzDataProvider.withCangjieData([0])
    try {
        dp2.consumeBytes(-1)
        return -2
    } catch (e: IllegalArgumentException) {
        // should reach herea
    }
    try {
        dp2.consumeString(-1)
        return -2
    } catch (e: IllegalArgumentException) {
        // should reach here
    }
    try {
        dp2.consumeAsciiString(-1)
        return -2
    } catch (e: IllegalArgumentException) {
        // should reach here
    }
    try {
        dp2.consumeString(5548434740920451072)
        return -2
    } catch (e: Exception) {
        // should reach here
    }
    try {
        dp2.consumeBytes(999)
        return -3
    } catch (e: ExhaustedException) {
        // should reach here
    }

    let dp3 = FuzzDataProvider.withCangjieData([0x00, 0xd8, 0x00, 0x00])
    if (dp3.consumeRune() != Rune(0)) {
        return -4
    }

    let dp4 = FuzzDataProvider.withCangjieData([0x31, 0x32, 0x33])
    if (dp4.consumeAsciiString(999) != "123") {
        return -5
    }

    let dp5 = FuzzDataProvider.withCangjieData([0x31, 0x32, 0x33])
    dp5.consumeString(1)

    let dp6 = FuzzDataProvider.withCangjieData([0x31, 0x32, 0x33])
    dp6.consumeString(999)

    return 0
}
