// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan macro import is only allowed in a macro package

// 'macro import' is only allowed inside a macro package.

package nm

macro import pc

main(): Int64 {
    return 0
}
