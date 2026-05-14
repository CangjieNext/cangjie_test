// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Negative coverage: the legacy positional integer form `@!APILevel[N]` is no
// longer accepted by the new spec. Only the named `since: "x.y.z"` form is
// supported. Each occurrence emits `sema_need_named_argument` (ERROR) because
// the first positional argument cannot be coerced into a `since:` value.

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

main(): Int64 {
    0
}

// ASSERT: scan-3 sema_need_named_argument
