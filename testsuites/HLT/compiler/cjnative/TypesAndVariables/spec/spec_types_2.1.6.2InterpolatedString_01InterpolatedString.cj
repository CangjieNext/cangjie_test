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
    let obj = "apples"
    let count = 10
    let interps1 = "There are ${count * count} $(obj)."
    let d1 = "The $ sign."
    let d2 = "The \$(v)."
    print("${obj}\n${count}\n${interps1}\n${d1}\n${d2}\n")
    return 0
}
