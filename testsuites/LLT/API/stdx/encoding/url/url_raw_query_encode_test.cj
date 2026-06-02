/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC:%set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

/*
 * Test description:
 *   Verify that URL.rawQuery and URL.rawFragment preserve percent-encoded
 *   special characters, while URL.query and URL.fragment decode them.
 *
 *   This is a regression test for the HTTP client request-target encoding bug.
 *   Both HTTP/1.1 (http_client1_1.cj) and HTTP/2 (stream_client.cj) code paths
 *   now use rawQuery/rawFragment to construct the origin-form request-target,
 *   ensuring RFC 3986/9110 compliance.
 *
 * Test API:
 *   URL.parse(), URL.rawQuery, URL.rawFragment, URL.query, URL.fragment, URL.toString()
 */

import stdx.encoding.url.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestUrlRawQueryEncode {

    @TestCase
    /* Verify rawQuery preserves %26 (encoded ampersand) and query decodes it */
    func testRawQueryPreservesPercent26(): Unit {
        let url = URL.parse("http://example.com/search?q=a%26b")
        if (let Some(raw) <- url.rawQuery) {
            @Expect(raw, "q=a%26b")
        } else {
            @Expect(false)
        }
        // query (decoded) should decode %26 to &
        if (let Some(decoded) <- url.query) {
            @Expect(decoded, "q=a&b")
        } else {
            @Expect(false)
        }
    }

    @TestCase
    /* Verify rawQuery preserves %3D (encoded equals sign) and query decodes it */
    func testRawQueryPreservesPercent3D(): Unit {
        let url = URL.parse("http://example.com/search?q=a%3Db")
        if (let Some(raw) <- url.rawQuery) {
            @Expect(raw, "q=a%3Db")
        } else {
            @Expect(false)
        }
        if (let Some(decoded) <- url.query) {
            @Expect(decoded, "q=a=b")
        } else {
            @Expect(false)
        }
    }

    @TestCase
    /* Verify rawQuery preserves %3F (encoded question mark) */
    func testRawQueryPreservesPercent3F(): Unit {
        let url = URL.parse("http://example.com/search?q=a%3Fb")
        if (let Some(raw) <- url.rawQuery) {
            @Expect(raw, "q=a%3Fb")
        } else {
            @Expect(false)
        }
    }

    @TestCase
    /* Verify rawQuery preserves %2F (encoded forward slash) */
    func testRawQueryPreservesPercent2F(): Unit {
        let url = URL.parse("http://example.com/search?q=a%2Fb")
        if (let Some(raw) <- url.rawQuery) {
            @Expect(raw, "q=a%2Fb")
        } else {
            @Expect(false)
        }
    }

    @TestCase
    /* Verify rawQuery preserves %25 (encoded percent sign) */
    func testRawQueryPreservesPercent25(): Unit {
        let url = URL.parse("http://example.com/search?q=100%25done")
        if (let Some(raw) <- url.rawQuery) {
            @Expect(raw, "q=100%25done")
        } else {
            @Expect(false)
        }
    }

    @TestCase
    /* Verify rawQuery preserves UTF-8 encoded characters */
    func testRawQueryPreservesUtf8(): Unit {
        let url = URL.parse("http://example.com/search?q=%E4%BB%93%E9%A2%89")
        if (let Some(raw) <- url.rawQuery) {
            @Expect(raw, "q=%E4%BB%93%E9%A2%89")
        } else {
            @Expect(false)
        }
    }

    @TestCase
    /* Verify rawQuery preserves multiple encoded parameters */
    func testRawQueryPreservesMultipleEncodedParams(): Unit {
        let url = URL.parse("http://example.com/search?q=hello%26world%3Dtest%23end")
        if (let Some(raw) <- url.rawQuery) {
            @Expect(raw.contains("%26"))
            @Expect(raw.contains("%3D"))
            @Expect(raw.contains("%23"))
        } else {
            @Expect(false)
        }
    }

    @TestCase
    /* Verify rawFragment preserves %23 (encoded hash) */
    func testRawFragmentPreservesPercent23(): Unit {
        let url = URL.parse("http://example.com/page#section%231")
        if (let Some(raw) <- url.rawFragment) {
            @Expect(raw, "section%231")
        } else {
            @Expect(false)
        }
    }

    @TestCase
    /* Verify rawFragment preserves %26 in fragment */
    func testRawFragmentPreservesPercent26(): Unit {
        let url = URL.parse("http://example.com/page#frag%26ment")
        if (let Some(raw) <- url.rawFragment) {
            @Expect(raw, "frag%26ment")
        } else {
            @Expect(false)
        }
    }

    @TestCase
    /* Verify rawQuery returns None when no query present */
    func testRawQueryNoneWhenEmpty(): Unit {
        let url = URL.parse("http://example.com/path")
        let raw = url.rawQuery
        @Expect(raw == None)
    }

    @TestCase
    /* Verify rawFragment returns None when no fragment present */
    func testRawFragmentNoneWhenEmpty(): Unit {
        let url = URL.parse("http://example.com/path")
        let raw = url.rawFragment
        @Expect(raw == None)
    }

    @TestCase
    /* Verify toString() also preserves percent-encoding (used by proxy absolute-form) */
    func testToStringPreservesEncoding(): Unit {
        let url = URL.parse("http://example.com/search?q=a%26b#frag%23")
        let s = url.toString()
        @Expect(s.contains("q=a%26b"))
        @Expect(s.contains("frag%23"))
    }

    @TestCase
    /* Verify combined query and fragment with encoding */
    func testCombinedQueryAndFragment(): Unit {
        let url = URL.parse("http://example.com/search?q=a%26b#sec%23tion")
        if (let Some(raw) <- url.rawQuery) {
            @Expect(raw, "q=a%26b")
        } else {
            @Expect(false)
        }
        if (let Some(raw) <- url.rawFragment) {
            @Expect(raw, "sec%23tion")
        } else {
            @Expect(false)
        }
    }

    @TestCase
    /* Verify normal query (no encoding) is unchanged in rawQuery */
    func testNormalQueryUnchangedInRaw(): Unit {
        let url = URL.parse("http://example.com/search?key=value&foo=bar")
        if (let Some(raw) <- url.rawQuery) {
            @Expect(raw, "key=value&foo=bar")
        } else {
            @Expect(false)
        }
        if (let Some(decoded) <- url.query) {
            @Expect(decoded, "key=value&foo=bar")
        } else {
            @Expect(false)
        }
    }

    @TestCase
    /* Verify empty query value preserved */
    func testEmptyQueryValue(): Unit {
        let url = URL.parse("http://example.com/search?q=")
        if (let Some(raw) <- url.rawQuery) {
            @Expect(raw, "q=")
        } else {
            @Expect(false)
        }
    }
}
