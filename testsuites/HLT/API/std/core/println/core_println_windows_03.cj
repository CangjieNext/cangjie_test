/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args  | compare %f
// ASSERT: scan-begin 仓颉
// ASSERT: scan-next 鸿蒙
// ASSERT: scan-next 鸿蒙對應三個繁體字

main() {
    println("仓颉")
    println("鸿蒙")
    println("鸿蒙對應三個繁體字")
}
