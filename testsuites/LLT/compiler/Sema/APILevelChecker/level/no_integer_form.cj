// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Negative coverage: @!APILevel no longer accepts integer version literals (issue #824).
// The compiler emits sema_apilevel_integer_form_unsupported (ERROR) for both the
// positional form @!APILevel[N] and any usage like @!APILevel[since: N]. Generic
// diagnostics such as sema_need_named_argument or sema_mismatched_types may also
// fire as secondary signals but are not what we assert on.

// DEPENDENCE: apilevel.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt apilevel.cj -o apilevel.%middle
// ERRCHECK: %compiler %cmp_opt %diag_json apilevel.%middle %f -o %output

import ohos.labels.*

@!APILevel[20]
public func f1() {}

@!APILevel[20, atomicservice: true]
public func f2() {}

@!APILevel[20, permission: "ohos.permission.GET_NETWORK_INFO" & "ohos.permission.INTERNET", atomicservice: true]
public func f3() {}

@!APILevel[since: 20]
public func f4() {}

main(): Int64 {
    0
}

// ASSERT: scan-4 sema_apilevel_integer_form_unsupported
