/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func nested(name: String, arr: Array<Int64>): String {
    let s1="outer ${"inner ${name}"} end"
    let s2="${arr[0]} ${arr[1]} ${"${arr[2]}"}"
    let s3="a{b}c ${name} d"
    return s1+s2+s3
}

main() {
    println(nested("cj", [1, 2, 3]))
}
