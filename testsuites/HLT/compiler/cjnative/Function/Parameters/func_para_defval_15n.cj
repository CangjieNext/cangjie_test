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
var res = Foo(1,"x")
if (res == "3xyz"){
return 0
}
return 1
}

func Foo(a:Int64,A!:Int64=2,B!:String = "yz",b:String):String{ 
return (a+A).toString()+b+B
}
// ASSERT: scan parse_named_parameter_after_unnamed
