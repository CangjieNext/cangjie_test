// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1:: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan error: expected a enum value name at beginning of enum body, found keyword 'main'
// ASSERT: scan expected a enum value name here
// ASSERT: scan error: unexpected main function in enum body
// ASSERT: scan unexpected main function

enum A {
    main
    public main(): Int64 {
        return 0
    }
}
