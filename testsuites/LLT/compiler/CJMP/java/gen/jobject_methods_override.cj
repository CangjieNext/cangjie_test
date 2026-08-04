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

public final class A {
    static {
        loadLibrary("cjworld.theworld");
    }

    private long $rid;

    public A() {
        super();
        initCJObject();
    }

    private A($$NativeConstructorMarker __init__) {
        super();
    }

    private native void initCJObject();

    @Override
    public int hashCode() {
        return hashCode(this.$rid);
    }

    private native int hashCode(long $rid);

    @Override
    public boolean equals(Object obj) {
        return equalsNNat6OptionICN9java_lang7JObjectEE(this.$rid, obj);
    }

    private native boolean equalsNNat6OptionICN9java_lang7JObjectEE(long $rid, Object obj);

    @Override
    public String toString() {
        return toString(this.$rid);
    }

    private native String toString(long $rid);

    private native void deleteCJObject(long $rid);

    @Override
    public void finalize() {
        deleteCJObject(this.$rid);
    }
}

*/

package cjworld.theworld

import java.lang.*

@JavaImpl["A"]
public class A {
    public override func hashCode32(): Int32 {
        return 42
    }

    public override func equals(obj: ?JObject): Bool {
        return true
    }

    public override func toJString(): JString {
        return JString("Hello, World!")
    }
}
