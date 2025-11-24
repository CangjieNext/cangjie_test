// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_objc_interop 2>& 1 | compare %f
// ASSERT: scan error: unexpected annotation '@ObjCOptional' on var
// ASSERT: scan error: unexpected annotation '@ObjCOptional' on class
// ASSERT: scan error: @ObjCOptional method must be declared within '@ObjCMirror' class
// ASSERT: scan 3 errors generated, 3 errors printed

import objc.lang.*

@ObjCMirror
public class M {
    init()

    @ObjCOptional // must be func
    var a: UInt64
}

@ObjCOptional // must be func
public class B {
    @ObjCOptional // must be inside @ObjCMirror class
    func foo(): Unit
}
