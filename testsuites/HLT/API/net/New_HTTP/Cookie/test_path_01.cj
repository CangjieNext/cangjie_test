/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %f -o %output %cmp_utest_opt
// RUN-EXEC: %run_stdx %output %run_utest_opt %run_args

/*
 * Test description: Test legal and illegal path
 * Test API: prop path: String
 */

import std.unittest.*
import std.unittest.testmacro.*
import stdx.net.http.*

@Test
class Test_Cookie_Path_01 {
    // 合法值：除控制字符，;之外的ACSii字符
    @TestCase
    func test_path_01(): Unit {
        var paths = ["!", "#", "$", "%", "&", "'", "*", "+", "-", ".", "/", ":", "<", "=", ">", "?", "@", "^", "_", "`",
            "|", "~", "{", "}", "1234567890", "[]", "qwertyuiopasdfghjklzxcvbnm", "QWERTYUIOPASDFGHJKLZXCVBNM"]
        for (path in paths) {
            var cookie = Cookie("name", "value", path: path)
            @Expect(cookie.path, path)
        }
    }

    // 默认值
    @TestCase
    func test_path_02(): Unit {
        var cookie = Cookie("name", "value")
        @Expect(cookie.path, "")
    }

    // 非法值：控制字符，；，中文等
    @TestCase
    func test_path_03(): Unit {
        var strs = ["\r", "\n", "\0", "仓颉", ";"]
        for (str in strs) {
            try {
                var _ = Cookie("name", "value", path: "/a${str}")
                @Expect(1, 2)
            } catch (e: IllegalArgumentException) {
            }
        }
    }
}
