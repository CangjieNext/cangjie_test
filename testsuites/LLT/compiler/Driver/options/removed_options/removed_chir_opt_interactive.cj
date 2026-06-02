// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %f -chir-opt-interactive 2>&1 | compare %f
// ASSERT: scan invalid option: '-chir-opt-interactive'

main() {
    return 0
}
