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
    public class Inner{
        public var inner: Int32 = 4
    }
    public func f(): Int32{
        this.Inner()     
        return 0
    }
}

class Data<T> {
    public class Inner{
        public var inner: Int32 = 4
    }
    public func f(a: T): Int32{
        this.Inner()      
        return 0
    }

}

func run(): Int64 {
    var test: Test = Test(2)
    var data: Data<Int32> = Data<Int32>(2)
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan parse_unexpected_declaration_in_scope
