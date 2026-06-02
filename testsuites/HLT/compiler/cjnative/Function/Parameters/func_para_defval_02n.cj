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
var res = Foo()
if (res == 3){
return 0
}
return 1
}

func Foo(a:Int64=1){
var b: Int64 = 2
return a+b
}
// ASSERT: scan parse_expected_dot_lparen
