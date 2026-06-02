/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %compile_lib_opt %f



struct Data {
    public Data(var a!: Bool = true, var x: Bool){ 
        this.a = a
        this.x = x
    }
}

func run(): Int32 {
    var data: Data = Data(a: true, true) 

    if(data.a){
    return 0
    }
    return 1
}
main(): Int64 {
    return Int64(run())
}
// ASSERT: scan parse_named_parameter_after_unnamed
