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

open interface B {}

@Derive[Hashable]
enum A {
    T
}

extend A {
    func test() {}
}

main() {
    var a = A.T
    if (a.hashCode() == -7046029254386353131) {
        return 0
    } else {
        return 1
    }
}
