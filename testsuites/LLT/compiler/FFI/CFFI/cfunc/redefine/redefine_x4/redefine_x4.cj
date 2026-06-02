// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// (CJNATIVE) DEPENDENCE: pkg.cj pkg1.cj
// (CJNATIVE) EXEC: %compiler %compile_lib_opt --verbose pkg.cj -o pkg.%middle
// (CJNATIVE) EXEC: %compiler %compile_lib_opt --verbose pkg1.cj -o pkg1.%middle
// (CJNATIVE) EXEC: %compiler %cmp_opt_chir2hlir %verbose_opt %f pkg.%middle pkg1.%middle -o %output
// (CJNATIVE) EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan I'm foo defined in package default: 1
// (CJNATIVE) ASSERT: scan barA: 1
// (CJNATIVE) ASSERT: scan barB: 1
// (CJNATIVE) ASSERT: scan I'm foo
import a.*
import b.*

@C
private func foo(a: Int64): Int64 {
    println("I'm foo defined in package default: ${a}")
    a
}

class A <: IA {}
class B <: IB {}

unsafe main() {
    foo(1)
    var a = A()
    a.bar(1)
    var b = B()
    b.bar(1)
}
