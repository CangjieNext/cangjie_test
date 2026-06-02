/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl  %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 

import stdx.crypto.crypto.*
import stdx.crypto.digest.*
import stdx.encoding.base64.toBase64String
import stdx.encoding.base64.*

@Test
class Test_encrypt_decrypt_array_05 {
    func func_encrypt_decrypt_array(cipher: SM4, input: String): Unit {
        let sm4 = cipher
        var enR = sm4.encrypt(input.toArray())
        var re = sm4.decrypt(enR)
        @Expect(String.fromUtf8(re), input)
    }

    func func_encrypt_decrypt_array_1(cipher: SM4, expect: String): Unit {
        var input = "+37853+iouwjiqd$21904"
        let sm4 = cipher
        var enR = sm4.encrypt(input.toArray())
        @Expect(toBase64String(enR), expect)
        var re = sm4.decrypt(enR)
        @Expect(String.fromUtf8(re), input)
    }

    @TestCase
    func test_encrypt_decrypt_array_OFB_01(): Unit {
        let sm4_1 = SM4(OperationMode.OFB, '1234567891234567'.toArray(), iv: '1234567891234567'.toArray(),
            paddingMode: PaddingMode.PKCS7Padding)
        let sm4_2 = SM4(OperationMode.OFB, '1234567891234567'.toArray(), iv: '1234567891234567'.toArray(),
            paddingMode: PaddingMode.PKCS7Padding, tagSize: 12)
        let long_string = StringBuilder(r'a', 100000).toString()
        func_encrypt_decrypt_array(sm4_1, "")
        func_encrypt_decrypt_array(sm4_1, "\0")
        func_encrypt_decrypt_array(sm4_1, "1234567")
        func_encrypt_decrypt_array(sm4_1, "cangjietest")
        func_encrypt_decrypt_array(sm4_1, "#&^31273284dxhye23814873")
        func_encrypt_decrypt_array(sm4_1, long_string)
        func_encrypt_decrypt_array(sm4_2, "")
        func_encrypt_decrypt_array(sm4_2, "\0")
        func_encrypt_decrypt_array(sm4_2, "1234567")
        func_encrypt_decrypt_array(sm4_2, "cangjietest")
        func_encrypt_decrypt_array(sm4_2, "#&^31273284dxhye23814873")
        func_encrypt_decrypt_array(sm4_2, long_string)
    }

    @TestCase
    func test_encrypt_decrypt_array_OFB_02(): Unit {
        let sm4_1 = SM4(OperationMode.OFB, '1234567891234567'.toArray(), iv: '1234567891234567'.toArray(),
            paddingMode: PaddingMode.PKCS7Padding)
        let sm4_2 = SM4(OperationMode.OFB, '1234567891234567'.toArray(), iv: '1234567891234567'.toArray(),
            paddingMode: PaddingMode.PKCS7Padding, tagSize: 12)
        let sm4_3 = SM4(OperationMode.OFB, '1234567891234567'.toArray(), iv: '1234567891234568'.toArray(),
            paddingMode: PaddingMode.PKCS7Padding, tagSize: 12)
        func_encrypt_decrypt_array_1(sm4_1, "zw1Hb1umbn40O+aUczzHzK5HSwls")
        func_encrypt_decrypt_array_1(sm4_2, "zw1Hb1umbn40O+aUczzHzK5HSwls")
        func_encrypt_decrypt_array_1(sm4_3, "YvGuT6B5oXb2P+QzhYNd853SZNqs")
    }

    @TestCase
    func test_encrypt_decrypt_array_CFB_03(): Unit {
        let sm4_1 = SM4(OperationMode.CFB, '1234567891234567'.toArray(), iv: '1234567891234567'.toArray(),
            paddingMode: PaddingMode.PKCS7Padding)
        let sm4_2 = SM4(OperationMode.CFB, '1234567891234567'.toArray(), iv: '1234567891234567'.toArray(),
            paddingMode: PaddingMode.PKCS7Padding, tagSize: 12)
        let long_string = StringBuilder(r'a', 100000).toString()
        func_encrypt_decrypt_array(sm4_1, "")
        func_encrypt_decrypt_array(sm4_1, "\0")
        func_encrypt_decrypt_array(sm4_1, "1234567")
        func_encrypt_decrypt_array(sm4_1, "cangjietest")
        func_encrypt_decrypt_array(sm4_1, "#&^31273284dxhye23814873")
        func_encrypt_decrypt_array(sm4_1, long_string)
        func_encrypt_decrypt_array(sm4_2, "")
        func_encrypt_decrypt_array(sm4_2, "\0")
        func_encrypt_decrypt_array(sm4_2, "1234567")
        func_encrypt_decrypt_array(sm4_2, "cangjietest")
        func_encrypt_decrypt_array(sm4_2, "#&^31273284dxhye23814873")
        func_encrypt_decrypt_array(sm4_2, long_string)
    }

    @TestCase
    func test_encrypt_decrypt_array_CFB_04(): Unit {
        let sm4_1 = SM4(OperationMode.CFB, '1234567891234567'.toArray(), iv: '1234567891234567'.toArray(),
            paddingMode: PaddingMode.PKCS7Padding)
        let sm4_2 = SM4(OperationMode.CFB, '1234567891234567'.toArray(), iv: '1234567891234567'.toArray(),
            paddingMode: PaddingMode.PKCS7Padding, tagSize: 12)
        let sm4_3 = SM4(OperationMode.CFB, '1234567891234567'.toArray(), iv: '1234567891234568'.toArray(),
            paddingMode: PaddingMode.PKCS7Padding, tagSize: 12)
        func_encrypt_decrypt_array_1(sm4_1, "zw1Hb1umbn40O+aUczzHzMJ7c1ER")
        func_encrypt_decrypt_array_1(sm4_2, "zw1Hb1umbn40O+aUczzHzMJ7c1ER")
        func_encrypt_decrypt_array_1(sm4_3, "YvGuT6B5oXb2P+QzhYNd804CSk2C")
    }

    @TestCase
    func test_encrypt_decrypt_array_CTR_05(): Unit {
        let sm4_1 = SM4(OperationMode.CTR, '1234567891234567'.toArray(), iv: '1234567891234567'.toArray(),
            paddingMode: PaddingMode.PKCS7Padding)
        let sm4_2 = SM4(OperationMode.CTR, '1234567891234567'.toArray(), iv: '1234567891234567'.toArray(),
            paddingMode: PaddingMode.PKCS7Padding, tagSize: 12)
        let long_string = StringBuilder(r'a', 100000).toString()
        func_encrypt_decrypt_array(sm4_1, "")
        func_encrypt_decrypt_array(sm4_1, "\0")
        func_encrypt_decrypt_array(sm4_1, "1234567")
        func_encrypt_decrypt_array(sm4_1, "cangjietest")
        func_encrypt_decrypt_array(sm4_1, "#&^31273284dxhye23814873")
        func_encrypt_decrypt_array(sm4_1, long_string)
        func_encrypt_decrypt_array(sm4_2, "")
        func_encrypt_decrypt_array(sm4_2, "\0")
        func_encrypt_decrypt_array(sm4_2, "1234567")
        func_encrypt_decrypt_array(sm4_2, "cangjietest")
        func_encrypt_decrypt_array(sm4_2, "#&^31273284dxhye23814873")
        func_encrypt_decrypt_array(sm4_2, long_string)
    }

    @TestCase
    func test_encrypt_decrypt_array_CTR_06(): Unit {
        let sm4_1 = SM4(OperationMode.CTR, '1234567891234567'.toArray(), iv: '1234567891234567'.toArray(),
            paddingMode: PaddingMode.PKCS7Padding)
        let sm4_2 = SM4(OperationMode.CTR, '1234567891234567'.toArray(), iv: '1234567891234567'.toArray(),
            paddingMode: PaddingMode.PKCS7Padding, tagSize: 12)
        let sm4_3 = SM4(OperationMode.CTR, '1234567891234567'.toArray(), iv: '1234567891234568'.toArray(),
            paddingMode: PaddingMode.PKCS7Padding, tagSize: 12)
        func_encrypt_decrypt_array_1(sm4_1, "zw1Hb1umbn40O+aUczzHzHvzoEeh")
        func_encrypt_decrypt_array_1(sm4_2, "zw1Hb1umbn40O+aUczzHzHvzoEeh")
        func_encrypt_decrypt_array_1(sm4_3, "YvGuT6B5oXb2P+QzhYNd86vzBM4M")
    }
}
