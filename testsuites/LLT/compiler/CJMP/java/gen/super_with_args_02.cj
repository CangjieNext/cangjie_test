// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC: %mkdir java-gen
// (CJNATIVE and not Windows) EXEC: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop -L.
// (CJNATIVE and not Windows) RUN-EXEC-PIPE: %cat ./java-gen/Impl.java | compare %f

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
        super(superC0A0());
        self = initCJObject();
    }

    private Impl($$NativeConstructorMarker __init__) {
        super(superC0A0());
    }

    public native long initCJObject();

    public static native long superC0A0();
    public Impl(long value) {
        super(superC1A0P0(value));
        self = initCJObjectl(value);
    }

    private Impl(long value, $$NativeConstructorMarker __init__) {
        super(superC1A0P0(value));
    }

    public native long initCJObjectl(long value);

    public static native MyObject superC1A0P0(long value);
    public Impl(long x, long y) {
        super(superC2A0P0P1(x, y));
        self = initCJObjectll(x, y);
    }

    private Impl(long x, long y, $$NativeConstructorMarker __init__) {
        super(superC2A0P0P1(x, y));
    }

    public native long initCJObjectll(long x, long y);

    public static native Impl superC2A0P0P1(long x, long y);
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
    public init(value: MyObject)
    public open func getValue(): Int64
}

@JavaImpl
public class Impl <: MyObject {
    public init() {
        // Primitive argument
        super(2 + 3)
    }

    public init(value: Int64) {
        // JavaMirror argument
        super(MyObject(value))
    }

    public init(x: Int64, y: Int64) {
        // JavaImpl argument
        super(Impl(x * y))
    }
}


