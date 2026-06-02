// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt -o %n.%suffix %f 2>&1 | compare %f
// ASSERT: scan operator '+' is deprecated.
// ASSERT: scan operator '[]' is deprecated.

class Class {
    @Deprecated
    operator func +(_: Class) {
        Class()
    }
}

struct Struct {
    @Deprecated
    public operator func [](_: Int64): Bool {
        false
    }
}

main(): Unit {
    let c1 = Class()
    let _ = c1 + Class()

    let s = Struct()
    s[1]
}

