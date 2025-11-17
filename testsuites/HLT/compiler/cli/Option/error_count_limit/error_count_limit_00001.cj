/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler --error-count-limit=1 %f -o %output
// ASSERT: scan 1 error printed.

main() {
    print(1)
    "
    "
    return 0
}
// ASSERT: regex-not no position error occurred
