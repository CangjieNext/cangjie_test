// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg01
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt pkg01 -o pkg.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt %f

package pkg

public import pkg01.*

var A = 0
