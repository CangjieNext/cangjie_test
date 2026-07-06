// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Test: Regular @JavaMirror (no common counterpart) with auto-JObject parent
// Scenario: @JavaMirror defined as regular class in specific file, no common class exists
// Expected: Success - Regular mirror class works without CJMP pair

// (CJNATIVE and not Windows) EXEC-PIPE-0: mkdir -p p && %compiler %cmp_opt %experimental_opt %f %import_java_interop --output-type=dylib --output-dir ./p 2>& 1 | compare %f
// ASSERT: scan-not error
package testpkg

import java.lang.*

@JavaMirror["com.example.RegularMirror"]
public class RegularMirror {
    public init()
    public func getValue(): Int64
}
