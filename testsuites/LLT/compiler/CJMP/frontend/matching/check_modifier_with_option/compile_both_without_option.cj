// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: common.cj platform.cj
// EXEC-PIPE-1: %compiler %diag_json common.cj platform.cj --experimental --output-type=chir 2>&1 | compare %f
// ASSERT: scan sema_redefinition
