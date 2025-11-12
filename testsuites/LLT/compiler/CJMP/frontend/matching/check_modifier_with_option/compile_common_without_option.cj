// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: common.cj
// EXEC-PIPE-1: %compiler %diag_json common.cj --output-type=dylib 2>&1 | compare %f
// ASSERT: scan parse_unexpected_cjmp_decl
