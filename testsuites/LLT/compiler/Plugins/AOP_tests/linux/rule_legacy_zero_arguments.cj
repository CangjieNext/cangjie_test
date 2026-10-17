// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
// See https://cangjie-lang.cn/pages/LICENSE for license information.
//
// TIMEOUT: 600
// (CJNATIVE and Linux)EXEC-PIPE-0: python3 zero_case.py --compiler-command "%compiler" --stdx-directory "$CANGJIE_STDX_PATH" 2>&1 | compare %f
// ASSERT: scan legacy-zero-default: PASS
// ASSERT: scan legacy-zero-O2: PASS
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// SEPARATE-FILE: zero_case.py
import argparse
from collections import Counter
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
root = Path.cwd() / "zero-artifacts"
root.mkdir()
print("test artifacts:", root)
env = dict(os.environ)
triple = {"x86_64": "linux_x86_64_cjnative", "aarch64": "linux_aarch64_cjnative"}[platform.machine()]
sdk = Path(env["CANGJIE_HOME"])
env["LD_LIBRARY_PATH"] = f"{stdx}:{sdk / 'runtime/lib' / triple}:" + env.get("LD_LIBRARY_PATH", "")
target = Path("target.cj").resolve()
source_text = Path("source.cj").read_text(encoding="utf-8")
nonunit_target = Path("target_nonunit.cj").resolve()
nonunit_source = (source_text
    .replace('funcTypeStr: "()->Unit"', 'funcTypeStr: "()->String"')
    .replace('funcTypeStr: "(Int64)->Unit"', 'funcTypeStr: "(Int64)->Int64"')
    .replace('funcTypeStr: "(**)->Unit"', 'funcTypeStr: "(**)->*"'))

def run(command, cwd):
    result = subprocess.run([str(x) for x in command], cwd=cwd, env=env, text=True,
                            stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    assert result.returncode == 0, result.stdout
    return result.stdout

def check_output(output, mixed):
    lines = output.splitlines()
    expected = ["BEGIN0", "ge0", "gx0", "se0", "sx0", "BODY0", "END0",
                "BEGIN1", "ge1", "gx1", "se1", "sx1", "BODY1:7", "END1"]
    if mixed:
        expected += ["rule", "rule"]
    assert Counter(lines) == Counter(expected), output
    assert lines.index("END0") < lines.index("BEGIN1"), output
    for number, body in (("0", "BODY0"), ("1", "BODY1:7")):
        begin = lines.index("BEGIN" + number)
        end = lines.index("END" + number)
        body_index = lines.index(body)
        assert begin < body_index < end, output
        for prefix in ("ge", "se"):
            assert begin < lines.index(prefix + number) < body_index, output
        for prefix in ("gx", "sx"):
            assert body_index < lines.index(prefix + number) < end, output
        if mixed:
            window = lines[begin + 1:end]
            assert window.count("rule") == 1 and window.index("rule") < window.index(body), output

def build(label, mode, same=False, code=source_text, error=None, target_file=target):
    directory = root / label
    directory.mkdir()
    package = "legacy_zero_target" if same else "legacy_zero_source"
    source = directory / "source.cj"
    source.write_text(code.replace("legacy_zero_source", package), encoding="utf-8")
    files = [str(source), str(target_file)] if same else [str(source)]
    targets = files if same else [str(target_file)]
    config = {"schemaVersion": 2, "sessionId": os.urandom(16).hex(),
              "sessionRoot": str(directory / "session"), "compiler": str(compiler),
              "stdxDirectory": str(stdx), "dependencies": [],
              "sources": [{"packageName": package, "files": files, "options": mode}],
              "targets": [{"packageName": "legacy_zero_target", "files": targets,
                           "options": mode, "outputType": "exe"}]}
    path = directory / "config.json"
    path.write_text(json.dumps(config), encoding="utf-8")
    result = subprocess.run([str(driver), str(path)], env=env, text=True,
                            stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    (directory / "driver.log").write_text(result.stdout, encoding="utf-8")
    complete = directory / "session/complete.json"
    if error:
        assert result.returncode != 0 and error in result.stdout, result.stdout
        assert not complete.exists() and not (directory / "session/sources.json").exists()
        return
    assert result.returncode == 0 and complete.is_file(), result.stdout
    executable = json.loads(complete.read_text())["outputs"][0]["path"]
    check_output(run([executable], directory), mixed=True)
    # Compare the same inputs using the existing collect/weave plugins.
    base = [compiler, "--import-path", stdx, "-L", stdx, "-lstdx.aspect_cj", *mode]
    collect = f"--plugin={stdx}/libstdx.collect_aspects.so"
    weave = f"--plugin={stdx}/libstdx.weave_aspects.so"
    if same:
        run([*base, *files, collect, weave, "-o", "old.out"], directory)
    else:
        run([*base, source, collect, "--output-type=staticlib", "-o", f"lib{package}.a"], directory)
        run([*base, target_file, weave, "--import-path", directory, "-L", directory,
             f"-l{package}", "-o", "old.out"], directory)
    check_output(run([directory / "old.out"], directory), mixed=False)

for label, mode in (("default", []), ("O2", ["-O2"])):
    for same in (False, True):
        build(label + ("-same" if same else "-cross"), mode, same=same)
        build(label + ("-nonunit-same" if same else "-nonunit-cross"), mode, same=same,
              code=nonunit_source, target_file=nonunit_target)
    for name, old, new in (
        ("return", 'func ge0(): Unit { println("ge0") }', 'func ge0(): Int64 { 0 }'),
        ("private", "public func ge0()", "private func ge0()"),
        ("receiver", "func ge0()", "func ge0(value: Int64)"),
        ("signature", 'funcTypeStr: "()->Unit"', 'funcTypeStr: "invalid"'),
        ("wildcard", 'funcTypeStr: "()->Unit"', 'funcTypeStr: "(**)->Unit"'),
    ):
        assert old in source_text
        build(label + "-" + name, mode, code=source_text.replace(old, new, 1),
              error="invalid-advice-signature")
    print(f"legacy-zero-{label}: PASS")

// SEPARATE-FILE: source.cj
package legacy_zero_source
import stdx.aspect_cj.*

@InsertAtEntry[packageName: "legacy_zero_target", className: "Service", methodName: "run0",
    isStatic: false, recursive: false, funcTypeStr: "()->Unit"]
public func ge0(): Unit { println("ge0") }
@InsertAtExit[packageName: "legacy_zero_target", className: "Service", methodName: "run0",
    isStatic: false, recursive: false, funcTypeStr: "()->Unit"]
public func gx0(): Unit { println("gx0") }
@InsertAtEntry[packageName: "legacy_zero_target", className: "Service", methodName: "run1",
    isStatic: false, recursive: false, funcTypeStr: "(Int64)->Unit"]
public func ge1(): Unit { println("ge1") }
@InsertAtExit[packageName: "legacy_zero_target", className: "Service", methodName: "run1",
    isStatic: false, recursive: false, funcTypeStr: "(Int64)->Unit"]
public func gx1(): Unit { println("gx1") }

public class Advice {
    @InsertAtEntry[packageName: "legacy_zero_target", className: "Service", methodName: "run0",
        isStatic: false, recursive: false, funcTypeStr: "()->Unit"]
    public static func se0(): Unit { println("se0") }
    @InsertAtExit[packageName: "legacy_zero_target", className: "Service", methodName: "run0",
        isStatic: false, recursive: false, funcTypeStr: "()->Unit"]
    public static func sx0(): Unit { println("sx0") }
    @InsertAtEntry[packageName: "legacy_zero_target", className: "Service", methodName: "run1",
        isStatic: false, recursive: false, funcTypeStr: "(Int64)->Unit"]
    public static func se1(): Unit { println("se1") }
    @InsertAtExit[packageName: "legacy_zero_target", className: "Service", methodName: "run1",
        isStatic: false, recursive: false, funcTypeStr: "(Int64)->Unit"]
    public static func sx1(): Unit { println("sx1") }
}

@PointcutRule[packageName: "legacy_zero_target", className: "Service", methodName: "run*",
    funcTypeStr: "(**)->Unit", targetKind: "instance", recursive: false, annotationName: ""]
class Both {}
@InsertAtEntryByRule[rule: "legacy_zero_source.Both"]
public func mixed(): Unit { println("rule") }

// SEPARATE-FILE: target.cj
package legacy_zero_target
public class Service {
    public func run0(): Unit { println("BODY0") }
    public func run1(value: Int64): Unit { println("BODY1:${value}") }
}
main(): Unit {
    let service = Service()
    println("BEGIN0")
    service.run0()
    println("END0")
    println("BEGIN1")
    service.run1(7)
    println("END1")
}

// SEPARATE-FILE: target_nonunit.cj
package legacy_zero_target
public class Service {
    public func run0(): String { println("BODY0"); return "zero" }
    public func run1(value: Int64): Int64 { println("BODY1:${value}"); return value + 1 }
}
main(): Unit {
    let service = Service()
    println("BEGIN0")
    if (service.run0() != "zero") { throw Exception("String return corrupted") }
    println("END0")
    println("BEGIN1")
    if (service.run1(7) != 8) { throw Exception("Int64 return corrupted") }
    println("END1")
}
