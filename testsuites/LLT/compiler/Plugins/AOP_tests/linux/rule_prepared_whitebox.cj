// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
// See https://cangjie-lang.cn/pages/LICENSE for license information.
//
// This child package exercises the protected kernel in the installed stdx.
// (CJNATIVE and Linux)EXEC-0: %compiler %import-cangjie-stdx %cmp_opt %f -o %output
// (CJNATIVE and Linux)EXEC-PIPE-0: %set_stdx_path %run %run_opt %output %run_args | compare %f
// (CJNATIVE and Linux)ASSERT: scan prepared-rule-whitebox: PASS
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

package stdx.aspect_cj.tests
import stdx.aspect_cj.*

private func require(value: Bool): Unit {
    if (!value) { throw Exception("whitebox assertion failed") }
}

private func rejects(action: () -> Unit, category: String): Bool {
    try { action() } catch (error: IllegalArgumentException) { return error.message.contains(category) }
    return false
}

main() {
    let session = String.fromUtf8(Array<UInt8>(32, repeat: 97))
    let hash = String.fromUtf8(Array<UInt8>(64, repeat: 97))
    let fields = ["aspect.Base", "target", "", "business", "(Int64)->Unit", "global", "false", ""]
    let wire = RuleWirePackage("READY", session, "aspect", hash, hash, "init", [
        RuleWireRecord("R", "", 0, 0, fields),
        RuleWireRecord("C", "", 0, 0, ["aspect.Shared", "target", "3",
            "REF:aspect.Base", "REF:aspect.Base", "OR"]),
        RuleWireRecord("A", "", 0, 0, ["ENTRY", "advice", "global", "none", "aspect.Shared"])])
    let source = PreparedRuleSource(wire)
    require(source.encodedSize == encodeRuleWire(wire).size)
    fields[1] = "changed"
    let target = RuleTargetSpec("target", "", [], "business", "(Int64)->Unit", false, false, [])
    let outside = RuleTargetSpec("elsewhere", "", [], "business", "(Int64)->Unit", false, false, [])
    let budget = RuleWorkBudget()
    for (_ in 0..100) {
        require(source.select(target, true, budget).size == 1)
        require(source.select(outside, true, budget).isEmpty())
    }
    require(budget.used > 0)
    require(rejects({ => source.select(target, true, RuleWorkBudget(limit: 0)); () }, "rule-limit"))
    require(rejects({ => source.select(target, false, RuleWorkBudget()); () }, "annotation-metadata-unknown"))
    let graph = RuleGraph("aspect", [RuleDefinition("aspect.Base", "target")], {_ => ()}, {_ => ()})
    graph.validateRoots(["aspect.Base"])
    require(rejects({ => graph.validateRoots(["aspect.Missing"]); () }, "unknown-root"))
    require(rejects({ => graph.evaluate(["aspect.Base"], true, {_, _ => false}, {_, _ => false},
        RuleWorkBudget(limit: 4)); () }, "scratch"))
    println("prepared-rule-whitebox: PASS")
    0
}
