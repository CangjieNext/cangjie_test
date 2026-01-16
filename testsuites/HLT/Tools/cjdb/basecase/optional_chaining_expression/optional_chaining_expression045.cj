/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func func1<T>(){
    0
}

func func2<T>(a:Int64){
    a
}

main() {
    var f1 = Option<()->Int64>.Some(func1<Int64>)
    var f2 = Option<()->Int64>.None
    var f3 = Option<(Int64)->Int64>.Some(func2<Int64>)
    var f4 = Option<(Int64)->Int64>.None

    var r1 = f1?()
    var r2 = f2?()
    var r3 = f3?(1)
    var r4 = f4?(1)
    0
}
