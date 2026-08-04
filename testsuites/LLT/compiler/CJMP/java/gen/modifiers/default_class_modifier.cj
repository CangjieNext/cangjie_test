// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC: %mkdir java-gen
// (CJNATIVE and not Windows) EXEC: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop -L.
// (CJNATIVE and not Windows) RUN-EXEC-PIPE: %cat ./java-gen/A.java | compare %f

// Checks that @JavaImpl class with default modifier is still exported to java.

/* SCAN-IN
import static cangjie.lang.LibraryLoader.loadLibrary;
import cangjie.lang.internal.$$NativeConstructorMarker;

final class A extends M {
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

    private native void deleteCJObject(long $rid);

    @Override
    public void finalize() {
        deleteCJObject(this.$rid);
    }
}

*/

package cjworld.theworld

import java.lang.JObject

@JavaMirror["M"]
public open class M {
    init()
}

@JavaImpl["A"]
class A <: M {
    public init() {
        super()
    }
}
