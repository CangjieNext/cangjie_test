// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %f %compile_lib_opt | compare %f

package a

public const GGG = -1

public struct Address {
    public static const SSC = -3
}

public const func foo() {}

// ASSERT: scan-not unused variable
// ASSERT: scan-not unused function
