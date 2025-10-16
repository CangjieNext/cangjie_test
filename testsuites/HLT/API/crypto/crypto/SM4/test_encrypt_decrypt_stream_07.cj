/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ./data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt  %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args 

import stdx.crypto.crypto.*
import stdx.crypto.digest.*
import stdx.crypto.common.*
import stdx.encoding.base64.toBase64String
import stdx.encoding.base64.*
import std.fs.*
import std.io.*
import stdx.encoding.hex.fromHexString
import stdx.encoding.hex.toHexString

@Test
class Test_encrypt_decrypt_stream_07 {
    func func_encrypt_decrypt_stream(cipher: SM4): Unit {
        var SM4Dfile = cipher
        var oriFileName = "./data/file.txt"
        var encResult = "./data/encresult.txt"
        var deResult = "./data/deresult.txt"

        let file = File(oriFileName, Read)
        if (exists(encResult)) {
            remove(Path(encResult))
        }
        File.create(encResult)
        @Assert(exists(encResult), true)
        let fileenc = File(encResult, ReadWrite)
        var outputStream1 = ByteBuffer()
        SM4Dfile.encrypt(file, outputStream1)
        fileenc.write(readToEnd(outputStream1))
        file.close
        fileenc.close()
        let file2 = File(encResult, Read)
        if (exists(deResult)) {
            remove(Path(deResult))
        }
        File.create(deResult)
        @Assert(exists(deResult), true)

        let filede = File(deResult, ReadWrite)
        var outputStream2 = ByteBuffer()
        SM4Dfile.decrypt(file2, outputStream2)
        filede.write(readToEnd(outputStream2))
        file2.close
        filede.close()

        let fileOr = File(oriFileName, Read)
        var input = String.fromUtf8(readToEnd(fileOr))
        fileOr.close
        let fileNew = File(deResult, Read)
        var expect = String.fromUtf8(readToEnd(fileNew))
        fileNew.close
        @Expect(input, expect)
    }

    @TestCase
    func test_encrypt_decrypt_stream_CBC_01(): Unit {
        let sm4_1 = SM4(OperationMode.CBC, '1234567891234567'.toArray(), iv: '1234567891234567'.toArray(),
            paddingMode: PaddingMode.PKCS7Padding)
        let sm4_2 = SM4(OperationMode.CBC, '1234567891234567'.toArray(), iv: '1234567891234567'.toArray(),
            paddingMode: PaddingMode.PKCS7Padding, tagSize: 12)
        let sm4_3 = SM4(OperationMode.CBC, '1234567891234567'.toArray(), iv: '1234567891234568'.toArray(),
            paddingMode: PaddingMode.PKCS7Padding, tagSize: 12)
        func_encrypt_decrypt_stream(sm4_1)
        func_encrypt_decrypt_stream(sm4_2)
        func_encrypt_decrypt_stream(sm4_3)
    }

    @TestCase
    func test_encrypt_decrypt_stream_CBC_02(): Unit {
        let sm4_1 = SM4(OperationMode.CBC, '1234567891234567'.toArray(), iv: '1234567891234567'.toArray(),
            paddingMode: PaddingMode.NoPadding)
        let sm4_2 = SM4(OperationMode.CBC, '1234567891234567'.toArray(), iv: '1234567891234567'.toArray(),
            paddingMode: PaddingMode.NoPadding, tagSize: 12)
        let e = @AssertThrows[CryptoException](func_encrypt_decrypt_stream(sm4_1))
        let e1 = @AssertThrows[CryptoException](func_encrypt_decrypt_stream(sm4_2))
        @Expect(e.message, "Encrypt failed.")
        @Expect(e1.message, "Encrypt failed.")
    }

    @TestCase
    func test_encrypt_decrypt_stream_ECB_03(): Unit {
        let sm4_1 = SM4(OperationMode.ECB, '1234567891234567'.toArray(), paddingMode: PaddingMode.PKCS7Padding)
        let sm4_2 = SM4(OperationMode.ECB, '1234567891234567'.toArray(), paddingMode: PaddingMode.PKCS7Padding,
            tagSize: 12)
        func_encrypt_decrypt_stream(sm4_1)
        func_encrypt_decrypt_stream(sm4_2)
    }

    @TestCase
    func test_encrypt_decrypt_stream_ECB_04(): Unit {
        let sm4_1 = SM4(OperationMode.ECB, '1234567891234567'.toArray(), paddingMode: PaddingMode.NoPadding)
        let sm4_2 = SM4(OperationMode.ECB, '1234567891234567'.toArray(), paddingMode: PaddingMode.NoPadding, tagSize: 12)
        let e = @AssertThrows[CryptoException](func_encrypt_decrypt_stream(sm4_1))
        let e1 = @AssertThrows[CryptoException](func_encrypt_decrypt_stream(sm4_2))
        @Expect(e.message, "Encrypt failed.")
        @Expect(e1.message, "Encrypt failed.")
    }
}
