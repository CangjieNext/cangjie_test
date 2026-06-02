// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %diag_json %f 2>&1 | compare %f

interface Foo {}

class A {}

extend A <: Foo {}

extend A <: Foo {}

main(): Int64 {
    return 1
}
// ASSERT: scan sema_extend_duplicate_interface
