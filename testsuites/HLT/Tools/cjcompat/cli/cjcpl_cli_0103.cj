/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %cp %f old.cjo
// ERRCHECK: %cjcpl --old old.cjo --new a.cjo
// ASSERT: scan validation of ast file 'PACKAGE' failed
// ASSERT: scan Cannot load file old.cjo
package a
main() {
    0
}
