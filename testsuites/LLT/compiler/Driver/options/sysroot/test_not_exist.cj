// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../src/main.cj
// EXEC: %compiler %cmp_opt main.cj --sysroot not_exist -o %output 2>&1 | compare %f

/* SCAN
[33mwarning[0m: No such directory: 'not_exist'. The argument is ignored.
 [36m#[0m [0mnote[0m: this warning can be suppressed by setting the compiler option `-Woff driver-arg`
*/
