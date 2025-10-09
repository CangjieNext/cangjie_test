/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// LEVEL: 3
// DEPENDENCE: Main.java com 
// (not Windows and Android) EXEC: %java %java_mirror_gen com.Interface01
// (not Windows and Android) EXEC-PIPE-1: %compiler %cmp_opt %compile_dylib_opt %jffi_link %f UNNAMED/src/*.cj --output-javagen-dir=. 2>&1 | compare %f
// (not Windows and Android) ASSERT: scan parse_java_impl_cannot_be_open

package UNNAMED

import interoplib.interop.*
import java.lang.*

@JavaImpl
open public class Father {}

@JavaImpl
public class CangjieInvoke <: Interface01 {
    public init() {}

    public func foo(): Interface01 {
        this
    }
}