/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func foo() {
    return 1
}

main() {
    var y0 = foo
    
    let f1 = { a: Int64, b: Int64 => a + b }

    var y1 = f1
    0
}
