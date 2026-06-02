/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f



class Test {
    public var a: Int32 = 2
    public Test(){}
    public func f(){
        this.init()             
    }
}

class Data<T> {
    public var a: T
    public Data(x: T){
        a = x
    }
    public func f(){
        this.init()             
    }
}

func run(): Int64 {
    var test: Test = Test(3)
    var data: Data<Int32> = Data<Int32>(4)
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan parse_expected_name
// ASSERT: scan parse_expected_expr_or_decl_in
