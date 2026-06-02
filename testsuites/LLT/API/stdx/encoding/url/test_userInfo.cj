/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC:%set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import stdx.encoding.url.*

@Test
class UserInfoTest {
    @TestCase
    func userInfoInit(): Unit {
        var userInfo = UserInfo()
        @Expect(userInfo.username(), "")
        @Expect(userInfo.password(), None)

        userInfo = UserInfo("ABCD")
        @Expect(userInfo.username(), "ABCD")
        @Expect(userInfo.password(), None)

        userInfo = UserInfo("ABCD", None)
        @Expect(userInfo.username(), "ABCD")
        @Expect(userInfo.password(), None)

        userInfo = UserInfo("ABCD", "123")
        @Expect(userInfo.username(), "ABCD")
        @Expect(userInfo.password(), Some("123"))
    }

    @TestCase
    func userInfoToString(): Unit {
        var userInfo = UserInfo(":;", "?.")
        @Expect(userInfo.toString(), ":;:?.")

        userInfo = UserInfo("1Ab\n2他\u{4f60}@", "cH人8\b9#@\u{597d}")
        @Expect(userInfo.toString(), "1Ab\n2他你@:cH人8\b9#@好")

        userInfo = UserInfo("\t\r\n", "\b")
        @Expect(userInfo.toString(), "\t\r\n:\b")

        var url = URL.parse("http://121www.asd12.com:%3A22789%E4%BD%A0ewweq@www.baadsd.com:8080")
        @Expect(url.userInfo.toString(), "121www.asd12.com::22789你ewweq")

        url = URL.parse("http5+://*+,9_Ab:2a_4*+,@www.example.com:78/a/b")
        @Expect(url.userInfo.toString(), "*+,9_Ab:2a_4*+,")
    }
}
