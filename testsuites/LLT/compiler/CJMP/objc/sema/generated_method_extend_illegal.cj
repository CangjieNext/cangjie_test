// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_objc_interop 2>& 1 | compare %f
// ASSERT: scan error: extend member 'toString' is not allowed to shadow members of 'Class-NSString'
// ASSERT: scan error: extend member 'toString' is not allowed to shadow members of 'Class-OtherString'

package cjworld

import objc.lang.*

@ObjCMirror
open public class NSObject {
    public init()
}

@ObjCMirror
public class NSString <: NSObject {
    public init()
}

extend NSString {
    func toString(): String {
        return ""
    }
}

@ObjCMirror
public class OtherString <: NSObject {
    public init()
}

extend OtherString {
    func toString(): String {
        return ""
    }
}
