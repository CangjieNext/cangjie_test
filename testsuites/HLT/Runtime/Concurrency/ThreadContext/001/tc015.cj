/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt --module-name="ohos" %f -o %output


package base // must be base for test.

import std.sync.*


class MainThreadContext <: ThreadContext{
    public func end(): Unit {}
    public func hasEnded(): Bool {return false}
}

main(): Int64 {
    var tc = MainThreadContext()
    try {
        spawn(tc;tc) {}
    } catch (e:Exception){e.printStackTrace()}
    return 0
}
// ASSERT: scan parse_expected_left_brace
// ASSERT: scan parse_expected_right_delimiter
// ASSERT: scan parse_unmatched_right_delimiter
// ASSERT: scan parse_expected_expr_or_decl_in
