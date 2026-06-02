/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex-auto IllegalArgumentException

func run(): Int64 {
    var s1: String = "hello Char lang"
    var s2 = ""

    var s3: String = s1 * (-1)
    var s4: String = s1 * (-5)
    var s5: String = s2 * (-1)
    var s6: String = s2 * (-5)

    return 0
}

main() {
    run()
}
