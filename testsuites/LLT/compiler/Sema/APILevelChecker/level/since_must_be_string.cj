// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Negative coverage: 'since:' must be a String. This file covers non-Int non-String
// literal values (Bool, Float); the legacy Int form is intentionally NOT here, it is
// covered separately by no_integer_form.cj which asserts the dedicated
// sema_apilevel_integer_form_unsupported diagnostic. String-format errors live in
// invalid_version_format.cj; non-literal values live in non_literal.cj.

// DEPENDENCE: apilevel.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt apilevel.cj -o apilevel.%middle
// ERRCHECK: %compiler %cmp_opt %diag_json apilevel.%middle %f -o %output

import ohos.labels.*

@!APILevel[since: true]
public func f1() {}

@!APILevel[since: 1.5]
public func f2() {}

main(): Int64 {
    0
}

// ASSERT: scan-2 sema_cannot_convert_literal
