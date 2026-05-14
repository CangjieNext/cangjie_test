// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Boundary value coverage for @!APILevel since format validation.
// Positive cases ("1","99","5.0.0","5.99.99") must compile cleanly.
// Negative cases ("0","100","5.0.100","") must emit sema_apilevel_invalid_version_format (error).

// DEPENDENCE: apilevel.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt apilevel.cj -o apilevel.%middle
// ERRCHECK: %compiler %cmp_opt %diag_json apilevel.%middle %f -o %output --cfg=APILevel_level=24
// ASSERT: scan-4 sema_apilevel_invalid_version_format

import ohos.labels.*

// Positive: valid boundary values (no diagnostic expected for these)
@!APILevel[since: "1"]
public func fBoundLow() {}

@!APILevel[since: "99"]
public func fBoundHigh() {}

@!APILevel[since: "5.0.0"]
public func fTripleLow() {}

@!APILevel[since: "5.99.99"]
public func fTripleHigh() {}

// Negative: out-of-range or malformed values -- each emits sema_apilevel_invalid_version_format
@!APILevel[since: "0"]
public func fZero() {}

@!APILevel[since: "100"]
public func fOver100() {}

@!APILevel[since: "5.0.100"]
public func fPatchOver() {}

main(): Int64 {
    // empty-string level: invalid_version_format (4th) + use-without-import error => exit 1
    @IfAvailable(level: "", { => 1 }, { => 0 })
    0
}
