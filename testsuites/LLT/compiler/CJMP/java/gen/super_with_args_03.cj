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

    public Impl(long value) {
        super(superC0A0P0(value));
        self = initCJObjectl(value);
    }

    private Impl(long value, $$NativeConstructorMarker __init__) {
        super(superC0A0P0(value));
    }

    public native long initCJObjectl(long value);

    public static native long superC0A0P0(long value);
    public Impl(MyObject value) {
        super(superC1A0P0(value));
        self = initCJObjectCN2cj8MyObjectE(value);
    }

    private Impl(MyObject value, $$NativeConstructorMarker __init__) {
        super(superC1A0P0(value));
    }

    public native long initCJObjectCN2cj8MyObjectE(MyObject value);

    public static native MyObject superC1A0P0(MyObject value);
    public Impl(Impl value) {
        super(superC2A0P0(value));
        self = initCJObjectCN2cj4ImplE(value);
    }

    private Impl(Impl value, $$NativeConstructorMarker __init__) {
        super(superC2A0P0(value));
    }

    public native long initCJObjectCN2cj4ImplE(Impl value);

    public static native Impl superC2A0P0(Impl value);
    public Impl(String value) {
        super(superC3A0P0(value));
        self = initCJObjectCN9java_lang7JStringE(value);
    }

    private Impl(String value, $$NativeConstructorMarker __init__) {
        super(superC3A0P0(value));
    }

    public native long initCJObjectCN9java_lang7JStringE(String value);

    public static native String superC3A0P0(String value);
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
    public init(value: JString)
    public open func getValue(): String
}

func id<T>(x: T): T {
    x
}

func idMyObject(x: MyObject): MyObject { x }
func idImpl(x: Impl): Impl { x }
func idJString(x: JString): JString { x }

@JavaImpl
public class Impl <: MyObject {
    public init(value: Int64) {
        // Primitive argument
        super(id(value))
    }

    public init(value: MyObject) {
        // JavaMirror argument
        super(idMyObject(value))
    }

    public init(value: Impl) {
        // JavaImpl argument
        super(idImpl(value))
    }

    public init(value: JString) {
        // String
        super(idJString(value))
    }
}

