/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


main():Int64 {

    return 0
}

open class Boo{
    public mut prop a1:Int64 {
        get(){
            return 0
        }
        set(v) {}
    }
    public mut prop a2:Int64 {
        get(){
            return 0
        }
        set(v) 
    }
    mut prop a3:Int64 { 
        get(){
            return 0
        }
    }
    mut prop a4:Int64 { 
        set(v) {}
    }
    prop b1:Int64 {
        get(){
            return 0
        }
    }
    prop b2:Int64 { // 'let' property cannot have setter
        get() {
            return 0
        }
        set(v) {}
    }

}
class Coo <: Boo {
}
// ASSERT: scan parse_expected_left_brace
// ASSERT: scan parse_missing_body
// ASSERT: scan parse_expected_get_or_set_in_prop
// ASSERT: scan parse_unexpected_declaration_in_scope
// ASSERT: scan parse_expected_right_delimiter
