// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./src
// EXEC: %compiler %cmp_opt %pkg_opt ./src/core %compile_lib_opt -o libsrc.%middle
// EXEC: %compiler %cmp_opt %pkg_opt ./src libsrc.%middle
// EXEC: %run %main | compare %f
// ASSERT: regex-not core dumped
// ASSERT: scan Hello!
