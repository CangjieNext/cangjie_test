// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-1: %compiler %noColor %f %diag_json 2>&1 | compare %f
internal import std.collection.*

struct R {
    public var l1: Int32 = 10
    public mut func incl1(v: Int32) {
        l1 += v
    }
    public func setGlobalBuf(buf: ArrayList<R>) {
        var n = buf.size
        for (i in 0..n) {
            buf[i].incl1(1)
        }
    }
}
// ASSERT: scan sema_immutable_access_mutable_func
// ASSERT: scan sema_missing_entry
