/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


class Foo {
    public prop a: Int64 { // ok
       private get() { return 0 }  
    }
    public prop b: Int64 { // ok
       protected get() { return 0 }  
    }
    public prop c: Int64 { // ok
      public get() { return 0 }  
    }

}
main():Int64 {
    return 0
}
// ASSERT: scan parse_expected_no_modifier
