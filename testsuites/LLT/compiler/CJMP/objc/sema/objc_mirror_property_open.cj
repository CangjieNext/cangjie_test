// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-0: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_objc_interop 2>& 1 | compare %f
// ASSERT: scan-not error

package cjworld

import objc.lang.*

@ObjCMirror
open class Base {
    init()
    public open prop a: Int64
    public open prop b: Int64
}

@ObjCMirror
class Derived <: Base {
    init()
    public prop a: Int64
    public override prop b: Int64
}
