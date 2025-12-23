// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %diag_json --error-count-limit=all %f -o %output 2>&1 | compare %f

class D {
    var v = 1
    init() {}
    init(this @local!) { exclave {} }
    init(this @local?) { exclave {} }
}
class C {
    var d: D
    init() { d = D() }
    init(this @local!) { exclave { d = D() } }
    init(this @local?) { exclave { d = D@local?() } }

    // --- this. access: @local? lvalue outside @local? ctor/finalizer ---
    func assignThisDotBad(this @local?) {
        var x: D@local? = D()
        this.d = x
    }

    // --- implicit this: @local? lvalue outside @local? ctor/finalizer ---
    func assignImplicitThisBad(this @local?) {
        var x: D@local? = D@local?()
        d = x
    }
}

// Class with a mutable property for object.prop tests
class E {
    var f: D
    init() { f = D() }
    init(this @local!) { exclave { f = D() } }
    mut prop p: D {
        get() {f }
        set(v) { f = v }
    }
}

// --- object.field: @~local base cannot receive @local? ---
func testObjectFieldNotBaseReceiveHalf() {
    var c: C@~local = C()
    var d: D@local? = D@local?()
    c.d = d
}

// --- object.field: @~local base cannot receive @local! ---
func testObjectFieldNotBaseReceiveInternal() {
    var c: C@~local = C()
    var d: D@local! = D()
    c.d = d
}

func testObjectFieldNotBaseReceiveExternal(p: D@local!) {
    var c: C@~local = C()
    c.d = p
}

// --- object.field: @local! base cannot receive @local? ---
func testObjectFieldInternalBaseReceiveHalf() {
    var c: C@local! = C()
    var d: D@local? = D@local?()
    c.d = d
}

// --- object.field: @local! external base cannot receive @local! internal ---
func testObjectFieldExternalBaseReceiveInternal(pc: C@local!) {
    var d: D@local! = D()
    pc.d = d
}

// --- object.field: @local! external base cannot receive @local? ---
func testObjectFieldExternalBaseReceiveHalf(pc: C@local!) {
    var d: D@local? = D()
    pc.d = d
}

// --- object.prop: @~local base cannot receive @local? ---
func testObjectPropNotBaseReceiveHalf() {
    var e: E@~local = E()
    var d: D@local? = D@local?()
    e.p = d
}

// --- object.prop: @~local base cannot receive @local! ---
func testObjectPropNotBaseReceiveInternal() {
    var e: E@~local = E()
    var d: D@local! = D()
    e.p = d
}

// --- object.prop: @local! base cannot receive @local? ---
func testObjectPropInternalBaseReceiveHalf() {
    var e: E@local! = E()
    var d: D@local? = D@local?()
    e.p = d
}

main() {
}

// ASSERT: scan-3 "DiagKind": "sema_bad_local_assignment",
// ASSERT: scan-7 "DiagKind": "sema_mismatched_types",
// ASSERT: scan-1 "DiagKind": "sema_no_match_function_declaration_for_call",
// ASSERT: scan "Errors": 11,
