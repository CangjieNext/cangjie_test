/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %compile_lib_opt %f


trait update{}
interface I1 where T <: update {}
// ASSERT: scan parse_expected_decl
// ASSERT: scan parse_unexpected_where
// ASSERT: scan parse_expected_left_brace
