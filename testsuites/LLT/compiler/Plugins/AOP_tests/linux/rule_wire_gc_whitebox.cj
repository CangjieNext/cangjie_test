// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
// See https://cangjie-lang.cn/pages/LICENSE for license information.
//
// Exercise the installed implementation, including optimized field-array copies.
// TIMEOUT: 180
// (CJNATIVE and Linux)EXEC-0: %compiler %import-cangjie-stdx %cmp_opt %f -o %output
// (CJNATIVE and Linux)EXEC-PIPE-0: %set_stdx_path env cjHeapSize=64MB %run %run_opt %output %run_args | compare %f
// (CJNATIVE and Linux)EXEC-0: %compiler %import-cangjie-stdx %cmp_opt -O2 %f -o %output
// (CJNATIVE and Linux)EXEC-PIPE-0: %set_stdx_path env cjHeapSize=64MB %run %run_opt %output %run_args | compare %f
// (CJNATIVE and Linux)ASSERT: scan wire-gc-whitebox: PASS
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

package stdx.aspect_cj.tests

import std.runtime.gc
import std.sync.{AtomicBool, AtomicInt64}
import stdx.aspect_cj.*

private func require(value: Bool): Unit {
    if (!value) { throw Exception("wire GC whitebox assertion failed") }
}

private func wireFixture(): RuleWirePackage {
    let session = String.fromUtf8(Array<UInt8>(32, repeat: 97))
    let hash = String.fromUtf8(Array<UInt8>(64, repeat: 98))
    let fields = ["aspect.Base", "target", "", "business", "(Int64)->Unit", "global", "false", ""]
    let rule = RuleWireRecord("R", "rules.cj", 1, 1, fields)
    fields[0] = "changed"
    require(rule.fields[0] == "aspect.Base")
    let records = [rule,
        RuleWireRecord("C", "rules.cj", 2, 1,
            ["aspect.Shared", "target", "3", "REF:aspect.Base", "REF:aspect.Base", "OR"]),
        RuleWireRecord("A", "advice.cj", 3, 1, ["ENTRY", "advice", "global", "none", "aspect.Shared"]),
        RuleWireRecord("L", "legacy.cj", 4, 1, [INSERT_AT_EXIT_ANNO_CLASS_NAME, "aspect", "oldAdvice",
            "0", "false", "false", "false", "target", "", "business", "(Int64)->Unit", "false", "false"])]
    let wire = RuleWirePackage("READY", session, "aspect", hash, hash, "init", records)
    records[0] = records[1]
    require(wire.records[0].kind == "R")
    return wire
}

main(): Int64 {
    let text = encodeRuleWire(wireFixture())
    let empty = RuleWireRecord("", "", 0, 0, [])
    require(empty.fields.isEmpty() && empty.fields.isEmpty())
    let stop = AtomicBool(false)
    let started = AtomicBool(false)
    let completed = AtomicInt64(0)
    let gcCalls = AtomicInt64(0)
    let overlap = AtomicInt64(0)
    let collector = spawn {
        while (!stop.load()) {
            let before = completed.load()
            gc(heavy: true)
            gcCalls.fetchAdd(1)
            started.store(true)
            if (completed.load() > before) { overlap.fetchAdd(1) }
        }
    }
    try {
        while (!started.load()) { sleep(Duration.millisecond) }
        for (_ in 0..2000) {
            let wire = decodeRuleWire(text)
            let records = wire.records
            require(records.size == 4)
            for (record in records) {
                let fields = record.fields
                let original = fields[0]
                fields[0] = "changed"
                require(record.fields[0] == original)
            }
            records[0] = records[1]
            require(wire.records[0].kind == "R")
            require(encodeRuleWire(wire) == text)
            completed.fetchAdd(1)
        }
    } finally {
        stop.store(true)
        collector.get()
    }
    // The runtime may coalesce GC calls; these are calls, not collection counts.
    // Overlap proves the background loop ran while round trips made progress.
    require(completed.load() == 2000 && gcCalls.load() > 0 && overlap.load() > 0)
    println("wire-gc-whitebox: PASS")
    return 0
}
