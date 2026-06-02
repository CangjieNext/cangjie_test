/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan parse_diag_error
import std.deriving.*

@Derive[Equatable]
class A {
    @DeriveExclude
    static const a = 1

    var b = 1
}

main() {
    var a = A()
    var b = A()
    if (a == b) {
        return 0
    } else {
        return 1
    }
}
