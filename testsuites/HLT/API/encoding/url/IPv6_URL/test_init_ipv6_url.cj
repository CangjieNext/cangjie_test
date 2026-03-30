/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %stdx-package  %cmp_utest_opt %f -o %output
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

import stdx.encoding.url.*

@Test
public class Test_IPv6_URL_Init {
    var schemes = ["http", "https", "ftp", "wss"]
    var ipv6strs1 = [
        "2001:DB8:0:0:8:800:200C:417A",
        "FF01:0:0:0:0:0:0:101",
        "0:0:0:0:0:0:0:1",
        "0:0:0:0:0:0:0:0",
        "ABCD:EF01:2345:6789:ABCD:EF01:2345:6789",
        "2001:DB8:0:0:8:800:200C:417A",
        "2001:DB8::8:800:200C:417A",
        "FF01::101",
        "::1",
        "::",
        "::13.1.68.3",
        "::FFFF:129.144.52.38"
    ]

    var ipv6strs2 = [
        "::1::",
        "::ffff:256.256.256.256",
        "fe80::1%3\0z",
        "2001:db8::g123:4567:89ab:cdef",
        "2001:db8::H123:4567:89ab:cdef",
        "::::1",
        "0000:0000:0000:0000:0000:0000:0000:0000:0001"
    ]

    var ports = ["0", "8080", "65535"]
    var paths = ["/dd", "/d/d", "/d/a/c/../../b", "/a/a////b../b", "/a/b/c/"]
    var querys = ["?q=query+string&sort=date&limit=10"]
    var fragments = ["#section-2"]

    @TestCase[scheme in schemes, 
 ipv6str in ipv6strs1, 
 path in paths 
]
    func test_init_01(scheme: String, ipv6str: String, path: String) {
        var url = URL(scheme: scheme, hostName: ipv6str, path: path)
        @Expect(url.scheme, scheme)
        @Expect(url.hostName, ipv6str.toAsciiLower())
        @Expect(url.path, path)
        @Expect(url.isAbsoluteURL(), true)
    }

    @TestCase[scheme in schemes, 
 ipv6str in ipv6strs1 
]
    func test_init_02(scheme: String, ipv6str: String) {
        @AssertThrows[UrlSyntaxException](URL(scheme: scheme, hostName: ipv6str, path:"./a"))
        @AssertThrows[UrlSyntaxException](URL(scheme: scheme + "\0", hostName: "127.0.0.1", path:"/a"))
    }

    @TestCase[scheme in schemes, 
 ipv6str in ipv6strs1, 
 port in ports, 
 path in paths 
]
    func test_init_03(scheme: String, ipv6str: String, port: String, path: String) {
        var url = URL(scheme: scheme, hostName: ipv6str, path: path).replace(scheme: scheme, userInfo: None,
            hostName: ipv6str, port: port, path: path, query: querys[0], fragment: fragments[0])
        @Expect(url.scheme, scheme)
        @Expect(url.hostName, ipv6str.toAsciiLower())
        @Expect(url.port, port)
        @Expect(url.toString().contains("[${ipv6str.toAsciiLower()}]"))
        URL.parse(url.toString())
    }

    @TestCase[scheme in [ "http" ], 
 ipv6str in ipv6strs2, 
 path in [ "/a" ] 
]
    func test_init_illegal(scheme: String, ipv6str: String, path: String) {
        @AssertThrows[UrlSyntaxException](URL(scheme: scheme, hostName: ipv6str, path: path))
    }
}
