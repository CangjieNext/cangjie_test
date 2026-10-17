// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
// See https://cangjie-lang.cn/pages/LICENSE for license information.
//
// TIMEOUT: 600
// (CJNATIVE and Linux)EXEC-PIPE-0: python3 nul_case.py --compiler-command "%compiler" --stdx-directory "$CANGJIE_STDX_PATH" 2>&1 | compare %f
// ASSERT: scan rule-NUL-default: PASS
// ASSERT: scan rule-NUL-O2: PASS
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// SEPARATE-FILE: nul_case.py
import argparse
import json
import os
from pathlib import Path
import platform
import shlex
import shutil
import subprocess

parser = argparse.ArgumentParser()
parser.add_argument("--compiler-command", required=True)
parser.add_argument("--stdx-directory", type=Path, required=True)
args = parser.parse_args()
compiler = Path(shutil.which(shlex.split(args.compiler_command)[0])).resolve()
stdx = args.stdx_directory.resolve()
driver = stdx.parents[1] / "bin/aspect-cj-driver"
assert driver.is_file(), "matching rule driver is required"
root = Path.cwd() / "nul-artifacts"
root.mkdir()
print("test artifacts:", root)
env = dict(os.environ)
triple = {"x86_64": "linux_x86_64_cjnative", "aarch64": "linux_aarch64_cjnative"}[platform.machine()]
sdk = Path(env["CANGJIE_HOME"])
env["LD_LIBRARY_PATH"] = f"{stdx}:{sdk / 'runtime/lib' / triple}:" + env.get("LD_LIBRARY_PATH", "")
template = Path("source.cj").read_text(encoding="utf-8")

def build(label, code, mode, error=None):
    source = root / f"{label}.cj"
    source.write_text(code, encoding="utf-8")
    unit = {"packageName": "nul_rules", "files": [str(source)], "options": mode}
    session = root / label
    config = {"schemaVersion": 2, "sessionId": os.urandom(16).hex(), "sessionRoot": str(session),
              "compiler": str(compiler), "stdxDirectory": str(stdx), "dependencies": [],
              "sources": [unit], "targets": [dict(unit, outputType="exe")]}
    path = root / f"{label}.json"
    path.write_text(json.dumps(config), encoding="utf-8")
    result = subprocess.run([str(driver), str(path)], env=env, text=True,
                            stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    (root / f"{label}.log").write_text(result.stdout, encoding="utf-8")
    complete = session / "complete.json"
    if error:
        assert result.returncode != 0 and error in result.stdout, result.stdout
        assert not complete.exists() and not (session / "sources.json").exists()
    else:
        assert result.returncode == 0 and complete.is_file(), result.stdout
        executable = json.loads(complete.read_text())["outputs"][0]["path"]
        output = subprocess.check_output([executable], env=env, text=True)
        assert output.splitlines() == ["ADVICE", "BODY"], output

for label, mode in (("default", []), ("O2", ["-O2"])):
    build(label + "-valid", template, mode)
    for field, old, new, error in (
        ("method", 'methodName: "run"', 'methodName: "run\\u{0}suffix"', "invalid-rule-field"),
        ("annotation", 'annotationName: ""', 'annotationName: "\\u{0}nul_rules.Mark"', "invalid-rule-field"),
        ("expression", 'expression: "Base"', 'expression: "Base\\u{0} OR Base"', "invalid-rule-expression"),
    ):
        assert old in template
        build(label + "-" + field, template.replace(old, new), mode, error)
    print(f"rule-NUL-{label}: PASS")

// SEPARATE-FILE: source.cj
package nul_rules
import stdx.aspect_cj.*

@PointcutRule[packageName: "nul_rules", className: "", methodName: "run", funcTypeStr: "()->Unit",
    targetKind: "global", recursive: false, annotationName: ""]
class Base {}
@PointcutExpression[packageScope: "nul_rules", expression: "Base"]
class Selected {}
@InsertAtEntryByRule[rule: "nul_rules.Selected"]
public func advice(): Unit { println("ADVICE") }
public func run(): Unit { println("BODY") }
main(): Unit { run() }
