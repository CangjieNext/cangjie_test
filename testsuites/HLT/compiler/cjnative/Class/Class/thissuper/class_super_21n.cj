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
    public class Inner{
        public var inner: Int32 = 4
    }
}

class Test <: Base<Int32>{
    public func f(){
        super.Inner()    
    }

}

class Data<T> <: Base<T> {
    public func f(){
        super.Inner()    
    }
}

func run(): Int64 {
    var test: Test = Test()
    var data: Data<Int32> = Data<Int32>()
    test.f()
    data.f()
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan parse_unexpected_declaration_in_scope
