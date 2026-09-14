// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//  DEPENDENCE: define.cj
//  EXEC: %compiler %cmp_macro define.cj
//  EXEC: %run_macro %compiler %cmp_opt %f 2>&1 | compare %f

import define.*

main(): Int64 {
    @Outer(@Inner())
    return 0
}

/* SCAN
Macro item 'key1' has a different type: expected 'Bool'.
Macro item 'key2' has a different type: expected 'Int64'.
Macro item 'key3' has a different type: expected 'String'.
Macro item 'key4' has a different type: expected 'Tokens'.
Macro item 'key6' does not exist.
*/
