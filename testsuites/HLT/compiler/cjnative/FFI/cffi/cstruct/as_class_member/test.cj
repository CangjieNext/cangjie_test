/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// DEPENDENCE: %n.c
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan -10, 30

@C
struct CStruct {
    var a: Int32 = 0
    var b: Int32 = 0
}

foreign func getData(a: Int32, b: Int32): CStruct

class A {
    var data: CStruct

    public init(a: Int32, b: Int32) {
        data = unsafe { getData(a, b) }
    }

    public func print() {
        println("${data.a}, ${data.b}")
    }
}

main() {
    let a = A(10, 20)
    a.print()
}
