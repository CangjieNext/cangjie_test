// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: code.cj
// EXEC:%compiler %error_count_limit_opt=0 code.cj 2>&1 | compare %f
// ASSERT: scan errors generated, 0 error printed.
// ASSERT: scan-not Aborted
