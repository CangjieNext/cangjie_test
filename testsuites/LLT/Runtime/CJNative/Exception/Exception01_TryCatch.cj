// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan 10

main(): Int64 {
    try {
        throw Exception()
        // error, dont throw exception
        print(20.toString())
    } catch (_) {
        print(10.toString())
        return 0
    }
    // error dont catch exception
    print(30.toString())
    return 0
}
