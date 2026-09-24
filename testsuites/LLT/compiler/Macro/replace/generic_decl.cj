// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// EXEC: %run_macro %compiler %cmp_opt %macro_parallel %f -o %output
// EXEC: %run %run_opt %output %run_args

import test.*

//foreign_body
foreign {
    @callTest
    func a(): Int64
    @callTest
    func b(): Unit
}

//var_tuple
func test1(){
    @callTest var a : (Int64,Int64 )= (1,1)
}

//func_lambda
func test2(){
    @callTest var a : (Int64)->Int64 = {input:Int64 =>input}
}

@callTest
class A{}

@callTest
class B<T>{}

//struct_conv
@callTest
struct C{
    public var a : Int64
    public init(input:Int32){a = Int64(input)}
}

main() {
    test1()
    test2()
    A()
    B<Int64>()
    return 0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

