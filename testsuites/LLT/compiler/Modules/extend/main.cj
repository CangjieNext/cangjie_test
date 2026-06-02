// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ./src
// EXEC: %compiler %pkg_opt ./src/p1 %compile_lib_opt -o libp1.%middle
// EXEC: %compiler %pkg_opt ./src/p2 %compile_lib_opt -o libp2.%middle
// EXEC: %compiler %pkg_opt ./src/p3 %compile_lib_opt -o libp3.%middle 2>&1 | compare %f
// ASSERT: regex is not a member of class
