/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.net.*

@Test
class Test_UnixSocket {
    @TestCase
    func test_UnixSocket_init(): Unit {
        let str = "2J22!2!2-19yy2J22!2!2-19yy2J22!2!2-19yy2J22!2!2-19yy2J22!2!2-19yy2J22!2!2-19yy2J22!2!2-19yy2J22!2!2-19yy2J22!2!2-19yy2J22!2!2-19yy2J22!2!2-19yy"
        try {
            UnixSocket(str)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Path size(${str.size}) is too long") || e.message.contains("Unix domain socket path must not contain interior null bytes"))
        }
    }

    @TestCase
    func test_UnixServerSocket_init(): Unit {
        let str = "2J22!2!2-19yy2J22!2!2-19yy2J22!2!2-19yy2J22!2!2-19yy2J22!2!2-19yy2J22!2!2-19yy2J22!2!2-19yy2J22!2!2-19yy2J22!2!2-19yy2J22!2!2-19yy2J22!2!2-19yy"
        try {
            UnixServerSocket(bindAt: str)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Path size(${str.size}) is too long") || e.message.contains("Unix domain socket path must not contain interior null bytes"))
        }
    }

    @TestCase
    func test_UnixDatagramSocket_init(): Unit {
        let str = "2J22!2!2-19yy2J22!2!2-19yy2J22!2!2-19yy2J22!2!2-19yy2J22!2!2-19yy2J22!2!2-19yy2J22!2!2-19yy2J22!2!2-19yy2J22!2!2-19yy2J22!2!2-19yy2J22!2!2-19yy"
        try {
            UnixDatagramSocket(bindAt: str)
        } catch (e: IllegalArgumentException) {
            @Expect(e.message.contains("Path size(${str.size}) is too long") || e.message.contains("Unix domain socket path must not contain interior null bytes"))
        }
    }
}
