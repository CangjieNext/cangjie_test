/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output




main() : Int64 {
    return 0
}

class A<T>{

}

extend<T> A<T> {
    public open mut prop m: T { 
        get() {
            return 2
        }
        set(v){}
    }
    public override prop isEmpty: T { 
        get() {
            return 1
        }
    }
}
// ASSERT: scan parse_illegal_modifier_in_scope
