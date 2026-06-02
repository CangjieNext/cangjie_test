// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: code.cj
// EXEC:%compiler 2>&1 code.cj %error_count_limit_opt=10000000000000000000000000000 | compare %f
// ASSERT: scan The value of --error-count-limit is invalid.
