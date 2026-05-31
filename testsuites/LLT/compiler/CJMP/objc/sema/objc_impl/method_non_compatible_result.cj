// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_objc_interop 2>& 1 | compare %f

import objc.lang.*

@ObjC
public open foreign class Base {
    public init()
    public open func arg0(): Bool
    @ForeignName["primitive1WithArg0:"]
    public open func primitive1(i: Int64): Int64
    @ForeignName["primitive2WithArg0:withArg1:"]
    public open func primitive2(i: Int64, f: Float32): Int64
    @ForeignName["primitive3WithArg0:withArg1:withArg2:"]
    public open func primitive3(i: Int64, f: Float32, b: Bool): Int64
}

@ObjC
public class Derived <: Base {
    public init() {}
    public func foo(): String {
        "Hello"
    }
}

/* SCAN-IN
error: return type of @ObjC class method must be Objective-C compatible
  ==> method_non_compatible_result.cj:26:24:
   | 
26 |     public func foo(): String {
   |                        ^^^^^^ 
   | 

1 error generated, 1 error printed.
*/
