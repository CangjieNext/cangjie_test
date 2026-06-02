/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %import-cangjie-stdx %cmp_opt  %f -o %output
// RUN-EXEC: %run_stdx %output %run_args

import stdx.encoding.url.*

main(): Int64 {
    var i = "http://www.122.cn/a%E4%BD%A0/b~/%3F12c"
    var i1 = "b/c/file%E4%BD%A0/~%2312"
    let s = URL.parse(i)
    let s1 = URL.parse(i1)
    var d = s.toString()
    var d1 = s1.toString()
    if (d != "http://www.122.cn/a%E4%BD%A0/b~/%3F12c") {
        return 1
    }
    if (d1 != "b/c/file%E4%BD%A0/~%2312") {
        return 2
    }
    if (s.path != "/a你/b~/?12c") {
        return 3
    }
    if (s1.path != "b/c/file你/~#12") {
        return 4
    }
    return 0
}
