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
    public init(x: Int32){
        static func foo(a: Int32): Int32 { return a+2 }         
    }
}

func run(): Int64 {
    var data: Data = Data(3)
    if (data.foo(2) != 4) {
        return 1
    }
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan parse_illegal_modifier_in_scope
