// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// A Nothing close does not terminate cleanup when isClosed may return true or throw.
// EXEC-PIPE-0: (%compiler %cmp_opt %f -o %output && %run %output) 2>&1 | compare %f

class ClosedResource <: Resource {
    public func isClosed(): Bool { println("closed guard"); true }
    public func close(): Nothing { throw Exception() }
}

open class OpenResource <: Resource {
    public open func isClosed(): Bool { false }
    public func close(): Nothing { throw Exception() }
}

class ClosedOverride <: OpenResource {
    public func isClosed(): Bool { true }
}

interface DefaultGuardResource <: Resource {
    func isClosed(): Bool { false }
    func close(): Unit {}
}

class GuardOverride <: DefaultGuardResource {
    public func isClosed(): Bool { true }
    public func close(): Unit { println("must not close") }
}

class ThrowingGuardResource <: Resource {
    let fail: Bool
    init(fail: Bool) { this.fail = fail }
    public func isClosed(): Bool {
        if (fail) { throw Exception() }
        false
    }
    public func close(): Nothing { throw Exception() }
}

func dynamicCleanup(resource: OpenResource) {
    try (r = resource) { println("dynamic body") }
    println("after dynamic cleanup")
}

func interfaceCleanup(resource: DefaultGuardResource) {
    try (r = resource) { println("interface body") }
    println("after interface cleanup")
}

main() {
    try (r = ClosedResource()) { println("closed body") }
    println("after closed cleanup")
    dynamicCleanup(ClosedOverride())
    interfaceCleanup(GuardOverride())
    try (r = ThrowingGuardResource(true)) {
        println("throwing guard body")
    } catch (_: Exception) {
        println("caught cleanup exception")
    }
    println("after caught cleanup")
}

/* SCAN-IN
closed body
closed guard
after closed cleanup
dynamic body
after dynamic cleanup
interface body
after interface cleanup
throwing guard body
caught cleanup exception
after caught cleanup
*/
