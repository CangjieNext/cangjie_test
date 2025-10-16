// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-0: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop 2>& 1 | compare %f

import interoplib.interop.*
import java.lang.JObject

@JavaMirror
class M1 {
    @ForeignName["fooJava"]
    public open func foo(): Unit
}

@JavaMirror
interface I {
    @ForeignName["fooJava"]
    public open func foo(): Unit
}

@JavaMirror
abstract class A {
    @ForeignName["fooJava"]
    public open func foo(): Unit
}

@JavaMirror
interface I1 {
    @ForeignName["bar"]
    func foo(): Unit 
}

@JavaMirror
interface I2 {
    @ForeignName["bar"]
    func foo(): Unit 
}

@JavaMirror
open class M2 {
    @ForeignName["bar"]
    public open func foo(): Unit
}

@JavaMirror
open class M3 <: M2 & I1 & I2 {
}

@JavaMirror
open class M4 <: M2 & I1 & I2 {
    public open override func foo(): Unit
}

// ASSERT: scan-not error
