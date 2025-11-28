// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
 
// (CJNATIVE and not Windows) EXEC: mkdir java
// (CJNATIVE and not Windows) EXEC: %compiler %cmp_opt %f --output-dir=./java %compile_shared_lib_opt %import_java_interop -L.
// (CJNATIVE and not Windows) RUN-EXEC-PIPE: %cat java/A.java | compare %f
 
/* SCAN-IN
package cjworld.theworld;


import static cangjie.lang.LibraryLoader.loadLibrary;
import cangjie.lang.internal.$$NativeConstructorMarker;

public class A extends M {
    static {
        loadLibrary("cjworld.theworld");
    }

    long self;

    A() {
        super();
        self = initCJObject();
    }

    private A($$NativeConstructorMarker __init__) {
        super();
    }

    public native long initCJObject();

    @Override
    public boolean equals(Object obj) {
        throw new UnsupportedOperationException("equals is not supported for java proxy object.");
    }

    @Override
    public int hashCode() {
        throw new UnsupportedOperationException("hashCode is not supported for java proxy object.");
    }

    @Override
    public String toString() {
        throw new UnsupportedOperationException("toString is not supported for java proxy object.");
    }

    public native void deleteCJObject(long self);

    @Override
    public void finalize() {
        deleteCJObject(this.self);
    }
}

*/
 
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
