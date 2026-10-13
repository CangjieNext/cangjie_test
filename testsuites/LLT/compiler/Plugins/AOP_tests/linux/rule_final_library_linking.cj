// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
// See https://cangjie-lang.cn/pages/LICENSE for license information.
//
// Requires the matching compiler and stdx rule driver from the associated PRs.
// TIMEOUT: 600
// (CJNATIVE and Linux)EXEC-0: python3 driver_case.py --compiler-command "%compiler" --stdx-directory "$CANGJIE_STDX_PATH"
// (CJNATIVE and Linux)ASSERT: scan rules-linked-libraries-default: PASS
// (CJNATIVE and Linux)ASSERT: scan rules-linked-libraries-O2: PASS
// (CJNATIVE and Linux)ASSERT: scan source-target-ABI: PASS
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// SEPARATE-FILE: driver_case.py
import argparse
import hashlib
import json
import os
from pathlib import Path
import platform
import shlex
import shutil
import subprocess
import tempfile

parser = argparse.ArgumentParser()
parser.add_argument("--compiler-command", required=True)
parser.add_argument("--stdx-directory", type=Path, required=True)
args = parser.parse_args()
compiler = Path(shutil.which(shlex.split(args.compiler_command)[0])).resolve()
stdx = args.stdx_directory.resolve()
driver = stdx.parents[1] / "bin/aspect-cj-driver"
assert driver.is_file(), "matching stdx rule driver is required"
sdk = Path(os.environ["CANGJIE_HOME"])
triple = {"x86_64": "linux_x86_64_cjnative", "aarch64": "linux_aarch64_cjnative"}[platform.machine()]
env = dict(os.environ)
env["LD_LIBRARY_PATH"] = f"{stdx}:{sdk / 'runtime/lib' / triple}:{sdk / 'lib' / triple}:" + env.get("LD_LIBRARY_PATH", "")
root = Path(tempfile.mkdtemp(prefix="aspect-rules-llt-"))
print("retained test directory:", root)

# Match packaged SDKs with platform-directory symlinks without modifying the SDK.
sdk_alias = root / "sdk"
sdk_alias.mkdir()
for entry in sdk.iterdir():
    alias = sdk_alias / entry.name
    if entry.name == "lib":
        alias.mkdir()
        for library in entry.iterdir():
            (alias / library.name).symlink_to(library.resolve(), target_is_directory=library.is_dir())
    else:
        alias.symlink_to(entry.resolve(), target_is_directory=entry.is_dir())
env["CANGJIE_HOME"] = str(sdk_alias)

def run(command):
    result = subprocess.run([str(value) for value in command], env=env, text=True,
                            stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    assert result.returncode == 0, result.stdout
    return result.stdout

def unit(name, filename, mode, output=None):
    value = {"packageName": name, "files": [str(Path(filename).resolve())], "options": mode}
    if output:
        value["outputType"] = output
    return value

support = root / "librules_support.a"
run([compiler, "support.cj", "--output-type=staticlib", "-o", support])
dependency = {"packageName": "rules_support", "module": str(root / "rules_support.cjo"),
              "library": str(support), "compilerSha256": hashlib.sha256(compiler.read_bytes()).hexdigest(),
              "targetTriple": triple, "dependencies": ["std.core"]}

def build(label, targets, mode, success=True):
    config = {"schemaVersion": 2, "sessionId": os.urandom(16).hex(), "sessionRoot": str(root / label),
              "compiler": str(compiler), "stdxDirectory": str(stdx), "dependencies": [dependency],
              "sources": [unit("rules_library", "library.cj", mode)], "targets": targets}
    path = root / f"{label}.json"
    path.write_text(json.dumps(config), encoding="utf-8")
    result = subprocess.run([str(driver), str(path)], env=env, text=True,
                            stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    (root / f"{label}.log").write_text(result.stdout, encoding="utf-8")
    assert (result.returncode == 0) == success, result.stdout
    return root / label, result.stdout

for label, mode in (("default", []), ("O2", ["-O2"])):
    targets = [unit("rules_library", "library.cj", mode, "staticlib"),
               unit("rules_app", "application.cj", mode, "exe"),
               unit("rules_second", "second.cj", mode, "exe")]
    if mode:
        targets.reverse()
    session, _ = build(label, targets, mode)
    manifest = json.loads((session / "complete.json").read_text())
    outputs = {item["packageName"]: item for item in manifest["outputs"]}
    for name, value in (("rules_app", 7), ("rules_second", 9)):
        assert run([outputs[name]["path"]]).splitlines() == [f"support:{value}", f"support:{value}", f"body:{value}"]
        paths = [item["path"] for item in outputs[name]["linkInputs"]]
        assert outputs["rules_library"]["path"] in paths
        assert not any(path.endswith("baseline/librules_library.a") for path in paths)
        assert len(paths) == len(set(paths))
    print(f"rules-linked-libraries-{label}: PASS")

session, output = build("abi-mismatch", [unit("rules_library", "incompatible.cj", [], "staticlib")], [], False)
assert "source/target declaration ABI" in output, output
assert not (session / "plan.json").exists() and not (session / "complete.json").exists()
print("source-target-ABI: PASS")

// SEPARATE-FILE: support.cj
package rules_support
public func note(value: Int64): Unit { println("support:${value}") }

// SEPARATE-FILE: library.cj
package rules_library
import stdx.aspect_cj.*
import rules_support.*
@Annotation[target: [GlobalFunction]]
public class Mark { public const init() {} }
@PointcutRule[packageName: "rules_*", className: "", methodName: "*",
    funcTypeStr: "(Int64)->Unit", targetKind: "global", recursive: false, annotationName: ""]
class All {}
@PointcutRule[packageName: "rules_*", className: "", methodName: "*",
    funcTypeStr: "(Int64)->Unit", targetKind: "global", recursive: false, annotationName: "rules_library.Mark"]
class Marked {}
@PointcutExpression[packageScope: "rules_*", expression: "Marked OR (All AND NOT Marked)"]
class Selected {}
@InsertAtEntryByRule[rule: "rules_library.Selected"]
public func before(args: Array<Any>): Unit { note((args[0] as Int64).getOrThrow()) }
@Mark
public func business(value: Int64): Unit { println("body:${value}") }

// SEPARATE-FILE: application.cj
package rules_app
import rules_library.*
public func callLibrary(value: Int64): Unit { business(value) }
main() { callLibrary(7); 0 }

// SEPARATE-FILE: second.cj
package rules_second
import rules_library.*
public func callLibrary(value: Int64): Unit { business(value) }
main() { callLibrary(9); 0 }

// SEPARATE-FILE: incompatible.cj
package rules_library
public func business(value: String): Unit { println(value) }
