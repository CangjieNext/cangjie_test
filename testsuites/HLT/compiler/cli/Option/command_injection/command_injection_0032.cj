/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %set LIBRARY_PATH=\''$(touch "OOPS_INJECTION!")':$LIBRARY_PATH %compiler %cmp_opt %f -o %output
// EXEC: ls | compare %f
// ASSERT: scan-not OOPS_INJECTION!

main() {
    0
}
