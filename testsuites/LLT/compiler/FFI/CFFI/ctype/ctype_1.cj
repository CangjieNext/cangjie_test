// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC-0: %compiler %noColor %cmp_opt_chir2hlir %verbose_opt %f -o %output
// EXEC-0: %run %run_opt %output %run_args
// ASSERT: scan 0

@C
struct Data {
    var a: Int32 = 0
}

class A<T> where T <: CType {
    var a: T

    init(a: T) {
        this.a = a
    }
}

main() {
    var a = A<Data>(Data())
    println(a.a.a)
}
