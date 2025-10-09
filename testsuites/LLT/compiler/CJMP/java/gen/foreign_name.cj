// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC: %mkdir java-gen
// (CJNATIVE and not Windows) EXEC: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop -L.
// (CJNATIVE and not Windows) RUN-EXEC-PIPE: %cat ./java-gen/A.java | compare %f

/* SCAN-IN
import static cangjie.lang.LibraryLoader.loadLibrary;
import cangjie.lang.internal.$$NativeConstructorMarker;

public class A extends M {
    static {
        loadLibrary("cjworld.theworld");
    }

    long self;

    public A() {
        super();
        self = initCJObject();
    }

    private A($$NativeConstructorMarker __init__) {
        super();
    }

    public native long initCJObject();

    public static native int foo();

    public int bar() {
        return bar(this.self);
    }

    public native int bar(long self);

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
    public init()

    @ForeignName["id"]
    public prop myId: Int32

    @ForeignName["foo"]
    public static func myFoo(): Int32

    @ForeignName["bar"]
    public open func myBar(): Int32
}

@JavaImpl["A"]
public class A <: M {
    public init() {
        super()
    }

    public static func myFoo(): Int32 { return 0; }

    public open func myBar(): Int32 {
        return 0;
    }
}
