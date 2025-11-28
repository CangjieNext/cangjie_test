// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop -L.
// (CJNATIVE and not Windows) RUN-EXEC-PIPE: %cat ./CangjieInvoke_Father.java | compare %f

/* SCAN-IN
import static cangjie.lang.LibraryLoader.loadLibrary;
import cangjie.lang.internal.$$NativeConstructorMarker;

public class CangjieInvoke_Father {
    static {
        loadLibrary("cjworld.theworld");
    }

    long self;

    public CangjieInvoke_Father() {
        super();
        self = initCJObject();
    }

    private CangjieInvoke_Father($$NativeConstructorMarker __init__) {
        super();
    }

    public native long initCJObject();

    public boolean test() {
        return test(this.self);
    }

    public native boolean test(long self);

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

@JavaImpl
public class CangjieInvoke_Father <: JObject {
    public init() {}

    public func test(): Bool {
        println("in CangjieInvoke_Father Func")
        false
    }
}

@JavaImpl
public class CangjieInvoke <: JObject {
    public init() {
        println("in CangjieInvoke Init")
    }

    public func test() {
        println("in CangjieInvoke Func")
        return CangjieInvoke_Father().test()
    }
}
