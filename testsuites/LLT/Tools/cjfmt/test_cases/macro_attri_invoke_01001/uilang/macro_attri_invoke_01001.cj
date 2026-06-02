// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import define.*

@M[func test<T>(a:T,b!:Int64=1){0}]
func test<T>(a:T,b!:Int64=1){0}

@M[class C<T>{}]
class C<T>{}

@M[struct R<T>{}]
struct R<T>{}

@M[var i : Int64 = 1]
var i : Int64 = 1

main(){
    C<Int64>()
    R<Int64>()
    return test<Int64>(0,b:0) + i - 1
}
