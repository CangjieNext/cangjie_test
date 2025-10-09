/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// LEVEL: 3
// DEPENDENCE: Main.java com
// (not Windows and Android) EXEC: %java %java_mirror_gen com.JavaClass
// (not Windows and Android) EXEC: %compiler %cmp_opt %compile_dylib_opt %jffi_link %f UNNAMED/src/*.cj --output-javagen-dir=.
// (not Windows and Android) EXEC-1: %javac %cp_loader_jar Main.java com/*.java CangjieInvoke.java -h . -d .

// 不支持extend

package UNNAMED

import interoplib.interop.*
import java.lang.*

@JavaImpl
public class CangjieInvoke <: JObject {
    public init() {}
}

interface I {
    public func test() {
        println("run cj")
        return JavaClass().test() || true
    }
}

extend CangjieInvoke <: I {}
