/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// LEVEL: 3
// DEPENDENCE: Main.java com UNNAMED
// (not Windows and Android) EXEC: %javac com/*.java
// (not Windows and Android) EXEC: %compiler %cmp_opt %compile_dylib_opt %jffi_link %f UNNAMED/src/*.cj --output-javagen-dir=.
// (not Windows and Android) EXEC: %javac %cp_loader_jar Main.java com/*.java Impl.java -h . -d .
// (not Windows and Android) EXEC-PIPE: %java %cp_loader_jar -Djava.library.path=. Main 2>&1 | compare %f
// (not Windows and Android) ASSERT: scan-2 Hello from instance func
// (not Windows and Android) ASSERT: scan Java: static func
// (not Windows and Android) ASSERT: scan abstractFunc()
// (not Windows and Android) ASSERT: scan-2 id match: ok
// (not Windows and Android) ASSERT: scan cast to ImplAbstractMirror: abstractFunc()

package UNNAMED

import java.lang.JObject

@JavaImpl
public class Impl <: JObject {
    public init() {
        let i = ImplAbstractMirror()
        let res = i.id(i)
        ImplAbstractMirror.staticFunc()

        match (res) {
            case AbstractMirror => println("id match: ok")
            case ImplAbstractMirror => println("id match: failed")
            case _ => println("id match: unexpected case")
        }

        match (res) {
            case ImplAbstractMirror => println("id match: ok")
            case AbstractMirror => println("id match: failed")
            case _ => println("id match: unexpected match")
        }

        res.abstractFunc()
        print("cast to ImplAbstractMirror: ", flush: true)
        (res as ImplAbstractMirror)?.abstractFunc()

        let res2 = i.idImpl(i)
    }
}
