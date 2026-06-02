/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx  %cmp_opt %cmp_utest_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.net.tls.*
import stdx.crypto.x509.X509Certificate
import stdx.crypto.keys.*
import stdx.crypto.common.*

@Test
class PemHeaderTest {
    func isInvalidKey(key: String) {
        return key.contains("\n") || key.contains("\r") || key.contains("\t") || key.contains(":") || key.contains(" ") ||
            key.contains("\f") || key.contains("\v") || key.isEmpty()
    }

    @TestCase
    func noHeaders(): Unit {
        let p = single("${begin}\nabcd\n${end}")
        @Expect(p.headers.isEmpty())
    }

    @TestCase
    func noHeadersEmptyLine(): Unit {
        let p = single("${begin}\n\nabcd\n${end}")
        @Expect(p.headers.isEmpty())
    }

    @TestCase[key in random(), value in random()]
    func singleHeader(key: String, value: String): Unit {
        if (isInvalidKey(key) || isInvalidKey(value)) {
            return
        }
        let p = single("${begin}\n${key}: ${value}\n\nabcd\n${end}")
        @Expect(p.headers.size, 1)
        @Expect(p.header(key).next(), value)
    }

    @TestCase
    func singleHeader(): Unit {
        let p = single("${begin}\nA: B\n\nabcd\n${end}")
        @Expect(p.headers.size, 1)
        @Expect(p.header("A").next(), "B")
    }

    @TestCase
    func twoHeaders(): Unit {
        let p = single("${begin}\nA: B\n1: 2\n\nabcd\n${end}")
        @Expect(p.headers.size, 2)
        @Expect(p.header("A").next(), "B")
        @Expect(p.header("1").next(), "2")
    }

    @TestCase
    func twoHeadersDuplicates(): Unit {
        let p = single("${begin}\nA: B\nA: 2\n\nabcd\n${end}")
        @Expect(p.headers.size, 2)
        let items = p.header("A")
        @Expect(items.next(), "B")
        @Expect(items.next(), "2")
    }

    @TestCase[headers in random()]
    func multipleHeaders(headers: Array<String>): Unit {
        if (headers.isEmpty()) {
            return
        }

        var pemText = StringBuilder()
        pemText.append(begin)
        pemText.append('\n')
        for (header in headers) {
            if (isInvalidKey(header)) {
                return
            }
            pemText.append(header)
            pemText.append(": ")
            pemText.append(header)
            pemText.append('\n')
        }

        pemText.append("\nabcd\n")
        pemText.append(end)

        let pemTextS = pemText.toString()
        let p = single(pemTextS)

        @Expect(p.headers.size, headers.size)
        for (header in headers) {
            @Expect(p.header(header).next(), header)
        }
    }

    @TestCase
    func realExampleParseHeaders(): Unit {
        var count = 0
        for (pem in Pem.decode(rsa)) {
            @Expect("4,ENCRYPTED", pem.header("Proc-Type").next())
            @Expect("AES-256-CBC,29E44E45F1EABBBF5A867F39BE9C63F7", pem.header("DEK-Info").next())

            // encrypted size
            let size = pem.body?.size ?? 0
            @Expect(1776, size)

            count++
        }

        @Expect(1, count)
    }

    @TestCase
    func realExampleParseHeadersWithCustom(): Unit {
        for (pem in Pem.decode(rsa.replace("DEK-Info", "Custom-Header: value\nDEK-Info"))) {
            @Expect("4,ENCRYPTED", pem.header("Proc-Type").next())
            @Expect("AES-256-CBC,29E44E45F1EABBBF5A867F39BE9C63F7", pem.header("DEK-Info").next())
            @Expect("value", pem.header("Custom-Header").next())
        }
    }

    @TestCase
    func realExampleDecodeSmoke(): Unit {
        GeneralPrivateKey.decodeFromPem(rsa, password: "1234")
    }

    private func single(p: String): PemEntry {
        single(Pem.decode(p))
    }

    private func single<T>(p: Iterable<T>): T {
        let it = p.iterator()
        let first = it.next() ?? throw Exception("Expected single element but got empty")
        if (let Some(_) <- it.next()) {
            throw Exception("Expected single element but got multiple")
        }

        return first
    }

    static const begin = "-----BEGIN PRIVATE KEY-----"
    static const end = "-----END PRIVATE KEY-----"

    static const rsa = """
-----BEGIN RSA PRIVATE KEY-----
Proc-Type: 4,ENCRYPTED
DEK-Info: AES-256-CBC,29E44E45F1EABBBF5A867F39BE9C63F7

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
-----END RSA PRIVATE KEY-----
"""
}
