/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %cjcpl --old default.cjo --new default.cjo 2>&1 | compare %f
// ASSERT: scan-full Compatible!\n
main() {
    0
}
