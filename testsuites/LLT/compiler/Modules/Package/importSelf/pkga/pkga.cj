// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pkga
// EXEC: %compiler %compile_lib_opt %pkg_opt pkga 2>&1 | compare %f
// ASSERT: regex package 'pkga' should not import itself

package pkga

internal import pkga.one

public let one: Int32 = 1
public let two: Int32 = pkga.one
