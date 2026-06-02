/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_macro test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %f -o %output

import test.*

main(){
    var b : UInt32 = UInt32(@M(r'1)')
    var a : UInt32 = UInt32(r'@M(1'))
    var c : UInt32 = UInt32(r'@M(1)')
    return 0
}
// ASSERT: scan lex_characters_overflow
