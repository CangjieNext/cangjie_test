/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func test1<T>() {
    let v1 = Option<Float16>.Some(10.0-1.0)
    let v2 = Option<Float16>.None
    let v3 = Option<Float32>.Some(2.0)
    let v4 = Option<Float16>.None
    let v5 = Option<Float64>.Some(3.0)
    let v6 = Option<Float64>.None

    let r1 = v1 ?? 1.0
    let r2 = v2 ?? 2.0
    let r3 = v3 ?? 3.0
    let r4 = v4 ?? 4.0
    let r5 = v5 ?? 5.0
    let r6 = v6 ?? 6.0
}

main(){
    test1<Int64>()
    0
}
