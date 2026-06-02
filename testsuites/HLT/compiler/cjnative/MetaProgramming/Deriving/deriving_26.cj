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
class A {
    static var a = [1, 1]
}

main() {
    var a = A()
    var b = A()
    if (a == b) {
        return 0
    }
    return 1
}
