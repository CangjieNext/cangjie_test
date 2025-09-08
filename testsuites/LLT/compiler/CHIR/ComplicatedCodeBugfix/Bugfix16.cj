// LEVEL: 0
// EXEC: %compiler -g %optimization_level_2 %debugCHIROpt %cmp_opt %f -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


main(): Int64 {
   var x : ????????????????????????????????Int64 =1
   return 0
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
