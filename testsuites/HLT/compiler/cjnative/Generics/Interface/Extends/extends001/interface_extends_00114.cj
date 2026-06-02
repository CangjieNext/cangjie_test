/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


interface A<X>{
    interface Z{} 
}

interface B <: A<Int64>{}

interface C<X> <: A<Int64>{}

interface D<X> <: A<X>{}

interface E<X,Y> <: A<X>{}


main(){
    var a : A<Int64>.Z
    var b : B.Z
    var c : C<Int64>.Z
    var d : D<Int64>.Z
    var e : E<Int64,Int64>.Z
    return 0
}
// ASSERT: scan parse_unexpected_declaration_in_scope
