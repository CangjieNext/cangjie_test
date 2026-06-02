// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt -o %n.%suffix %f 2>&1 | compare %f 

class C {
    C(@Deprecated x!: Int64 = 0, y!: Int64 = x + 1) {
        x + y
    }
}

main(): Unit {}

// ASSERT: scan-not warning
// ASSERT: scan-not error

// NOTE: This is not reported because of it's semantically
// just usage of deprecated parameter inside function 
// |   C(@Deprecated x!: Int64 = 0, y!: Int64 = x + 1) {
// |                                            ^ deprecated
