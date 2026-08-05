/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.net.*

@Test
public class Test_IPPrefix_tryParse {
    @TestCase[ip_pre in [
        ("0.0.0.0/0", "0.0.0.0/0"),
        ("0.0.0.0/32", "0.0.0.0/32"),
        ("1.2.3.4/8", "1.2.3.4/8"),
        ("255.255.255.255/16", "255.255.255.255/16"),
        ("192.168.0.1/24", "192.168.0.1/24"),
        ("::/0", "::/0"),
        ("::1/128", "::1/128"),
        ("::1/33", "::1/33"),
        ("2001:db8::1/64", "2001:db8::1/64"),
        ("::ffff:0.0.0.0/127", "::ffff:0.0.0.0/127"),
        ("::ffff:0.0.0.0/33", "::ffff:0.0.0.0/33")
    ]]
    func case_tryParse_01(ip_pre: (String, String)) {
        let (src, expected) = ip_pre
        @Expect(IPPrefix.tryParse(src).getOrThrow().toString(), expected)
    }

    @TestCase[src in [
        "",
        "1.2.3.4",
        "/8",
        "bad/8",
        "1.2.3.4/abc",
        "1.2.3.4/",
        "1.2.3.4/33",
        "1.2.3.4/64",
        "1.2.3.4/128",
        "1.2.3.4/255",
        "::1/129",
        "::1/255",
        "256.255.255.255/8",
        "::/129"
    ]]
    func case_tryParse_02(src: String) {
        @Expect(IPPrefix.tryParse(src).isNone())
    }
}
