// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
// See https://cangjie-lang.cn/pages/LICENSE for license information.
//
// TIMEOUT: 600
// (CJNATIVE and Linux)EXEC-0: python3 setup.py
// (CJNATIVE and Linux)EXEC-0: %compiler %import-cangjie-stdx %cmp_opt helper.cj -o helper
// (CJNATIVE and Linux)EXEC-0: %set_stdx_path ./helper
// (CJNATIVE and Linux)EXEC-PIPE-1: %set_stdx_path %compiler %import-cangjie-stdx %cmp_opt main.cj --plugin=$CANGJIE_STDX_PATH/libstdx.weave_aspects.so -o %output 2>&1 | compare %f
// ASSERT: scan metadata-format: field size limit
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// SEPARATE-FILE: setup.py
from pathlib import Path

session = Path("session")
session.mkdir(exist_ok=True)
(session / "inside").write_bytes(b"safe")
outside = Path("session-other")
outside.mkdir(exist_ok=True)
(outside / "input").write_bytes(b"safe")
escape = session / "escape"
if escape.is_symlink():
    escape.unlink()
escape.symlink_to((outside / "input").resolve())
(session / "big").write_bytes(b"x" * (8 * 1024 * 1024 + 1))
Path("aspect-hardening_target.annoinfo").write_text("x" * 65537 + "\n", encoding="utf-8")

// SEPARATE-FILE: helper.cj
package stdx.aspect_cj.tests
import std.fs.*
import stdx.aspect_cj.*

private func expectFailure(action: () -> Unit, message: String): Unit {
    try {
        action()
    } catch (error: IllegalArgumentException) {
        if (error.message.contains(message)) { return }
        throw error
    }
    throw Exception("expected failure: ${message}")
}

main(): Int64 {
    let context = RuleActionContext("", "", "", "", "", "session", "", "", [])
    let inside = ruleContextInputPath(context, "session/inside")
    if (readBoundedAspectMetadata(inside).size != 4) { return 1 }
    for (path in ["session-other/input", "session/../session-other/input", "session/escape"]) {
        expectFailure({ => ruleContextInputPath(context, path); () }, "source input escapes session")
    }
    expectFailure({ => readBoundedAspectMetadata(Path("session/big")); () }, "file size limit")
    expectFailure({ => readBoundedAspectMetadata(Path("session")); () }, "regular file")
    let opens = String.join(Array<String>(80, repeat: "Array<"), delimiter: "")
    let closes = String.join(Array<String>(80, repeat: ">"), delimiter: "")
    expectFailure({ => matchTypePattern(opens + "*" + closes, opens + "Int64" + closes); () }, "type nesting")
    println("metadata-hardening: PASS")
    return 0
}

// SEPARATE-FILE: main.cj
package hardening_target
main(): Int64 { 0 }
