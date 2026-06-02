/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_a_40001.cj
// ERRCHECK: %compiler define_a_40001.cj %cmp_macro
// ASSERT: scan macro's call and definition can not in one package

package use

import A.*

main() {
    return @a[1](0)
}
// ASSERT: regex-not no position error occurred
