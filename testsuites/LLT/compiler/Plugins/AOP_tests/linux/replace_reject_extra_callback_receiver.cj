// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
// See https://cangjie-lang.cn/pages/LICENSE for license information.
//
// Both collectors must reject an explicit receiver inside original's type.
// (CJNATIVE and Linux)EXEC-PIPE-1: %compiler %import-cangjie-stdx %cmp_opt main.cj -o %output %collect_aspects_plugin 2>&1 | compare legacy.txt
// (CJNATIVE and Linux)EXEC-0: %compiler %import-cangjie-stdx %cmp_opt adapter.cj --output-type=dylib -lstdx.chir -lstdx.plugin.manager -o libreplacement_validation.so
// (CJNATIVE and Linux)EXEC-PIPE-1: %set_stdx_path %compiler %import-cangjie-stdx %cmp_opt main.cj --experimental --emit-chir-annotation-metadata --plugin=./libreplacement_validation.so -o %output 2>&1 | compare rules.txt

// SEPARATE-FILE: legacy.txt
// ASSERT: scan has function type
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// SEPARATE-FILE: rules.txt
// ASSERT: scan invalid-advice-signature: legacy Replace types
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// SEPARATE-FILE: main.cj
package replacement_invalid
import stdx.aspect_cj.*
public class Target {
    public func calculate(x: Int64): Int64 { x }
}
@ReplaceFuncBody[packageName: "replacement_invalid", className: "Target",
    methodName: "calculate", isStatic: false, recursive: false]
public func badAdvice(self: Target, x: Int64, original: (Target, Int64) -> Int64): Int64 {
    original(self, x)
}
main() { 0 }

// SEPARATE-FILE: adapter.cj
package stdx.aspect_cj.plugins.replacement_validation
import stdx.aspect_cj.*
import stdx.chir.*
import stdx.plugin.*
@CHIRPlugin
class ValidationPlugin {
    public override func run(pkg: Package): Bool {
        let hash = String.join(Array<String>(64, repeat: "a"), delimiter: "")
        let session = String.join(Array<String>(32, repeat: "b"), delimiter: "")
        try {
            collectRuleWirePackage(pkg, session, hash, hash)
        } catch (error: IllegalArgumentException) {
            println(error.message)
            return false
        }
        return true
    }
}
