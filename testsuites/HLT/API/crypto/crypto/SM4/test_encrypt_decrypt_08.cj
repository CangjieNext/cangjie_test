/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt  %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.crypto.crypto.*
import stdx.crypto.digest.*
import stdx.encoding.base64.toBase64String
import stdx.encoding.base64.*

@Test
class Test_encrypt_decrypt_08 {
    func test_func_sm4_01(cipher: SM4, input: String): Unit {
        let sm4 = cipher
        var enR = sm4.encrypt(input.toArray())
        var re = sm4.decrypt(enR)
        var enRResult = Array<Byte>(input.size + sm4.blockSize * 8, repeat: 0)
        var enRSize = sm4.encrypt(input.toArray(), to: enRResult)
        var reResult = Array<Byte>(input.size, repeat: 0)
        var reSize = sm4.decrypt(enRResult[0..enRSize], to: reResult)
        @Expect(String.fromUtf8(re), input)
        @Expect(String.fromUtf8(reResult[0..reSize]), input)
        @Expect(cipher.algorithm, "SM4")
    }
    @TestCase
    func test_sm4_01(): Unit {
        var key = "0987654321123456"
        var iv = "0987654321123456"
        var aad = "Additional authenticated data."
        test_func_sm4_01(SM4(OperationMode.ECB, key.toArray()), "")
        test_func_sm4_01(SM4(OperationMode.ECB, key.toArray()), "hello cangjie!")
        test_func_sm4_01(SM4(OperationMode.CBC, key.toArray(), iv: iv.toArray()), "")
        test_func_sm4_01(SM4(OperationMode.CBC, key.toArray(), iv: iv.toArray()), "hello cangjie!")
        test_func_sm4_01(SM4(OperationMode.OFB, key.toArray(), iv: iv.toArray()), "")
        test_func_sm4_01(SM4(OperationMode.OFB, key.toArray(), iv: iv.toArray()), "hello cangjie!")
        test_func_sm4_01(SM4(OperationMode.CFB, key.toArray(), iv: iv.toArray()), "")
        test_func_sm4_01(SM4(OperationMode.CFB, key.toArray(), iv: iv.toArray()), "hello cangjie!")

        test_func_sm4_01(SM4(OperationMode.CTR, key.toArray(), iv: iv.toArray()), "")
        test_func_sm4_01(SM4(OperationMode.CTR, key.toArray(), iv: iv.toArray()), "hello cangjie!")
    }

    @TestCase
    func test_sm4_02(): Unit {
        var key = "中文"
        var iv = "1653627"
        var aad = "Additional authenticated data."
        let e = @AssertThrows[CryptoException](test_func_sm4_01(SM4(OperationMode.ECB, key.toArray()), ""))
        @Expect(e.message, "Invalid key size.")
    }
}
