/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: macro_define_40029.cj
// EXEC: %compiler %cmp_macro macro_define_40029.cj
// EXEC: %run_macro %compiler %cmp_opt  %f %macro_debug -o %output 2>&1 | compare %f
                                                                            

package test
import define_40029.*

@define_40029.X
interface X<T>{}

@define_40029.Y[1]
interface Y<T>{}

@define_40029.X
class XC<T>{}

@define_40029.Y[1]
class YC<T>{
}

@define_40029.X
struct XR<T>{}

@define_40029.Y[1]
struct YR<T>{}

@define_40029.X
enum XE<T>{e}

@define_40029.Y[1]
enum YE<T>{e}

@define_40029.X
func Xf<T>(){}

@define_40029.Y[1]
func Yf<T>(){}

@define_40029.X
extend<T> XC<T> <: X<T>{}

@define_40029.Y[1]
extend<T> YC<T> <: Y<T>{}


var x = @define_40029.X{}

var y = @define_40029.Y[1]{}

main(){
    return 0
}
// ASSERT: scan parse_expected_decl
