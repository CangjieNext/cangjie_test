// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC-0: %compiler %noColor %cmp_opt_chir2hlir %verbose_opt %f -o %output
// EXEC-0: %run %run_opt %output %run_args

class A<T> where T <: CType {
    var a: T

    init(a: T) {
        this.a = a
    }
}

main() {
    var a1 = A<Int8>(1)
    var a2 = A<Int16>(2)
    var a3 = A<Int32>(3)
    var a4 = A<Int64>(4)
    var a5 = A<UInt8>(5)
    var a6 = A<UInt16>(6)
    var a7 = A<UInt32>(7)
    var a8 = A<UInt64>(8)

    if (!(a1.a == 1 && a2.a == 2 && a3.a == 3 && a4.a == 4 && a5.a == 5 && a6.a == 6 && a7.a == 7 && a8.a == 8)) {
        return 1
    }

    var aa1 = A<Float32>(1.0)
    var aa2 = A<Float64>(2.0)
    var aa3 = A<Bool>(true)
    if (!(aa1.a == 1.0 && aa2.a == 2.0 && aa3.a)) {
        return 1
    }

    var au = A<Unit>(())

    0
}
