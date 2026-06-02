// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// (DEBUG_OPTION)EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt %f 2>&1 | compare %f

// (not CJNATIVE) ASSERT: regex !{!"LinkageName", !\d+, !"_ZN7default6\$BOX_lE"}
// (not CJNATIVE) ASSERT: regex !{!"LinkageName", !\d+, !"_ZN06\$BOX_lE"}
// (not CJNATIVE) ASSERT: regex !{!"LinkageName", !\d+, !"_ZN7default27\$BOX_R_ZN8std\.core5ArrayIlEE"}
// (not CJNATIVE) ASSERT: regex !{!"LinkageName", !\d+, !"_ZN027\$BOX_R_ZN8std\.core5ArrayIlEE"}

// (CJNATIVE) ASSERT: scan define void @_CN7default5boooxIG_HG_G_(%Unit.Type* noalias sret(%Unit.Type) %0, i8 addrspace(1)* %a, i8 addrspace(1)* %b, %TypeInfo* %ti.T)
// (not CJNATIVE) ASSERT: scan @_ZN7default5boooxIC_ZN7default3fooEEC_ZN7default3fooEC_ZN7default3fooE

// Test auto-boxed base type
// base box type: Int64 and Array

interface foo {
    func typeName(): Unit
}

extend Int64 <: foo {
    public func typeName() {
        println("Int64")
    }
}

extend<T> Array<T> <: foo {
    public func typeName() {
        println("Array")
    }
}

func booox<T>(a: T, b: T) where T <: foo {
    a.typeName()
    b.typeName()
}

main() {
    var arr = [2023, 3, 14]
    booox<foo>(1017, arr)
    return 0
}
