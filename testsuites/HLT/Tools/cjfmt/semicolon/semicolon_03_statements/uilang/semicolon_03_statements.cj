/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func f(): Int64 {
    let a = 1;
    let b = 2;
    let c = a + b ;
    let d = 3;let e = 4;
    return c + d + e;
}

main() {
    println(f()) ;
    println("done");
}
