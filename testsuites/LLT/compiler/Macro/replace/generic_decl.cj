// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %macro_parallel %f -o %output

internal import test.*

//foreign_body
foreign {
@callTest
let a : Int64 
@callTest
var b : Int64 
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

/* SCAN
error: expected no modifier before macro call, found 'foreign'
 ==> generic_decl.cj:8:1:
  | 
8 | foreign {
  | ^^^^^^^ expected no modifier here
9 | @callTest
  | ~~~~~~~~~ before macro call
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

