/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan sema_undeclared_identifier
import std.deriving.*

@Derive[ToString]
enum A {
    T((Int64, Int64))
}

main() {
    var a = A.T((1, 1))
    if (a.toString() == "A.T((1,1))") {
        return 0
    }
    return 1
}
