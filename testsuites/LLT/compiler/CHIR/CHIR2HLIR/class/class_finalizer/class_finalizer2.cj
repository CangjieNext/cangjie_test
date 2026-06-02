// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f %diag_json -o %n.%suffix 2>&1 | compare %f

internal import std.runtime.*

var flag = 0

abstract class A {
    ~init() {
        flag += 1
    }
}

class B <: A {}

func test() {
    var a = B()
}

main() {
    test()
    print("flag is ${flag}.")
    GC()
    print("flag is ${flag}.")
    return 0
}
// ASSERT: scan sema_finalizer_forbidden_in_class
// ASSERT: scan sema_deprecated_warning
