// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args | compare %f

import std.collection.HashMap

@Test
public class PropertiesReaderTest {
    @TestCase
    public func happy_test(): Unit {
        let configMap = HashMap<String, String>()
        configMap["duplicateKey"] = "second"
        configMap["helloInJapanese"] = "\u{3053}\u{3093}\u{306b}\u{3061}\u{306f}"
        configMap["encodedHelloInJapanese"] = "\\u3053\\u3093\\u306b\\u3061\\u306f"
        @Assert(configMap["duplicateKey"] == "second")
        @Assert(configMap["helloInJapanese"] == "\u{3053}\u{3093}\u{306b}\u{3061}\u{306f}")
        @Assert(configMap["encodedHelloInJapanese"] == "\\u3053\\u3093\\u306b\\u3061\\u306f")
    }
}

/* SCAN-IN
    [32mPASSED[0m: 1, [32mSKIPPED[0m: 0, ERROR: 0
 */
