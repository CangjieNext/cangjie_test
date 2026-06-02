/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main() {
    var i = 1 + 2 * 3 - 4 // The result is 3. 
    var j = (1 + 2) * 3 - 4 // The result is 5.
    print("${i}\n")
    print("${j}\n")
    return 0
}
