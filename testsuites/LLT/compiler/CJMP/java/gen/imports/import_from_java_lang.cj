// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop -L.
// (CJNATIVE and not Windows) RUN-EXEC-PIPE: %cat ./A.java | compare %f

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

    A(long x) {
        super(x, x);
        self = initCJObjectl(x);
    }

    private A(long x, $$NativeConstructorMarker __init__) {
        super(x, x);
    }

    public native long initCJObjectl(long x);

    public void f(String arg) {
        fCN9java_lang7JStringE(this.self, arg);
    }

    public native void fCN9java_lang7JStringE(long self, String arg);

    public void oneArg(long x) {
        oneArgl(this.self, x);
    }

    public native void oneArgl(long self, long x);

    public void twoArgs(long x, boolean y) {
        twoArgslb(this.self, x, y);
    }

    public native void twoArgslb(long self, long x, boolean y);

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
import java.lang.JString

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
    init(x: Int) {
        super(x, x)
    }

    func f(arg: JString) {
        println(1)
    }

    func oneArg(x: Int) {
        println(x)
    }

    func twoArgs(x: Int, y: Bool) {
        println(x)
        println(y)
    }
}
