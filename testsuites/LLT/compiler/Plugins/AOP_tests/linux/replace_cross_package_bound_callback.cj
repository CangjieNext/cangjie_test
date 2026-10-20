// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
// See https://cangjie-lang.cn/pages/LICENSE for license information.
//
// The target does not import the advice. The weaver must reconstruct the
// imported advice signature with a bound original callback, not a raw method.
// (CJNATIVE and Linux)EXEC-0: %compiler %import-cangjie-stdx %cmp_opt target.cj --output-type=dylib -o libbound_target.so
// (CJNATIVE and Linux)EXEC-0: %compiler %import-cangjie-stdx %cmp_opt advice.cj --import-path=. -L. -lbound_target --output-type=dylib -o libbound_advice.so %collect_aspects_plugin
// (CJNATIVE and Linux)EXEC-0: %compiler %import-cangjie-stdx %cmp_opt target.cj --import-path=. -L. -lbound_advice --output-type=dylib -o libbound_target.so %weave_aspects_plugin
// (CJNATIVE and Linux)EXEC-0: %compiler %import-cangjie-stdx %cmp_opt main.cj --import-path=. -L. -lbound_target -lbound_advice -o %output
// (CJNATIVE and Linux)EXEC-PIPE-0: export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH && %set_stdx_path %run %run_opt %output %run_args | compare %f
// ASSERT: scan 115
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// SEPARATE-FILE: target.cj
package bound_target
public class Target {
    public func calculate(x: Int64): Int64 { 10 + x }
}

// SEPARATE-FILE: advice.cj
package bound_advice
import bound_target.*
import stdx.aspect_cj.*
@ReplaceFuncBody[packageName: "bound_target", className: "Target",
    methodName: "calculate", isStatic: false, recursive: false]
public func wrap(self: Target, x: Int64, original: (Int64) -> Int64): Int64 {
    original(x + 2) + 100
}

// SEPARATE-FILE: main.cj
import bound_target.*
main() {
    println(Target().calculate(3))
    0
}
