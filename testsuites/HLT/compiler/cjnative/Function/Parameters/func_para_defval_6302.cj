/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output


main(): Int64 {
return run()
}

func run(): Int64 {
var res1 = Data().foo
print(res1.toString()+"n")
if (res1 == 5){
return 0
}
return 1
}


class Data{
let a: Int32 = 2
let b: Int32 = 3
var foo:(Int32,Int32)->Int32 =(a,c=3)=>a+c
}
// ASSERT: scan parse_expected_character
