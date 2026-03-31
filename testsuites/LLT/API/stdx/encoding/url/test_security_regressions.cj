/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC:%set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.unittest.*
import stdx.encoding.url.*

const FORM_ITEM_LIMIT: Int64 = 4096

func makeLargeFormQuery(itemCount: Int64): String {
    let builder = StringBuilder()
    for (i in 0..itemCount) {
        if (i > 0) {
            builder.append("&")
        }
        builder.append("k${i}=v")
    }
    return builder.toString()
}

@Test
public class UrlSecurityRegressionTest {
    @TestCase
    func rejectEncodedNullByteInUrl(): Unit {
        try {
            URL.parse("http://example.com/%00")
            @Assert(false)
        } catch (e: UrlSyntaxException) {
            @Expect(e.message, "Null byte is not allowed in URL. Input = /%00.")
        }
    }

    @TestCase
    func rejectEmptyPort(): Unit {
        try {
            URL.parse("http://example.com:")
            @Assert(false)
        } catch (e: UrlSyntaxException) {
            @Expect(e.message, "Port cannot be empty. Input = .")
        }
    }

    @TestCase
    func rejectNonDigitPort(): Unit {
        try {
            URL.parse("http://example.com:12ab")
            @Assert(false)
        } catch (e: UrlSyntaxException) {
            @Expect(e.message, "Port must contain digits only. Input = 12ab.")
        }
    }

    @TestCase
    func rejectOutOfRangePort(): Unit {
        try {
            URL.parse("http://example.com:65536")
            @Assert(false)
        } catch (e: UrlSyntaxException) {
            @Expect(e.message, "Port out of range. Input = 65536.")
        }
    }

    @TestCase
    func rejectTooLongIpv6Hextet(): Unit {
        try {
            URL.parse("http://[12345::1]/")
            @Assert(false)
        } catch (e: UrlSyntaxException) {
            @Expect(e.message, "IPv6 hextet is too long. Input = 12345::1.")
        }
    }
}

@Test
public class FormSecurityRegressionTest {
    @TestCase
    func rejectTooManyItemsDuringInit(): Unit {
        let query = makeLargeFormQuery(FORM_ITEM_LIMIT + 1)
        try {
            Form(query)
            @Assert(false)
        } catch (e: IllegalStateException) {
            @Expect(e.message, "Form item count exceeds 4096.")
        }
    }

    @TestCase
    func rejectTooManyItemsDuringAdd(): Unit {
        let form = Form(makeLargeFormQuery(FORM_ITEM_LIMIT))
        try {
            form.add("overflow", "v")
            @Assert(false)
        } catch (e: IllegalStateException) {
            @Expect(e.message, "Form item count exceeds 4096.")
        }
    }

    @TestCase
    func allowSetOnExistingKeyAtLimit(): Unit {
        let form = Form(makeLargeFormQuery(FORM_ITEM_LIMIT))
        form.set("k0", "replaced")
        @Expect(form.get("k0"), "replaced")
    }
}
