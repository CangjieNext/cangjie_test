/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func func3<T>(a:T){
    a
}

struct ABC {
    var a = 1
}

main() {
    var f1 = Option<(ABC)->ABC>.Some(func3<ABC>)
    var f2 = Option<(ABC)->ABC>.None
    var f3 = Option<(Int64)->Int64>.Some(func3<Int64>)
    var f4 = Option<(Int64)->Int64>.None
    var r1 = f1?(ABC())
    var r2 = f2?(ABC())
    var r3 = f3?(2)
    var r4 = f4?(3)
    0
}
