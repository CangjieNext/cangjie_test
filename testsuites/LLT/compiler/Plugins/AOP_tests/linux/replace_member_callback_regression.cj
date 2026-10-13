// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
// See https://cangjie-lang.cn/pages/LICENSE for license information.
//
// Regression: static callbacks need no hidden type argument; bound callbacks
// preserve this and return values; interface dispatch must reach the advice.
// Both legacy and rule weaving paths run under the suite's default/O2 modes.
// (CJNATIVE and Linux)EXEC-0: %compiler %import-cangjie-stdx %cmp_opt main.cj -o %output %collect_aspects_plugin
// (CJNATIVE and Linux)EXEC-0: %compiler %import-cangjie-stdx %cmp_opt main.cj -o %output %weave_aspects_plugin
// (CJNATIVE and Linux)EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// (CJNATIVE and Linux)EXEC-0: %compiler %import-cangjie-stdx %cmp_opt adapter.cj --output-type=dylib -lstdx.chir -lstdx.plugin.manager -o libreplacement_rules.so
// (CJNATIVE and Linux)EXEC-0: %compiler %import-cangjie-stdx %cmp_opt main.cj --experimental --emit-chir-annotation-metadata --plugin=./libreplacement_rules.so -o %output
// (CJNATIVE and Linux)EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan 111\n111\n121\n121\n131\n131
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// SEPARATE-FILE: main.cj
// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package replacement
import stdx.aspect_cj.*

public interface Calculator { func calculate(x: Int64): Int64 }

public class ClassCalculator <: Calculator {
    let offset = 10
    @ReplaceFuncBody[packageName: "replacement", className: "ClassCalculator",
        methodName: "calculate", isStatic: false, recursive: false]
    public func advice(x: Int64, original: (Int64) -> Int64): Int64 { original(x + 1) + 100 }
    public func calculate(x: Int64): Int64 { offset + x }

    @ReplaceFuncBody[packageName: "replacement", className: "ClassCalculator",
        methodName: "staticCalculate", isStatic: true, recursive: false]
    public static func staticAdvice(original: (Int64) -> Int64): Int64 { original(1) + 100 }
    public static func staticCalculate(x: Int64): Int64 { 10 + x }
}

public struct StructCalculator {
    let offset = 20
    @ReplaceFuncBody[packageName: "replacement", className: "StructCalculator",
        methodName: "calculate", isStatic: false, recursive: false]
    public func advice(x: Int64, original: (Int64) -> Int64): Int64 { original(x + 1) + 100 }
    public func calculate(x: Int64): Int64 { offset + x }

    @ReplaceFuncBody[packageName: "replacement", className: "StructCalculator",
        methodName: "staticCalculate", isStatic: true, recursive: false]
    public static func staticAdvice(original: (Int64) -> Int64): Int64 { original(1) + 100 }
    public static func staticCalculate(x: Int64): Int64 { 20 + x }
}

public enum EnumCalculator {
    | Value
    @ReplaceFuncBody[packageName: "replacement", className: "EnumCalculator",
        methodName: "calculate", isStatic: false, recursive: false]
    public func advice(x: Int64, original: (Int64) -> Int64): Int64 { original(x + 1) + 100 }
    public func calculate(x: Int64): Int64 { 30 + x }

    @ReplaceFuncBody[packageName: "replacement", className: "EnumCalculator",
        methodName: "staticCalculate", isStatic: true, recursive: false]
    public static func staticAdvice(original: (Int64) -> Int64): Int64 { original(1) + 100 }
    public static func staticCalculate(x: Int64): Int64 { 30 + x }
}

main() {
    let throughInterface: Calculator = ClassCalculator()
    println(throughInterface.calculate(0))
    println(ClassCalculator.staticCalculate(0))
    println(StructCalculator().calculate(0))
    println(StructCalculator.staticCalculate(0))
    println(EnumCalculator.Value.calculate(0))
    println(EnumCalculator.staticCalculate(0))
    0
}

// SEPARATE-FILE: adapter.cj
// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package stdx.aspect_cj.plugins.semantic_test

import stdx.aspect_cj.*
import stdx.chir.*
import stdx.plugin.*

// In-process test adapter for the public rule engine. Production builds use
// collect_rules and weave_rules through the staged driver instead.
@CHIRPlugin
class SemanticTestPlugin {
    public override func run(pkg: Package): Bool {
        let hash = String.join(Array<String>(64, repeat: "a"), delimiter: "")
        let session = String.join(Array<String>(32, repeat: "b"), delimiter: "")
        let sources = [collectRuleWirePackage(pkg, session, hash, hash)]
        let plans = preflightRuleWeave(pkg, sources)
        println("semantic planned=${plans.size}")
        applyRuleWeave(pkg, sources, plans)
        var rejected = false
        try {
            preflightRuleWeave(pkg, sources)
        } catch (error: IllegalArgumentException) {
            rejected = error.message.contains("already-woven")
        }
        if (!rejected) { throw IllegalArgumentException("repeat weaving was accepted") }
        println("semantic reentry=rejected")
        return true
    }
}
