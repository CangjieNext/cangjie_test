/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output



struct Data{
    public var i: Int64
    private init(x: Int32){
        var i = 3
        this.i = i
    }
}
struct Data2{
    public var i: Int64
    static private init(x: Int32){  
        var i = 3
        this.i = i
    }
}

main():Int64{
    var data = Data(Int32(3))   
    if (data.i == 3) {
        return 0
    }
    return 1
}
// ASSERT: scan parse_conflict_modifier
// ASSERT: scan parse_static_init_can_not_accept_any_parameter
