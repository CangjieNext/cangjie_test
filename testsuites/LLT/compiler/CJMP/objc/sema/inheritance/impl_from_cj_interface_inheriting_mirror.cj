// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_objc_interop 2>& 1 | compare %f
// ASSERT: scan-1 error: interface inheriting @ObjCMirror interface must be annotated with @ObjCMirror
// ASSERT: scan-1 error: @ObjCImpl declaration must inherit @ObjCMirror
// ASSERT: scan 2 errors generated, 2 errors printed

import objc.lang.*

@ObjCMirror
public interface I {
    func f1(): Unit
}

@ObjCMirror
open class M {
    init()
}

@ObjCImpl
public class A <: M & B {
    public init() {}
}

public interface B <: I {
    func f1() { println("in cj f1") }
}
