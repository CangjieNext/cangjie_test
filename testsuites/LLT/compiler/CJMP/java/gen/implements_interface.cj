// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop -L.
// (CJNATIVE and not Windows) RUN-EXEC-PIPE: %cat ./C2.java | compare %f
// (CJNATIVE and not Windows) ASSERT: regex public class C2 implements I2, I3 {|public class C2 implements I3, I2 {

/* SCAN-IN
import static cangjie.lang.LibraryLoader.loadLibrary;
import cangjie.lang.internal.$$NativeConstructorMarker;
*/


/* SCAN-IN
    static {
        loadLibrary("cjworld.theworld");
    }

    long self;

    public C2() {
        super();
        self = initCJObject();
    }

    private C2($$NativeConstructorMarker __init__) {
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

@JavaMirror
public interface I2 {
    func test(): Bool
}

@JavaMirror
public interface I3 {
    func test(): Bool
}

@JavaImpl
public class C2 <: I2 & I3 {
    public init() {
        println("in C2 Init")
    }

    public func test() {
        println("in C2 Func")
        return false
    }
}
