// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
 
// (CJNATIVE and not Windows) EXEC: mkdir java
// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f --output-javagen-dir=./java --export-java-path=./ %compile_shared_lib_opt %import_java_interop -L. 2>&1 | compare %f
// (CJNATIVE and not Windows) ASSERT: scan warning: option '--output-javagen-dir' is deprecated and will be removed in future, use '--export-java-path' instead.
// (CJNATIVE and not Windows) ASSERT: scan error: Deprecated '--output-javagen-dir' option is used at the same time with '--export-java-path' recommended one. Use one of them.

package cjworld.theworld

import interoplib.interop.*
import java.lang.JObject

@JavaMirror["M"]
public open class M {
    init()
}

@JavaImpl["A"]
public class A <: M {
    init() {
        super()
        println("Hello from Cangjie!")
    }
}
