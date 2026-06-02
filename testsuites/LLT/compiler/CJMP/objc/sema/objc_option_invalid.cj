// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_objc_interop 2>& 1 | compare %f
// ASSERT: scan-3 error: return type of Objective-C mirror method must be Objective-C compatible
// ASSERT: scan-3 error: param type of Objective-C mirror method must be Objective-C compatible
// ASSERT: scan 6 errors generated, 6 errors printed

import objc.lang.*

@ObjCMirror
public class M {
    init()

    @ForeignName["PrimitiveOptionRet"]
    public func PrimitiveOptionRet(): Option<UInt64>

    @ForeignName["NonCompatibleOptionType"]
    public func NonCompatibleOptionType(): Option<A>

    @ForeignName["PrimitiveOptionArg"]
    public func PrimitiveOptionArg(x: Option<UInt64>): Unit

    @ForeignName["NonCompatibleOptionTypeArg"]
    public func NonCompatibleOptionTypeArg(x: Option<A>): Unit

    @ForeignName["NestedOptionArg"]
    public func NestedOptionArg(x: Option<Option<M>>): Unit

    @ForeignName["NestedOptionRet"]
    public func NestedOptionRet(): Option<Option<M>>
}

public class A {}