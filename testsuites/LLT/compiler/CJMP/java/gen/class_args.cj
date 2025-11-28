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

    public M getT() {
        return getTImpl(this.self);
    }

    public native M getTImpl(long self);

    public void setT(M t) {
        setTImpl(this.self, t);
    }

    public native void setTImpl(long self, M t);

    A(long x, long y) {
        super();
        self = initCJObjectll(x, y);
    }

    private A(long x, long y, $$NativeConstructorMarker __init__) {
        super();
    }

    public native long initCJObjectll(long x, long y);

    A() {
        super(superC3A0(), superC3A1());
        self = initCJObject();
    }

    private A($$NativeConstructorMarker __init__) {
        super(superC3A0(), superC3A1());
    }

    public native long initCJObject();

    public static native A superC3A0();
    public static native M superC3A1();
    A(int x) {
        super(superC4A0());
        self = initCJObjecti(x);
    }

    private A(int x, $$NativeConstructorMarker __init__) {
        super(superC4A0());
    }

    public native long initCJObjecti(int x);

    public static native A superC4A0();
    public void f(M arg) {
        fCN16cjworld_theworld1ME(this.self, arg);
    }

    public native void fCN16cjworld_theworld1ME(long self, M arg);

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
    init(x: M)
    init(x: A, y: M)
}

@JavaImpl["A"]
public class A <: M {
    private var a: M = M()
    mut prop t: M {
        get() {
            return a
        }
        set(x) {
            a = x
        }
    }

    init (x: Int64, y: Int64) {}

    init() {
        super(A(1, 1), M())
    }

    init(x: Int32) {
        super(A())
    }

    func f(arg: M) {

    }
}
