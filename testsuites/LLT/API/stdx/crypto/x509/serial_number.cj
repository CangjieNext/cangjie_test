/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./files
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.fs.File
import stdx.crypto.x509.*
import stdx.crypto.crypto.*

@Test
class Test_SerialNumber {
    @TestCase
    func create_01(): Unit {
        var serialNumber = SerialNumber()
        println(serialNumber)
        println(serialNumber.hashCode())
    }

    @TestCase
    // serialNumber length illegal
    func create_error_01(): Unit {
        try {
            var serialNumber = SerialNumber(length: 0)
            println(serialNumber)
        } catch (e: Exception) {
            @Expect(e.message.contains("Certificate serial number must contain at least 1 byte"))
            println(e.message)
        }
    }

    @TestCase
    // serialNumber length illegal
    func create_error_02(): Unit {
        try {
            var serialNumber = SerialNumber(length: 30)
            println(serialNumber)
        } catch (e: Exception) {
            @Expect(e.message.contains("Certificate serial number should not exceed 20 bytes"))
            println(e.message)
        }
    }

    @TestCase
    func create_operator(): Unit {
        @Expect(SerialNumber(length:10) != SerialNumber(length:12))
    }
}
