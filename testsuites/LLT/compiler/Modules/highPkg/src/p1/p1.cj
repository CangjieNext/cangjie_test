// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../../src
// EXEC: %compiler %compile_lib_opt %pkg_opt ./src/p1/p2 2>&1 | compare %f
// ASSERT: regex-not declaration of 'p1' is conflicted with parent package name.

package p1
