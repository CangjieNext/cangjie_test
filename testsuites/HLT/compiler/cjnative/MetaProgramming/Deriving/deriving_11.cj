/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output  %run_args
import std.deriving.*

@Derive[Equatable]
enum A {
    T(Bool)
}

main() {
    var a = A.T(true)
    var b = A.T(false)
    if (a == b) {
        return 1
    } else {
        return 0
    }
}
