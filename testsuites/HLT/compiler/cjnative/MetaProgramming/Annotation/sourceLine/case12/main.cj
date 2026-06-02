/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %macro_lib %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

func test(a!: Int64 = @sourceLine()) {
    return a
}

main() {
    var fileName = test()
    if (fileName != 13) {
        return 1
    }
    return 0
}
