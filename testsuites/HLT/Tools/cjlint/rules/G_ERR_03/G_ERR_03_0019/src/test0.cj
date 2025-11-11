/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

var test1 = Some(100)
var sum1 = { a:Int64, b:Int64 => a + b + test1.getOrThrow()}(1, test1.getOrThrow())

main(){
    return 0
}

