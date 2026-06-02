/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output



class Data {
    public init(x: Int32) {
        this()
        static var a: Int32 = 1  
    }
}

func run(): Int64 {
    if (Data.a == 1) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan parse_illegal_modifier_in_scope
