// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop -L.
// (CJNATIVE and not Windows) RUN-EXEC-PIPE: %cat ./Impl.java | compare %f

/* SCAN-IN
package cj;

import com.java.lib.MyObject;
import static cangjie.lang.LibraryLoader.loadLibrary;
import cangjie.lang.internal.$$NativeConstructorMarker;

public class Impl extends MyObject {
    static {
        loadLibrary("cj");
    }

    long self;

    public Impl() {
        super(1);
        self = initCJObject();
    }

    private Impl($$NativeConstructorMarker __init__) {
        super(1);
    }

    public native long initCJObject();

    public Impl(long value) {
        super(superC1A0P0(value));
        self = initCJObjectl(value);
    }

    private Impl(long value, $$NativeConstructorMarker __init__) {
        super(superC1A0P0(value));
    }

    public native long initCJObjectl(long value);

    public static native long superC1A0P0(long value);
    public Impl(long x, long y) {
        super(superC2A0P0P1(x, y));
        self = initCJObjectll(x, y);
    }

    private Impl(long x, long y, $$NativeConstructorMarker __init__) {
        super(superC2A0P0P1(x, y));
    }

    public native long initCJObjectll(long x, long y);

    public static native long superC2A0P0P1(long x, long y);
    public Impl(long x, long y, long z) {
        super(superC3A0P0P1P2(x, y, z));
        self = initCJObjectlll(x, y, z);
    }

    private Impl(long x, long y, long z, $$NativeConstructorMarker __init__) {
        super(superC3A0P0P1P2(x, y, z));
    }

    public native long initCJObjectlll(long x, long y, long z);

    public static native long superC3A0P0P1P2(long x, long y, long z);
    public Impl(long x, long y, long z, long u) {
        super(superC4A0P0P1P2P3(x, y, z, u));
        self = initCJObjectllll(x, y, z, u);
    }

    private Impl(long x, long y, long z, long u, $$NativeConstructorMarker __init__) {
        super(superC4A0P0P1P2P3(x, y, z, u));
    }

    public native long initCJObjectllll(long x, long y, long z, long u);

    public static native long superC4A0P0P1P2P3(long x, long y, long z, long u);
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

package cj

import java.lang.*

@JavaMirror["com.java.lib.MyObject"]
public open class MyObject {
    public init(value: Int64)
    public open func getValue(): Int64
}

var gv: Int64 = 1

func gf(x: Int64): Int64 {
    x + 1
}

@JavaImpl
public class Impl <: MyObject {
    public init() {
        super(1)
    }

    public init(value: Int64) {
        super(value + 1)
    }

    public init(x: Int64, y: Int64) {
        super(y + x)
    }

    public init(x: Int64, y: Int64, z: Int64) {
        super(y + x + gv + gf(z))
    }

    public init(x: Int64, y: Int64, z: Int64, u: Int64) {
        super(if (x > y) {x} else {y} + match {
            case z > u => u
            case u > z => z
            case _ => u
        })
    }
}

