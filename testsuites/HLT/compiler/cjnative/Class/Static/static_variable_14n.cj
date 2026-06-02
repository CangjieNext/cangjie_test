/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f



class Data {
    public func foo(x: Int32): Int32 {
        static var a: Int32 = 1  
        return a
    }
}

func run(): Int64 {
    var data: Data = Data()
    if (data.foo() == 1) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan parse_illegal_modifier_in_scope
