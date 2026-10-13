// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
// See https://cangjie-lang.cn/pages/LICENSE for license information.
//
// Exempting unnamed plugin helpers must not exempt new named source bodies.
// (CJNATIVE and Linux)EXEC-0: %compiler %import-cangjie-stdx %cmp_opt plugin.cj --output-type=dylib -o liblate.so
// (CJNATIVE and Linux)EXEC-PIPE-1: %set_stdx_path %compiler %import-cangjie-stdx %cmp_opt main.cj --experimental --emit-chir-annotation-metadata --plugin=./liblate.so -o %output 2>&1 | compare %f
// ASSERT: scan build-phase-invalid: late aspect candidate
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// SEPARATE-FILE: plugin.cj
package stdx.aspect_cj.tests
import stdx.chir.*
import stdx.plugin.*

@CHIRPlugin
class LateCandidate {
    public override func run(pkg: Package): Bool {
        let late = pkg.addFunction(FuncType.get([], UnitType.get()), "lateSource", "lateSource", pkg.name)
        late.initBody()
        CHIRBuilder(late.body.getOrThrow().entryBlock).createExit()
        return true
    }
}

// SEPARATE-FILE: main.cj
main() { 0 }
