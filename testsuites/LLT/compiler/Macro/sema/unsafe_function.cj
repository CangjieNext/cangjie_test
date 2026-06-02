// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %compiler %cmp_opt %diag_json %f -o %output
// ASSERT: scan-2 sema_unsafe_func_can_only_be_called
// ASSERT: scan the error originates in the macro `M1` (consider using `--debug-macro` for more info)
// ASSERT: scan the error originates in the macro `M0` (consider using `--debug-macro` for more info)

import define.*

unsafe func unsafeFunc() {
    println("call unsafeFunc")
}

class ClassWithUnsafeMember {
    unsafe func unsafeFunc() {
        println("call unsafeFunc")
    }
}

main() {
    unsafe { unsafeFunc() }
    // normal reference
    @M1 var fn = unsafeFunc
    // member access
    let obj = ClassWithUnsafeMember()
    @M0(fn = obj.unsafeFunc)
    return 0
}
