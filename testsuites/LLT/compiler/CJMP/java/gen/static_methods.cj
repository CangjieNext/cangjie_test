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

    A() {
        super(1);
        self = initCJObject();
    }

    private A($$NativeConstructorMarker __init__) {
        super(1);
    }

    public native long initCJObject();

    A(long f, int x) {
        super(superC3A0P0P1(f, x));
        self = initCJObjectli(f, x);
    }

    private A(long f, int x, $$NativeConstructorMarker __init__) {
        super(superC3A0P0P1(f, x));
    }

    public native long initCJObjectli(long f, int x);

    public static native long superC3A0P0P1(long f, int x);
    A(long f) {
        super(superC4A0P0(f));
        self = initCJObjectl(f);
    }

    private A(long f, $$NativeConstructorMarker __init__) {
        super(superC4A0P0(f));
    }

    public native long initCJObjectl(long f);

    public static native long superC4A0P0(long f);
    public static long fieldInitStatic(long f, int x) {
        return fieldInitStaticli(f, x);
    }

    public static native long fieldInitStaticli(long f, int x);

    public static long fieldInitStatic(long f) {
        return fieldInitStaticl(f);
    }

    public static native long fieldInitStaticl(long f);

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
    init(x: Int)
    init(x: Int, y: Int)
}

@JavaImpl["A"]
public class A <: M {
    init() {
        super(1)
        println("Hello from Cangjie!")
    }

    public static func fieldInitStatic(f: Int64, x: Int32): Int64 {
        f * 2
    }

    public static func fieldInitStatic(f: Int64): Int64 {
        f * 3
    }

    init(f: Int64, x: Int32) {
        super(fieldInitStatic(f, x))
    }

    init(f: Int64) {
        super(fieldInitStatic(f))
    }
}
