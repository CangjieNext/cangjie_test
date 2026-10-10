// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_objc_interop 2>& 1 | compare %f

// `M` is marked broken by the member check, so `InsertBaseCtorDecl` gives it no base constructor. `N` stays clean,
// and inserting its own base constructor body must not read the one `M` never got.
// ASSERT: scan error: Objective-C mirror property type must be Objective-C compatible
// ASSERT: scan-not Internal Compiler Error

import objc.lang.*

@ObjCMirror
public open class M {
    init()
    public prop bad: Array<Int64>
}

@ObjCMirror
public open class N <: M {
    init()
}
