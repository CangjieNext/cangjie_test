/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f -o %output 2>&1 | compare %f

open class Base {
    protected open func foo(parm1: Int32): Moon {
        var obj = Moon()
        obj.a = parm1 + 2
        return obj
    }
}

class Data <: Base {
    func foo(parm1: Int32): Sun {
        var obj = Sun()
        obj.a = parm1 + 3
        return obj
    }
}

open class Sun {
    var a: Int32 = 2
}

class Moon <: Sun {}
// ASSERT: scan sema_return_type_incompatible
