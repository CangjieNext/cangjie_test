// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
 
// (CJNATIVE and not Windows) EXEC: %compiler %cmp_opt %f -o %output --output-javagen-dir=./test %compile_shared_lib_opt %import_java_interop -L.
// ASSERT: scan warning: --output-javagen-dir option is deprecated, it will be removed in future. Use --export-java-path instead.

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
