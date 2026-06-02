// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt -o %n.%suffix %f 2>&1 | compare %f 
// ASSERT: scan function parameter 'x' is deprecated.
// ASSERT: scan variable 'x' is deprecated.

class C {
    C(@Deprecated public var x!: Int64 = 0) {}
}

main(): Unit {
    let c = C(x: 42)
    c.x = 43
}

