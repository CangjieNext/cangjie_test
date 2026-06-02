/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f




var str: String = "Hello"" Char Lang"

func run(): Int64 {
    print("StringTest: " + str)
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan parse_expected_character
