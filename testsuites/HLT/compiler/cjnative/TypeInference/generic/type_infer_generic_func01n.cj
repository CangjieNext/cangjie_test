/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f



// 无法用()->来标示泛型函数，也就是泛型函数无法用类型表示，所以变量被赋值为一个泛型函数不能推导出泛型函数中的类型变元的类型
func test_function(){
    var a:<Int32>()->Unit = aoo1<Int32> 
}

func run():Int64{
    test_function()
    return 0
}
main(): Int64 {
    return run()
}
// ASSERT: scan parse_expected_type
// ASSERT: scan parse_expected_expr_or_decl_in
