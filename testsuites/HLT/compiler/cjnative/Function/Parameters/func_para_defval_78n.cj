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
var res1 = Base(1,2) + Base(3,4)
if (res1.x == 4 && res1.y == 6){
return 0
}
return 1
}


struct Base{
var x:Int32 = 4
var y:Int32 = 6
init(x:Int32,y:Int32){
this.x = x
this.y = y
}
operator func + (left: Base, right: Base = Base(3,4)): Base{ // EXPERTED: regex optional parameter cannot be used in operator overload function
Base(left.x+right.x, left.y+right.y)
}
}
// ASSERT: scan parse_expected_dot_lparen
