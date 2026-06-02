/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define1.cj
// EXEC: %compiler define1.cj %cmp_macro
// ERRCHECK: %compiler %cmp_opt %f  -o %output

import define1.*

main() {
    @N var b = 1
    1
}
// ASSERT: scan parse_expected_character
