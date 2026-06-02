/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f



class Data {
    public Data(var a: Bool, x: Bool){ 
        this.a = a
    }
}

func run(): Int32 {
    var data: Data = Data(true, true)
    if(data.a){
    return 0
    }
    return 1
}
main(): Int64 {
    return Int64(run())
}
// ASSERT: scan parse_member_parameter_after_regular
