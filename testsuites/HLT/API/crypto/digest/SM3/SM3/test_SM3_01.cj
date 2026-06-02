/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl  %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.crypto.digest.*
import std.convert.*
import std.crypto.digest.*
import stdx.encoding.hex.*

@Test
class Test_SM3_01 {
    @TestCase
    func test_digest_case01(): Unit {
        let str1 = "你好"
        let str2 = "hello"
        let toArr = str1.toArray()
        var sm3Instance = SM3()
        sm3Instance.write(str2.toArray())
        var md: Array<Byte> = digest(sm3Instance, toArr)
        var result: String = toHexString(md)
        @Expect(result, "78e5c78c5322ca174089e58dc7790acf8ce9d542bee6ae4a5a0797d5e356be61")
    }

    @TestCase
    func test_digest_case02(): Unit {
        let str1 = "你好"
        let str2 = "hello"
        let toArr = str1.toArray()
        var sm3Instance = SM3()
        sm3Instance.write(str2.toArray())
        var stepMd = sm3Instance.finish()
        var result1 = toHexString(stepMd)
        @Expect(result1, "becbbfaae6548b8bf0cfcad5a27183cd1be6093b1cceccc303d9c61d0a645268")

        var md: Array<Byte> = digest(sm3Instance, toArr)
        var result2: String = toHexString(md)
        @Expect(result2, "78e5c78c5322ca174089e58dc7790acf8ce9d542bee6ae4a5a0797d5e356be61")
    }

    @TestCase
    func test_digest_case03(): Unit {
        let str1 = "你好"
        let str2 = "hello"
        let toArr = str1.toArray()
        var sm3Instance = SM3()
        sm3Instance.write(str2.toArray())
        var stepMd = sm3Instance.finish()
        var result1 = toHexString(stepMd)
        sm3Instance.reset()
        @Expect(result1, "becbbfaae6548b8bf0cfcad5a27183cd1be6093b1cceccc303d9c61d0a645268")

        var md: Array<Byte> = digest(sm3Instance, toArr)
        var result2: String = toHexString(md)
        @Expect(result2, "78e5c78c5322ca174089e58dc7790acf8ce9d542bee6ae4a5a0797d5e356be61")
    }

    @TestCase
    func test() {
        for (_ in 0..100000) {
            call_crypto_sm3()
        }
    }
    func call_crypto_sm3(): Unit {
        let sm_3 = SM3()
        for (_ in 0..10) {
            sm_3.write([1, 2, 3, 4, 5, 6, 7, 8, 9, 0])
        }
        sm_3.finish()
        sm_3.reset()
    }
}
