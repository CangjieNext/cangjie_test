/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f



main(): Int64 {
return run()
}

func run(): Int64 {
var res1 = Data(3) 
if (res1.x == 7){
return 0
}
return 1
}


class Data{
var x: Int32 = 1
var y: Int32 = 2
init(x:Int32,y!:Int32 = 4){
init()
this.x = x+y
}
init(x:Int32){
init()
this.x = x+1
}
init(){
print("yes")
}
}
// ASSERT: scan parse_expected_expr_or_decl_in
