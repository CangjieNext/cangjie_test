/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt  %f -o %output
// RUN-EXEC: %run_stdx %output %run_args

import stdx.encoding.url.*

main(): Int64 {
    var userinfo1 = UserInfo("1Ab\n2他\u{4f60}@", "cH人8\b9#@\u{597d}")
    var userinfo2 = UserInfo("", "1Ab2他\f\u{4f60}@")
    var userinfo3 = UserInfo("cH人89\b#@\u{597d}", "")
    var userinfo4 = UserInfo("oP56\n快\u{4f60}\u{597d}")
    var a = userinfo1.toString()
    var b = userinfo2.toString()
    var c = userinfo3.toString()
    var d = userinfo4.toString()
    if (a != "1Ab\n2他你@:cH人8\b9#@好") {
        return 1
    }
    if (b != ":1Ab2他\f你@") {
        return 2
    }
    if (c != "cH人89\b#@好") {
        return 3
    }
    if (d != "oP56\n快你好") {
        return 4
    }
    return 0
}
