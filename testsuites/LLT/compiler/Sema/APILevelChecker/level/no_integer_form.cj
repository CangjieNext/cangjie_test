// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Scenario: the user's installed OHOS SDK still ships the LEGACY apilevel.cj
// stub whose constructor is 'init(level!: Int64, ...)'. The integer-form
// invocation @!APILevel[level: N] typechecks fine against that stub because
// 'level!: Int64' accepts an Int64 named argument, but issue #824 deprecates
// this form. The compiler must still surface sema_apilevel_integer_form_unsupported
// (ERROR) so users see the migration path to @!APILevel[since: "X.Y.Z"] even
// before their SDK upgrade.

// DEPENDENCE: apilevel_legacy.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt apilevel_legacy.cj -o apilevel_legacy.%middle
// ERRCHECK: %compiler %cmp_opt %diag_json apilevel_legacy.%middle %f -o %output

import ohos.labels.*

@!APILevel[level: 20]
public func f1() {}

@!APILevel[level: 20, atomicservice: true]
public func f2() {}

@!APILevel[level: 20, permission: "ohos.permission.GET_NETWORK_INFO" & "ohos.permission.INTERNET", atomicservice: true]
public func f3() {}

@!APILevel[level: 20, syscap: "SystemCapability.Communication.NetStack", atomicservice: true]
public func f4() {}

main(): Int64 {
    0
}

// ASSERT: scan-4 sema_apilevel_integer_form_unsupported
