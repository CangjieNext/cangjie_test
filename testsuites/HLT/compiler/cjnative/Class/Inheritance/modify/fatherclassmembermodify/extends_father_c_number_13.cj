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
    protected func foo() : Int32{
        return 1
    }
}

class Child <: Parent {
    public main(): Int64 {
        var child : Child = Child()
        if (child.foo() != 1) {
            return 1
        }
        return 0
    }
}
main(): Int64 {
 return Child().main()
}
// (not iOS) ASSERT: scan parse_unexpected_declaration_in_scope
// ASSERT: scan parse_expected_name
// ASSERT: scan parse_missing_body
