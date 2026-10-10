// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj
// RUN-EXEC-PIPE-1: %run main 2>&1 | compare %f
// ASSERT: scan IllegalArgumentException: Original exception

public open class Foo {
    public open func test(): Nothing {
        throw IllegalArgumentException("Original exception")
    }
}

main() {
    Foo().test()
    0
}
