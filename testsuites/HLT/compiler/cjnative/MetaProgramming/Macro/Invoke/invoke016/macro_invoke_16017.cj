/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE:  define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt  %f -o %output 2>&1 | compare %f



import define.*

func test(a:(Int64)->Int64){}
func foo(a:Int64):(Int64)->Int64{bar}
func bar(a:Int64):Int64{a}


main(){
    bar|>test
    @SAME{a:(Int64)->Int64 => return bar}(bar) |> test
    @SAME[1]{a:(Int64)->Int64 => return bar}(bar) |> test
    0
}
// ASSERT: scan parse_expected_decl
