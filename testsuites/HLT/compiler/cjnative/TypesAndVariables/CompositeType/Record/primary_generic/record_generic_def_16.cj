/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output



struct Data<T>
    where T <:  {  
    public var x: T
    public Data(a: T){
        x = a
    }
}

main(): Int64 {
    var i1: Int32 = 4
    var data: Data<Int32> = Data<Int32>(i1)
    return 0
}
// ASSERT: scan parse_expected_type
