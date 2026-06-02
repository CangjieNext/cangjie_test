// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1:: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex error: unexpected main function in interface body[\w\W]*main_in_interface.cj:11:13:[\w\W]*unexpected main function[\w\W]*error: unexpected main function in interface body[\w\W]*main_in_interface.cj:14:5:[\w\W]*unexpected main function

interface A {
    private main(): Int64 {
        return 0
    }
    main() {}
}
