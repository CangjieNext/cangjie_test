/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt  -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.crypto.digest.*
import std.convert.*
import std.crypto.digest.*
import stdx.crypto.common.*
import stdx.encoding.hex.*
import std.runtime.*
import std.io.*

@Test
class Test_digest {
    func test_func_digest_01(d: Digest, expect: String): Unit {
        let str: String = "dGhlIHNhbXBsZSBub25jZQ==258EAFA5-E914-47DA-95CA-C5AB0DC85B11"
        let digestInstance = d
        let md: Array<Byte> = digest(digestInstance, str.toArray())
        let result: String = toHexString(md)
        @Assert(result, expect)
    }

    func test_func_digest_02(d: Digest, expect: String): Unit {
        let str: String = "helloworld"
        let digestInstance = d
        let md: Array<Byte> = digest(digestInstance, str.toArray())
        let result: String = toHexString(md)
        @Assert(result, expect)
    }

    func test_func_digest_03(d: Digest): Unit {
        let str: String = "helloworld"
        let digestInstance = d
        digest(digestInstance, str.toArray())
        var num = 0
        try {
            digestInstance.finish()
        } catch (e: CryptoException) {
            num++
        }
        digest(digestInstance, str.toArray())
        try {
            digestInstance.write(str.toArray())
        } catch (e: CryptoException) {
            num++
        }
        @Assert(num, 0)
    }

    func test_func_digest_write_finish(d: Digest, expect: String): Unit {
        let str: String = "helloworld"
        let digestInstance = d
        digestInstance.write(str.toArray())
        let md: Array<Byte> = digestInstance.finish()
        let result: String = toHexString(md)
        @Assert(result, expect)
    }

    func test_digest_concat(d: Digest): Unit {
        let str1: String = "hello"
        let str2: String = "world"
        let str3: String = "helloworld"
        let digestInstance = d

        digestInstance.write(str1.toArray())
        digestInstance.write(str2.toArray())
        var md = digestInstance.finish()
        let result1: String = toHexString(md)

        digestInstance.reset()
        digestInstance.write(str3.toArray())
        md = digestInstance.finish()
        let result2 = toHexString(md)

        @Assert(result1, result2)
    }

    func test_digest_length_size(d: Digest, lenExpect: Int64, sizeExpect: Int64): Unit {
        var digestInstance = d
        var digestLength: Int64 = digestInstance.size
        var blockSize: Int64 = digestInstance.blockSize
        @Assert(digestLength, lenExpect)
        @Assert(blockSize, sizeExpect)
    }

    func test_digest_error(d: Digest, name: String): Unit {
        let str: String = "hello"
        let digestInstance = d
        digestInstance.write(str.toArray())
        digestInstance.finish()
        var num = 0
        try {
            digestInstance.write(str.toArray())
        } catch (e: CryptoException) {
            @Assert(e.message, name+" write failed, digest calculation has been completed.")
            num++
        }
        try {
            digestInstance.finish()
        } catch (e: CryptoException) {
            @Assert(e.message, name+" finish failed, digest calculation has been completed.")
            num++
        }
        digestInstance.reset()
        digestInstance.write(str.toArray())
        var md: Array<Byte> = Array<Byte>(digestInstance.size + 128, repeat: 0)
        try {
            digestInstance.finish(to: md)
        } catch (e: CryptoException) {
            @Assert(e.message, "The length of output is not equal to the digest length.")
            num++
        }
        @Assert(num, 3)
    }

    func test_digest_empty(d: Digest, expect: String): Unit {
        let digestInstance = d
        var md = digestInstance.finish()
        let result: String = toHexString(md)
        @Assert(result, expect)
    }

    func test_func_digest_InputStream(d: Digest, expect: String): Unit {
        let str: String = "dGhlIHNhbXBsZSBub25jZQ==258EAFA5-E914-47DA-95CA-C5AB0DC85B11dGhlIHNhbXBsZSBub25jZQ==258EAFA5-E914-47DA-95CA-C5AB0DC85B11hlIHNhbXBsZSBub25jZQ==258EAFA5-E914-47DA-95CA-C5AB0DdGhlIHNhbXBsZSBub25jZQ==258EAFA5-E914-47DA-95CA-C5AB0DC85B11dGhlIHNhbXBsZSBub25jZQ==258EAFA5-E914-47DA-95CA-C5AB0DC85B11hlIHNhbXBsZSBub25jZQ==258EAFA5-E914-47DA-95CA-C5AB0DdGhlIHNhbXBsZSBub25jZQ==258EAFA5-E914-47DA-95CA-C5AB0DC85B11dGhlIHNhbXBsZSBub25jZQ==258EAFA5-E914-47DA-95CA-C5AB0DC85B11hlIHNhbXBsZSBub25jZQ==258EAFA5-E914-47DA-95CA-C5AB0DdGhlIHNhbXBsZSBub25jZQ==258EAFA5-E914-47DA-95CA-C5AB0DC85B11dGhlIHNhbXBsZSBub25jZQ==258EAFA5-E914-47DA-95CA-C5AB0DC85B11hlIHNhbXBsZSBub25jZQ==258EAFA5-E914-47DA-95CA-C5AB0D"
        var inputStream: ByteBuffer = ByteBuffer(str.toArray())
        let digestInstance = d
        let md: Array<Byte> = digest(digestInstance, inputStream)
        let result: String = toHexString(md)
        @Assert(result, expect)
    }
    func test_func_digest_write_finishTo(d: Digest, expect: String): Unit {
        let str: String = "helloworld"
        let digestInstance = d
        var md: Array<Byte> = Array<Byte>(digestInstance.size, repeat: 0)
        digestInstance.write(str.toArray())
        digestInstance.finish(to: md)
        let result: String = toHexString(md)
        @Assert(result, expect)
    }

    func test_func_digest_algorithm(d: Digest, expect: String): Unit {
        @Assert(d.algorithm, expect)
    }

    @TestCase
    func test_digest_01(): Unit {
        test_func_digest_01(MD5(), "7c8fc5f79a451f251ac771cbb7492d99")
        test_func_digest_01(SHA1(), "b37a4f2cc0624f1690f64606cf385945b2bec4ea")
        test_func_digest_01(SHA224(), "05dd15d0235d6b7acf772cc5a7d004f52d39e5ae1468793cd31ef023")
        test_func_digest_01(SHA256(), "73ca9e0b1c01f2c24fc6449c91e2fbe9b28bedfeb8dbe298cc3891ec46cac936")
        test_func_digest_01(SHA384(),
            "7054888fe9105108a5da3ed980ce5113e16b718f42ae6566df481c8fd928164a0fdb2a52a992cda99ce3fb1393e56b32")
        test_func_digest_01(
            SHA512(),
            "e080656383081f69081b4425d704ef11b9dbb9e414dd05689192cc9cf4646756b32a9e9a76c0b577584041aec21b4d2fa8600303213a43e741d94675ab270261"
        )
        test_func_digest_01(SM3(), "9d44a486bfce3c10edebed95fcf56afcd7e538b5d10dc3abff3d1ddaed19487b")
    }

    @TestCase
    func test_digest_02(): Unit {
        test_func_digest_02(MD5(), "fc5e038d38a57032085441e7fe7010b0")
        test_func_digest_02(SHA1(), "6adfb183a4a2c94a2f92dab5ade762a47889a5a1")
        test_func_digest_02(SHA224(), "b033d770602994efa135c5248af300d81567ad5b59cec4bccbf15bcc")
        test_func_digest_02(SHA256(), "936a185caaa266bb9cbe981e9e05cb78cd732b0b3280eb944412bb6f8f8f07af")
        test_func_digest_02(SHA384(),
            "97982a5b1414b9078103a1c008c4e3526c27b41cdbcf80790560a40f2a9bf2ed4427ab1428789915ed4b3dc07c454bd9")
        test_func_digest_02(
            SHA512(),
            "1594244d52f2d8c12b142bb61f47bc2eaf503d6d9ca8480cae9fcf112f66e4967dc5e8fa98285e36db8af1b8ffa8b84cb15e0fbcf836c3deb803c13f37659a60"
        )
        test_func_digest_02(SM3(), "c70c5f73da4e8b8b73478af54241469566f6497e16c053a03a0170fa00078283")
    }

    @TestCase
    func test_digest_03(): Unit {
        test_func_digest_write_finish(MD5(), "fc5e038d38a57032085441e7fe7010b0")
        test_func_digest_write_finish(SHA1(), "6adfb183a4a2c94a2f92dab5ade762a47889a5a1")
        test_func_digest_write_finish(SHA224(), "b033d770602994efa135c5248af300d81567ad5b59cec4bccbf15bcc")
        test_func_digest_write_finish(SHA256(), "936a185caaa266bb9cbe981e9e05cb78cd732b0b3280eb944412bb6f8f8f07af")
        test_func_digest_write_finish(SHA384(),
            "97982a5b1414b9078103a1c008c4e3526c27b41cdbcf80790560a40f2a9bf2ed4427ab1428789915ed4b3dc07c454bd9")
        test_func_digest_write_finish(
            SHA512(),
            "1594244d52f2d8c12b142bb61f47bc2eaf503d6d9ca8480cae9fcf112f66e4967dc5e8fa98285e36db8af1b8ffa8b84cb15e0fbcf836c3deb803c13f37659a60"
        )
        test_func_digest_write_finish(SM3(), "c70c5f73da4e8b8b73478af54241469566f6497e16c053a03a0170fa00078283")
        test_func_digest_write_finish(
            HMAC("cangjie".toArray(), HashType.SHA512),
            "931440143c3fbe71e591b3009bf84ddf7ac9df69c3121269a22c7c4d5c7d8e9581c85ad0436603d6c940006fcee221f840e95a6e92df1a6a0a8b724c1a9e9caf"
        )
        test_func_digest_write_finish(
            HMAC("cangjie".toArray(), {=> SHA512()}),
            "931440143c3fbe71e591b3009bf84ddf7ac9df69c3121269a22c7c4d5c7d8e9581c85ad0436603d6c940006fcee221f840e95a6e92df1a6a0a8b724c1a9e9caf"
        )
    }

    @TestCase[d in [ MD5(), SHA1(), SHA224(), SHA256(), SHA384(), SHA512(), SM3() ]]
    func test_digest_04(d: Digest): Unit {
        test_digest_concat(d)
    }

    @TestCase
    func test_digest_05(): Unit {
        test_digest_length_size(MD5(), 16, 64)
        test_digest_length_size(SHA1(), 20, 64)
        test_digest_length_size(SHA224(), 28, 64)
        test_digest_length_size(SHA256(), 32, 64)
        test_digest_length_size(SHA384(), 48, 128)
        test_digest_length_size(SHA512(), 64, 128)
        test_digest_length_size(SM3(), 32, 64)
    }

    @TestCase
    func test_digest_06(): Unit {
        test_digest_error(MD5(), "MD5")
        test_digest_error(SHA1(), "SHA1")
        test_digest_error(SHA224(), "SHA224")
        test_digest_error(SHA256(), "SHA256")
        test_digest_error(SHA384(), "SHA384")
        test_digest_error(SHA512(), "SHA512")
        test_digest_error(SM3(), "SM3")
    }
    @TestCase
    func test_digest_07(): Unit {
        test_func_digest_03(MD5())
        test_func_digest_03(SHA1())
        test_func_digest_03(SHA224())
        test_func_digest_03(SHA256())
        test_func_digest_03(SHA384())
        test_func_digest_03(SHA512())
        test_func_digest_03(SM3())
    }

    @TestCase
    func test_digest_InputStream(): Unit {
        test_func_digest_InputStream(MD5(), "154681576fc1e6b269618dcfc186e500")
        test_func_digest_InputStream(SHA1(), "5ee25ecc514a1587305bf49086146eff582da430")
        test_func_digest_InputStream(SHA224(), "dc9078985cdd8f5877cc9725aff7efee98794caecaf0ff26ec2d91ed")
        test_func_digest_InputStream(SHA256(), "2a5aca1db811e4e14f189132ba7d7cf12d0147d023ef3f19fee2dd588f5fde59")
        test_func_digest_InputStream(SHA384(),
            "766465b8892935fb929f3e698251e7ac5874fde5a4bd476383db1721a69f05b9c7e8178584722baf5aad92d635a4ed5a")
        test_func_digest_InputStream(
            SHA512(),
            "fdc24a8d2a7481f21c0e33ce68e4ca8a8f752d6f08a4a0d6a52f22c04062fc508ea71e2b862f13eb9e1eb56d66a29fdc13d003fec112b8e448c848f6ddb02d89"
        )
        test_func_digest_InputStream(SM3(), "4faba386c969c0daf4859c50b4ec4a93adb8d4c77c8786825bebce8bf28ef584")
        test_func_digest_InputStream(HMAC("cangjie".toArray(), HashType.MD5), "bba5cc4c5192c3e31358f6eb2875ee40")
        test_func_digest_InputStream(HMAC("cangjie".toArray(), HashType.SHA1),
            "0d85071aadcda5935a1684753c9409ef70a947b6")
        test_func_digest_InputStream(HMAC("cangjie".toArray(), HashType.SHA224),
            "7e2a8038f460862645664200f162301de6daccf14b8be2af0d3a3809")
        test_func_digest_InputStream(HMAC("cangjie".toArray(), HashType.SHA256),
            "833b9056f58187a79e38c81166ca22dc8e952e886571f81142e631c3c4ee7530")
        test_func_digest_InputStream(HMAC("cangjie".toArray(), HashType.SHA384),
            "d347fcf308f9feb92f4b54f7be24412fe635f4c8c13ec94358b1ce45f4b43262725933912b39f6886efd05a55d0f7064")
        test_func_digest_InputStream(HMAC("cangjie".toArray(), HashType.SHA512),
            "5a52d13a702a86a977f2a16912fd7b50dac52e636d92d04bfaab7216f34bf675d09826aa8f61bd36ec3067b05f08e598e33c90acf49778eb035ac2524b5b0154")
    }

    @TestCase
    func test_digest_finish(): Unit {
        test_func_digest_write_finishTo(MD5(), "fc5e038d38a57032085441e7fe7010b0")
        test_func_digest_write_finishTo(SHA1(), "6adfb183a4a2c94a2f92dab5ade762a47889a5a1")
        test_func_digest_write_finishTo(SHA224(), "b033d770602994efa135c5248af300d81567ad5b59cec4bccbf15bcc")
        test_func_digest_write_finishTo(SHA256(), "936a185caaa266bb9cbe981e9e05cb78cd732b0b3280eb944412bb6f8f8f07af")
        test_func_digest_write_finishTo(SHA384(),
            "97982a5b1414b9078103a1c008c4e3526c27b41cdbcf80790560a40f2a9bf2ed4427ab1428789915ed4b3dc07c454bd9")
        test_func_digest_write_finishTo(
            SHA512(),
            "1594244d52f2d8c12b142bb61f47bc2eaf503d6d9ca8480cae9fcf112f66e4967dc5e8fa98285e36db8af1b8ffa8b84cb15e0fbcf836c3deb803c13f37659a60"
        )
        test_func_digest_write_finishTo(SM3(), "c70c5f73da4e8b8b73478af54241469566f6497e16c053a03a0170fa00078283")
        test_func_digest_write_finishTo(
            HMAC("cangjie".toArray(), HashType.SHA512),
            "931440143c3fbe71e591b3009bf84ddf7ac9df69c3121269a22c7c4d5c7d8e9581c85ad0436603d6c940006fcee221f840e95a6e92df1a6a0a8b724c1a9e9caf"
        )
        test_func_digest_write_finishTo(
            HMAC("cangjie".toArray(), {=> SHA512()}),
            "931440143c3fbe71e591b3009bf84ddf7ac9df69c3121269a22c7c4d5c7d8e9581c85ad0436603d6c940006fcee221f840e95a6e92df1a6a0a8b724c1a9e9caf"
        )
    }

    @TestCase
    func test_digest_algorithm(): Unit {
        test_func_digest_algorithm(MD5(), "MD5")
        test_func_digest_algorithm(SHA1(), "SHA1")
        test_func_digest_algorithm(SHA224(), "SHA224")
        test_func_digest_algorithm(SHA256(), "SHA256")
        test_func_digest_algorithm(SHA384(), "SHA384")
        test_func_digest_algorithm(SHA512(), "SHA512")
        test_func_digest_algorithm(SM3(), "SM3")
        test_func_digest_algorithm(HMAC("cangjie".toArray(), HashType.SHA512), "HMAC-SHA512")
        test_func_digest_algorithm(HMAC("cangjie".toArray(), {=> SHA512()}), "HMAC-SHA512")
        test_func_digest_algorithm(HMAC("cangjie".toArray(), HashType.MD5), "HMAC-MD5")
        test_func_digest_algorithm(HMAC("cangjie".toArray(), {=> SHA256()}), "HMAC-SHA256")
        test_func_digest_algorithm(HMAC("cangjie".toArray(), HashType.SHA384), "HMAC-SHA384")
        test_func_digest_algorithm(HMAC("cangjie".toArray(), {=> SHA1()}), "HMAC-SHA1")
    }
    @TestCase
    func test_digest_empty(): Unit {
        test_digest_empty(MD5(), "d41d8cd98f00b204e9800998ecf8427e")
        test_digest_empty(SHA1(), "da39a3ee5e6b4b0d3255bfef95601890afd80709")
        test_digest_empty(SHA224(), "d14a028c2a3a2bc9476102bb288234c415a2b01f828ea62ac5b3e42f")
        test_digest_empty(SHA256(), "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
        test_digest_empty(SHA384(),
            "38b060a751ac96384cd9327eb1b1e36a21fdb71114be07434c0cc7bf63f6e1da274edebfe76f65fbd51ad2f14898b95b")
        test_digest_empty(
            SHA512(),
            "cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e"
        )
        test_digest_empty(SM3(), "1ab21d8355cfa17f8e61194831e81a8f22bec8c728fefb747ed035eb5082aa2b")
    }

    @TestCase
    func test_digest_01_HMAC(): Unit {
        test_func_digest_01(
            HMAC("cangjie".toArray(), HashType.SHA512),
            "0e5cf680bcf2826061c2d4bf4a93bf9984fe6ba907ee7a29dc7680fc6c7bd3e7e55d4c0803479bdc57fd770786ceb960959c0ff63bb618995e0c81954d39532c"
        )
        test_func_digest_01(
            HMAC("cangjie".toArray(), {=> SHA512()}),
            "0e5cf680bcf2826061c2d4bf4a93bf9984fe6ba907ee7a29dc7680fc6c7bd3e7e55d4c0803479bdc57fd770786ceb960959c0ff63bb618995e0c81954d39532c"
        )
        test_func_digest_01(HMAC("cangjie".toArray(), HashType.SHA384),
            "b04578a2d6707a717d4c1c44aedf7d4ea1f314c6c6b33494e1c60042b96365bc6caceb316bcf1b8a5bab0ff485a1d41e")
        test_func_digest_01(HMAC("cangjie".toArray(), {=> SHA384()}),
            "b04578a2d6707a717d4c1c44aedf7d4ea1f314c6c6b33494e1c60042b96365bc6caceb316bcf1b8a5bab0ff485a1d41e")
        test_func_digest_01(HMAC("cangjie".toArray(), HashType.SHA256),
            "a632bbca845b6747ff2722b3a42d378d4ea53b50f6d50b5ed2a3519903ca696f")
        test_func_digest_01(HMAC("cangjie".toArray(), {=> SHA256()}),
            "a632bbca845b6747ff2722b3a42d378d4ea53b50f6d50b5ed2a3519903ca696f")
        test_func_digest_01(HMAC("cangjie".toArray(), HashType.SHA224),
            "c83fbda59e83856091513b73b31d33e45ce81c3e509131a23a17f6dd")
        test_func_digest_01(HMAC("cangjie".toArray(), {=> SHA224()}),
            "c83fbda59e83856091513b73b31d33e45ce81c3e509131a23a17f6dd")
        test_func_digest_01(HMAC("cangjie".toArray(), HashType.SHA1), "e80a5a494944b44a933cff4c0c36761e596c89bb")
        test_func_digest_01(HMAC("cangjie".toArray(), {=> SHA1()}), "e80a5a494944b44a933cff4c0c36761e596c89bb")
        test_func_digest_01(HMAC("cangjie".toArray(), HashType.MD5), "9d68082855c0416eefd764e9ef37d977")
        test_func_digest_01(HMAC("cangjie".toArray(), {=> MD5()}), "9d68082855c0416eefd764e9ef37d977")
        test_func_digest_01(HMAC("cangjie".toArray(), HashType.SM3),
            "03685f8011f395d36b67f76fb70a85b9a2207d47a7bfa772bf7e69aa9ef8dd68")
        test_func_digest_01(HMAC("cangjie".toArray(), {=> SM3()}),
            "03685f8011f395d36b67f76fb70a85b9a2207d47a7bfa772bf7e69aa9ef8dd68")
    }

    @TestCase
    func test_digest_02_HMAC(): Unit {
        test_func_digest_02(
            HMAC("cangjie".toArray(), HashType.SHA512),
            "931440143c3fbe71e591b3009bf84ddf7ac9df69c3121269a22c7c4d5c7d8e9581c85ad0436603d6c940006fcee221f840e95a6e92df1a6a0a8b724c1a9e9caf"
        )
        test_func_digest_02(
            HMAC("cangjie".toArray(), {=> SHA512()}),
            "931440143c3fbe71e591b3009bf84ddf7ac9df69c3121269a22c7c4d5c7d8e9581c85ad0436603d6c940006fcee221f840e95a6e92df1a6a0a8b724c1a9e9caf"
        )
        test_func_digest_02(HMAC("cangjie".toArray(), HashType.SHA384),
            "48170cfd437f158764d38877d342b9cc81d2a71918c19ab1dbafaa690634380a5099e8c3c8aaa6cacd44fb854dac4511")
        test_func_digest_02(HMAC("cangjie".toArray(), {=> SHA384()}),
            "48170cfd437f158764d38877d342b9cc81d2a71918c19ab1dbafaa690634380a5099e8c3c8aaa6cacd44fb854dac4511")
        test_func_digest_02(HMAC("cangjie".toArray(), HashType.SHA256),
            "16b6c7f5bfafb36d72cc2c6ed666ec3077ab2bfeafac027c05e864e18d4d8280")
        test_func_digest_02(HMAC("cangjie".toArray(), {=> SHA256()}),
            "16b6c7f5bfafb36d72cc2c6ed666ec3077ab2bfeafac027c05e864e18d4d8280")
        test_func_digest_02(HMAC("cangjie".toArray(), HashType.SHA224),
            "ed3dabbf45b52d256b48271ea36432f68460056ca5140b2e22890cce")
        test_func_digest_02(HMAC("cangjie".toArray(), {=> SHA224()}),
            "ed3dabbf45b52d256b48271ea36432f68460056ca5140b2e22890cce")
        test_func_digest_02(HMAC("cangjie".toArray(), HashType.SHA1), "8e5d898442981d71deb0b6c039cc55fae9f1fac6")
        test_func_digest_02(HMAC("cangjie".toArray(), {=> SHA1()}), "8e5d898442981d71deb0b6c039cc55fae9f1fac6")
        test_func_digest_02(HMAC("cangjie".toArray(), HashType.MD5), "60c641ba8c96d1cfc33ef0929bc375c9")
        test_func_digest_02(HMAC("cangjie".toArray(), {=> MD5()}), "60c641ba8c96d1cfc33ef0929bc375c9")
        test_func_digest_02(HMAC("cangjie".toArray(), HashType.SM3),
            "631e89cc637553ba4b9a28d0bc101b068129f6faba09e4691d218d642f099949")
        test_func_digest_02(HMAC("cangjie".toArray(), {=> SM3()}),
            "631e89cc637553ba4b9a28d0bc101b068129f6faba09e4691d218d642f099949")
    }

    @TestCase[d in [ HMAC("cangjie".toArray(), HashType.SHA512), HMAC("cangjie".toArray(), { => SHA512() }), HMAC("cangjie".toArray(), HashType.SHA384), HMAC("cangjie".toArray(), { => SHA384() }), 
 HMAC("cangjie".toArray(), HashType.SHA256), HMAC("cangjie".toArray(), { => SHA256() }), 
 HMAC("cangjie".toArray(), HashType.SHA224), HMAC("cangjie".toArray(), { => SHA224() }), 
 HMAC("cangjie".toArray(), HashType.SHA1), HMAC("cangjie".toArray(), { => SHA1() }), 
 HMAC("cangjie".toArray(), HashType.MD5), HMAC("cangjie".toArray(), { => MD5() }), 
 HMAC("cangjie".toArray(), HashType.SM3), HMAC("cangjie".toArray(), { => SM3() }) ]]
    func test_digest_03_HMAC(d: Digest): Unit {
        test_digest_concat(d)
    }

    @TestCase
    func test_digest_04_HMAC(): Unit {
        test_digest_length_size(HMAC("cangjie".toArray(), HashType.SHA512), 64, 128)
        test_digest_length_size(HMAC("cangjie".toArray(), {=> SHA512()}), 64, 128)
        test_digest_length_size(HMAC("cangjie".toArray(), HashType.SHA384), 48, 128)
        test_digest_length_size(HMAC("cangjie".toArray(), {=> SHA384()}), 48, 128)
        test_digest_length_size(HMAC("cangjie".toArray(), HashType.SHA256), 32, 64)
        test_digest_length_size(HMAC("cangjie".toArray(), {=> SHA256()}), 32, 64)
        test_digest_length_size(HMAC("cangjie".toArray(), HashType.SHA224), 28, 64)
        test_digest_length_size(HMAC("cangjie".toArray(), {=> SHA224()}), 28, 64)
        test_digest_length_size(HMAC("cangjie".toArray(), HashType.SHA1), 20, 64)
        test_digest_length_size(HMAC("cangjie".toArray(), {=> SHA1()}), 20, 64)
        test_digest_length_size(HMAC("cangjie".toArray(), HashType.MD5), 16, 64)
        test_digest_length_size(HMAC("cangjie".toArray(), {=> MD5()}), 16, 64)
        test_digest_length_size(HMAC("cangjie".toArray(), HashType.SM3), 32, 64)
        test_digest_length_size(HMAC("cangjie".toArray(), {=> SM3()}), 32, 64)
    }
    @TestCase
    func test_digest_5_HMAC(): Unit {
        test_digest_error(HMAC("cangjie".toArray(), HashType.SHA512), "HMAC")
        test_digest_error(HMAC("cangjie".toArray(), {=> SHA512()}), "HMAC")
        test_digest_error(HMAC("cangjie".toArray(), HashType.SHA384), "HMAC")
        test_digest_error(HMAC("cangjie".toArray(), {=> SHA384()}), "HMAC")
        test_digest_error(HMAC("cangjie".toArray(), HashType.SHA256), "HMAC")
        test_digest_error(HMAC("cangjie".toArray(), {=> SHA256()}), "HMAC")
        test_digest_error(HMAC("cangjie".toArray(), HashType.SHA224), "HMAC")
        test_digest_error(HMAC("cangjie".toArray(), {=> SHA224()}), "HMAC")
        test_digest_error(HMAC("cangjie".toArray(), HashType.SHA1), "HMAC")
        test_digest_error(HMAC("cangjie".toArray(), {=> SHA1()}), "HMAC")
        test_digest_error(HMAC("cangjie".toArray(), HashType.MD5), "HMAC")
        test_digest_error(HMAC("cangjie".toArray(), {=> MD5()}), "HMAC")
        test_digest_error(HMAC("cangjie".toArray(), HashType.SM3), "HMAC")
        test_digest_error(HMAC("cangjie".toArray(), {=> SM3()}), "HMAC")
    }

    @TestCase
    func test_digest_06_HMAC(): Unit {
        test_func_digest_03(HMAC("cangjie".toArray(), HashType.SHA512))
        test_func_digest_03(HMAC("cangjie".toArray(), {=> SHA512()}))
        test_func_digest_03(HMAC("cangjie".toArray(), HashType.SHA384))
        test_func_digest_03(HMAC("cangjie".toArray(), {=> SHA384()}))
        test_func_digest_03(HMAC("cangjie".toArray(), HashType.SHA256))
        test_func_digest_03(HMAC("cangjie".toArray(), {=> SHA256()}))
        test_func_digest_03(HMAC("cangjie".toArray(), HashType.SHA224))
        test_func_digest_03(HMAC("cangjie".toArray(), {=> SHA224()}))
        test_func_digest_03(HMAC("cangjie".toArray(), HashType.SHA1))
        test_func_digest_03(HMAC("cangjie".toArray(), {=> SHA1()}))
        test_func_digest_03(HMAC("cangjie".toArray(), HashType.MD5))
        test_func_digest_03(HMAC("cangjie".toArray(), {=> MD5()}))
        test_func_digest_03(HMAC("cangjie".toArray(), HashType.SM3))
        test_func_digest_03(HMAC("cangjie".toArray(), {=> SM3()}))
    }
    @TestCase
    func test_digest_empty_HMAC(): Unit {
        test_digest_empty(
            HMAC("cangjie".toArray(), HashType.SHA512),
            "9f2db16a60e93df5bbe22021b81018281f122c21e5d871a699953bce91fd7e59e1f0f0efd04bf5eadaafdaf8372aa6297bf3b2a51fc8f86c3e25caca0f15b5fa"
        )
        test_digest_empty(
            HMAC("cangjie".toArray(), {=> SHA512()}),
            "9f2db16a60e93df5bbe22021b81018281f122c21e5d871a699953bce91fd7e59e1f0f0efd04bf5eadaafdaf8372aa6297bf3b2a51fc8f86c3e25caca0f15b5fa"
        )
        test_digest_empty(HMAC("cangjie".toArray(), HashType.SHA384),
            "355be80734e4e66e40edf0bc7d8326bffba1847cf71db8cdc3694e3f100409ec8e1958a7d16c4d9027495674420252b7")
        test_digest_empty(HMAC("cangjie".toArray(), {=> SHA384()}),
            "355be80734e4e66e40edf0bc7d8326bffba1847cf71db8cdc3694e3f100409ec8e1958a7d16c4d9027495674420252b7")
        test_digest_empty(HMAC("cangjie".toArray(), HashType.SHA256),
            "de293164aa05290b0043c538f932876d984c41008a11626156f0a7a409c200b8")
        test_digest_empty(HMAC("cangjie".toArray(), {=> SHA256()}),
            "de293164aa05290b0043c538f932876d984c41008a11626156f0a7a409c200b8")
        test_digest_empty(HMAC("cangjie".toArray(), HashType.SHA224),
            "0f220039aa674559e50746287c3924510958a136c3729341d497be47")
        test_digest_empty(HMAC("cangjie".toArray(), {=> SHA224()}),
            "0f220039aa674559e50746287c3924510958a136c3729341d497be47")
        test_digest_empty(HMAC("cangjie".toArray(), HashType.SHA1), "9d56b9be65550f5b6049f6404d1c25ab23b126d7")
        test_digest_empty(HMAC("cangjie".toArray(), {=> SHA1()}), "9d56b9be65550f5b6049f6404d1c25ab23b126d7")
        test_digest_empty(HMAC("cangjie".toArray(), HashType.MD5), "d0a400e52d4b4beb7619792483c0d8b3")
        test_digest_empty(HMAC("cangjie".toArray(), {=> MD5()}), "d0a400e52d4b4beb7619792483c0d8b3")
        test_digest_empty(HMAC("cangjie".toArray(), HashType.SM3),
            "9d824f2d42114180ab6559707fd66354041834b91eec74dc946952ae46a0cc06")
        test_digest_empty(HMAC("cangjie".toArray(), {=> SM3()}),
            "9d824f2d42114180ab6559707fd66354041834b91eec74dc946952ae46a0cc06")
    }
}
