/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: test_macro_definition.cj
// EXEC: %compiler %cmp_macro test_macro_definition.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %f -o %output

import define.*

@echo
public var var8: UInt32 = UInt32(Int32(-37))

main(): Int64 {
    try {
        @echo let var34: Rune = 'S';
        match (var8) {
            case 26 => @echo var var20: Rune = 'C';
        }
    } catch (e: NoneValueException) {
        println("Exception: NoneValueException")
    }
    return 0;
}
// ASSERT: scan sema_nonexhuastive_patterns
