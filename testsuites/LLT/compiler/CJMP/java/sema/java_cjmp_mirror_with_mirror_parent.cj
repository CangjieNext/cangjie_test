// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Test: @JavaMirror inheriting from another @JavaMirror (specific with common)
// Scenario: Common has Base class, specific @JavaMirror mirrors Java class,
//           another specific @JavaMirror inherits from the first mirror
// Expected: Success - Mirror-to-mirror inheritance works

// SEPARATE-FILE: c/testpkg.cj
// EXEC-0: %compiler %cmp_opt %experimental_opt c/testpkg.cj --output-type=chir --output-dir ./c %import_java_interop
package testpkg

common open class Base {
    common init()
    common func getMessage(): ?String
}

public common class Derived {
    common public init() {}
    common func getValue(): Int64
}

// SEPARATE-FILE: p/testpkg.cj
// (CJNATIVE and not Windows) EXEC-PIPE-0: %compiler %cmp_opt %experimental_opt p/testpkg.cj --common-part-chir=c/testpkg.chir --common-part-cjo=./c/testpkg.cjo --output-type=dylib --output-dir ./p %import_java_interop 2>& 1 | compare %f
// ASSERT: scan-not error
package testpkg

import java.lang.*

@JavaMirror["java.lang.Exception"]
specific open class Base {
    specific init()
    init(msg: String)
    specific func getMessage(): ?String
}

@JavaMirror["com.example.DerivedException"]
public specific class Derived <: Base {
    specific public init()
    specific func getValue(): Int64
}
