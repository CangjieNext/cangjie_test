/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

struct A{
    
    func test(a: Int64, b: Int64){
        return (a, b)
    }
}

class B{
    func temp(){
        let test = A()
        var a: (a: Int64, override: Int64) -> (a: Int64,  Int64) = test.test
        return a(1,1)
    }
}

main(){
    var temp = B()
    return temp.temp()[1] - temp.temp()[0]
}
// ASSERT: scan parse_all_parameters_must_be_named
