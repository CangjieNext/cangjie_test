/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

interface interfaceA {
    func a(a: Int64) {
        a
    }
}

type A = interfaceA

class B {}

extend B <: A {}

main(): Int64 {
    return 0
    /* var a:B = B()
    if(a.a(1)== 1){
    return 0
    }else{
    return 1
    } */
}
