/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan FILE_FILE___FILE__

func FILE(): Unit {
    print("FILE")
}

func FILE1(): Unit {
    print("_FILE_")
}

func FILE2(): Unit {
    print("__FILE__")
}

main(): Int64 {
    FILE()
    FILE1()
    FILE2()
    return 0
}
