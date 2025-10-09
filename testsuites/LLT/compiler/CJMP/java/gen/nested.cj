// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop -L.
// (CJNATIVE and not Windows) RUN-EXEC-PIPE: %cat ./java-gen/A.java | compare %f

/* SCAN-IN
import other.Cla$s;
import static cangjie.lang.LibraryLoader.loadLibrary;
import cangjie.lang.internal.$$NativeConstructorMarker;

public class A extends Cla$s.Inner {
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

    public Clas$.Inner.InnerCla$s useTypes(Clas$ a1, Clas$.Inner a2, Cla$s a3, Cla$s.Inner.InnerCla$s a4) {
        return useTypesCN16cjworld_theworld5OuterECN16cjworld_theworld5InnerECN16cjworld_theworld17OtherPackageOuterECN16cjworld_theworld15OtherInnerInnerE(this.self, a1, a2, a3, a4);
    }

    public native Clas$.Inner.InnerCla$s useTypesCN16cjworld_theworld5OuterECN16cjworld_theworld5InnerECN16cjworld_theworld17OtherPackageOuterECN16cjworld_theworld15OtherInnerInnerE(long self, Clas$ a1, Clas$.Inner a2, Cla$s a3, Cla$s.Inner.InnerCla$s a4);

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

@JavaMirror["Clas\\$"]
public open class Outer {
    init()
}

@JavaMirror["Clas\\$$Inner"]
public open class Inner {
    init()
}

@JavaMirror["Clas\\$$Inner$InnerCla\\$s"]
public open class InnerInner {
    init()
}

@JavaMirror["other.Cla\\$s"]
public open class OtherPackageOuter {
    init()
}

@JavaMirror["other.Cla\\$s$Inner"]
public open class OtherInner {
    init()
}

@JavaMirror["other.Cla\\$s$Inner$InnerCla\\$s"]
public open class OtherInnerInner {
    init()
}

@JavaImpl["A"]
public class A <: OtherInner {
    init() {
        super()
        println("Hello from Cangjie!")
    }

    public func useTypes(a1: Outer, a2: Inner, a3: OtherPackageOuter, a4: OtherInnerInner): InnerInner {
        return InnerInner()
    }
}
