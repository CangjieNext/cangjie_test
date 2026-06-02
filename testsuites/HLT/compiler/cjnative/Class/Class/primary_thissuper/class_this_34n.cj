/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output



class Test {
    public var i: Int32 = 2
    public init(){
        i = i+1
    }
    public Test(x: Int32){
        this()
        var this.i2 = 4  
    }
}

class Data<T> {
    public var i1: T
    public var i2: T
    public init(){}
    public Data(x: T){
        this()
        var this.i3 = 4   
    }
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>()
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan parse_expected_one_of_identifier_or_pattern
