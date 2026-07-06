// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Test: Three-level inheritance: common → specific @JavaMirror → specific @JavaImpl
// Scenario: Common Base class, specific @JavaMirror mirrors Java class,
//           specific @JavaImpl inherits from the specific @JavaMirror
// Expected: Success - Multi-level CJMP FFI inheritance works

// SEPARATE-FILE: c/testpkg.cj
// EXEC-0: %compiler %cmp_opt %experimental_opt c/testpkg.cj --output-type=chir --output-dir ./c %import_java_interop
package testpkg

common open class Base {
    common init()
    common func baseMethod(): Int64
}

public common class Derived {
    common public init() {}
    public func derivedMethod(): Int64 { 88 }
}

// SEPARATE-FILE: p/testpkg.cj
// (CJNATIVE and not Windows) EXEC-PIPE-0: %compiler %cmp_opt %experimental_opt p/testpkg.cj --common-part-chir=c/testpkg.chir --common-part-cjo=./c/testpkg.cjo --output-type=dylib --output-dir ./p %import_java_interop 2>& 1 | compare %f
// ASSERT: scan-not error
package testpkg

import java.lang.*

@JavaMirror
specific open class Base {
    specific init()
    specific func baseMethod(): Int64
}

@JavaImpl
public specific class Derived <: Base {
    specific public init() { super() }
}