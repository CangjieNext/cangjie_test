// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

package fuzz

func f<T>(): Unit where This <: Int64, Unit <: Int64 {}

main() {}

// ASSERT: scan error: expected a generic type name after 'where' in generic constraint, found keyword 'This'
// ASSERT: scan error: expected a generic type name after ',' in generic constraint, found keyword 'Unit'
// ASSERT: scan-not duplicated type name '<invalid identifier>'
