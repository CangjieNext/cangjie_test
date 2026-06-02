// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (not CJNATIVE) DEPENDENCE: ../src/main.cj
// (not CJNATIVE) EXEC-PIPE-1: %compiler --output-type=cbc main.cj --output main.abc 2>&1 | compare %f
// (not CJNATIVE) ASSERT: regex error.*unsupported output extension '.abc', extension '.cbc' is required
