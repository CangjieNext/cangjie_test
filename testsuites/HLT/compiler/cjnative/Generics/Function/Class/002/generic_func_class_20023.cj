/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_opt define.cj %compile_lib_opt -o define.%middle
// EXEC-PIPE: %compiler %cmp_opt define.%middle %f -o %output | compare %f
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan-not error

import define.*

main() {
    A<Int64>().test<Int64>(0)
}
// ASSERT: regex-not no position error occurred
