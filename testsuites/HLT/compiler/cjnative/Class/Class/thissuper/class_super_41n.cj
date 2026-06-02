/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f



open class Base<T> {
    public var i: Int32 = 2
    public open func foo(): Int32{
        return 3
    }
}

class Test <: Base<Int32>{
    public override func foo(){
        var super.i = 3    
        return super.i
    }
}

class Data<T> <: Base<T> {
    public override func foo(){
        var super.i = 1    
        return super.i
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
