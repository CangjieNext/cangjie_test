/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output



open class Parent {
    protected interface Inner { 
        let field : Int32 = 1
    }
}

class Child <: Parent {
        public main(): Int64 {
            if (Child.Inner.field != 1) {
                return 1
            }
            return 0
        }
    }
// ASSERT: scan parse_unexpected_declaration_in_scope
