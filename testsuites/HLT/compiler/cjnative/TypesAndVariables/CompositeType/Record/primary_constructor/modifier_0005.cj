/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f



struct Data {
    public var b : Int32
    public static Data(){ 
        this.b = 3
    }   
}

func run(): Int32 {
    var data: Data = Data()
    return data.b - 3
}

main(): Int64 {
    return Int64(run())
}
// ASSERT: scan parse_illegal_modifier_in_scope
