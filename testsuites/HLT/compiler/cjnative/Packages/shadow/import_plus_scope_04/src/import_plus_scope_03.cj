/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../pkga ../src
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt pkga/src/pkga -o ./
// ERRCHECK: %compiler %cmp_opt %f pkga.%middle -o %output


// ASSERT: regex
//// RUN-EXEC: %run %run_opt %output %run_args

import "pkga".pkga.*

main(): Int64 {
if (pkga.a != 1) {
return 1
}
return 0
}
// ASSERT: regex-not no position error occurred
