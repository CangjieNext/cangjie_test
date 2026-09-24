// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// ERRCHECK: %frontendCompiler %f -Woff all %diag_json 2>&1

open class C {
    init() {}
    init(this @local!) { exclave { } }
}

// The result mode of an enum constructor call follows the expected type, which must not make an
// argument whose own mode does not fit the constructor parameter acceptable.
func notLocalArg(c: C @~local) {
    let v: ?C @local! = Some(c)
}

// A call-site modal narrower than the expected type cannot satisfy it.
func halfCtorCall() {
    let v: ?Int64 @local! = Some(1) @local?
}

// A call-site modal wider than the expected type cannot satisfy it either.
func fullCtorCallToNotTarget() {
    let v: ?Int64 = Some(1) @local!
}

main() {}

// ASSERT: scan-2 "DiagKind": "sema_mismatched_types",
// ASSERT: scan "Errors": 3,
