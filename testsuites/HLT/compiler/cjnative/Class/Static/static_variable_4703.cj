/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f



class Data {
var b: Int32 = 2
init(x:Int32){
init()
var i_b: Int32 = 2*b // expected is 2*2,this "b" is "this.b"
func foo():Int32{
var i_f_c: Int32 = 2*i_b
return i_f_c
}
print(foo().toString()+"n")
}
func foo():Int32{
var f_c = b // expected is 2,this "b" is "this.b"
return f_c
}
}

func run(): Int64 {
var res : Data = Data(2);
return 0
}

main(): Int64 {
return run()
}
// ASSERT: scan parse_expected_expr_or_decl_in
