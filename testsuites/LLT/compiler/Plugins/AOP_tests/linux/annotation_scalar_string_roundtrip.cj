// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
// See https://cangjie-lang.cn/pages/LICENSE for license information.
//
// The plugin checks C++ -> CJ. Reading the post-plugin CHIR file also checks
// CJ -> C++ -> CJ; consecutive plugins alone share one deserialized package.
// (CJNATIVE and Linux)EXEC-0: python3 prepare.py
// (CJNATIVE and Linux)EXEC-0: %compiler %import-cangjie-stdx %cmp_opt first.cj --output-type=dylib -o libfirst.so
// (CJNATIVE and Linux)EXEC-0: %compiler %import-cangjie-stdx %cmp_opt reader.cj -o reader.out
// (CJNATIVE and Linux)EXEC-PIPE-0: %set_stdx_path %compiler %import-cangjie-stdx %cmp_opt main.cj --experimental --emit-chir-annotation-metadata --plugin=./libfirst.so --emit-chir=raw -o roundtrip.chir 2>&1 | compare %f
// (CJNATIVE and Linux)EXEC-PIPE-0: %set_stdx_path ./reader.out 2>&1 | compare %f
// (CJNATIVE and Linux)EXEC-PIPE-0: %set_stdx_path %compiler %import-cangjie-stdx %cmp_opt -O2 main.cj --experimental --emit-chir-annotation-metadata --plugin=./libfirst.so --emit-chir=raw -o roundtrip.chir 2>&1 | compare %f
// (CJNATIVE and Linux)EXEC-PIPE-0: %set_stdx_path ./reader.out 2>&1 | compare %f
// ASSERT: scan scalar-roundtrip: PASS
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// SEPARATE-FILE: prepare.py
from pathlib import Path
source = Path("first.cj").read_text(encoding="utf-8")
reader = source.split("@CHIRPlugin")[0].replace("import stdx.plugin.*", "import std.fs.*")
reader += '''
main(): Unit {
    let bytes = File.readFrom(Path("roundtrip.chir"))
    let data = unsafe { acquireArrayRawData(bytes) }
    try {
        checkPackage(deserializePackage(data.pointer, bytes.size))
    } finally {
        unsafe { releaseArrayRawData(data) }
    }
}
'''
Path("reader.cj").write_text(reader, encoding="utf-8")

// SEPARATE-FILE: first.cj
package scalar_first
import std.collection.HashSet
import stdx.chir.*
import stdx.plugin.*

private func require(value: Bool): Unit {
    if (!value) { throw Exception("annotation scalar roundtrip mismatch") }
}

private func expectedString(name: String): String {
    match (name) {
        case "empty" => ""
        case "plain" => "text"
        case "unicode" => "仓颉"
        case "leading" => "\u{0}tail"
        case "middle" => "run\u{0}suffix"
        case "trailing" => "head\u{0}"
        case _ => throw Exception("unexpected string field")
    }
}

private func checkFields(annotation: ResolvedAnnotation): Unit {
    let fields = annotation.scalarFields.getOrThrow()
    let expectedNames: Array<String> = ["empty", "plain", "unicode", "leading", "middle", "trailing", "yes", "no"]
    let seen = HashSet<String>()
    require(fields.size == expectedNames.size)
    for (field in fields) {
        require(expectedNames.contains(field.name))
        require(seen.add(field.name))
        match (field.value) {
            case AnnotationScalarValue.StringValue(value) =>
                require(value == expectedString(field.name))
            case AnnotationScalarValue.BoolValue(value) =>
                require((field.name == "yes" && value) || (field.name == "no" && !value))
        }
    }
    for (name in expectedNames) { require(seen.contains(name)) }
}

private func checkPackage(pkg: Package): Unit {
    let expectedClasses: Array<String> = ["scalar_strings.Scalars", "scalar_strings.Empty", "scalar_strings.NonScalar"]
    var found = false
    for (f in pkg.functions) {
        if (f.isImported() || f.srcCodeName != "subject") { continue }
        found = true
        let items = f.annotationSnapshot.items.getOrThrow()
        let seen = HashSet<String>()
        for (annotation in items) {
            if (!expectedClasses.contains(annotation.qualifiedClassName)) { continue }
            require(seen.add(annotation.qualifiedClassName))
            match (annotation.qualifiedClassName) {
                case "scalar_strings.Scalars" => checkFields(annotation)
                case "scalar_strings.Empty" =>
                    require(annotation.scalarFields.getOrThrow().isEmpty())
                case "scalar_strings.NonScalar" =>
                    require(annotation.scalarFields.isNone())
                case _ => ()
            }
        }
        for (name in expectedClasses) { require(seen.contains(name)) }
    }
    require(found)
    println("scalar-roundtrip: PASS")
}

@CHIRPlugin
class ScalarFirst {
    public override func run(pkg: Package): Bool {
        checkPackage(pkg)
        return true
    }
}

// SEPARATE-FILE: main.cj
package scalar_strings

@Annotation[target: [GlobalFunction]]
public class Scalars {
    let empty: String
    let plain: String
    let unicode: String
    let leading: String
    let middle: String
    let trailing: String
    let yes: Bool
    let no: Bool
    public const init(empty!: String, plain!: String, unicode!: String, leading!: String,
        middle!: String, trailing!: String, yes!: Bool, no!: Bool) {
        this.empty = empty
        this.plain = plain
        this.unicode = unicode
        this.leading = leading
        this.middle = middle
        this.trailing = trailing
        this.yes = yes
        this.no = no
    }
}

@Annotation[target: [GlobalFunction]]
public class Empty { public const init() {} }

@Annotation[target: [GlobalFunction]]
public class NonScalar {
    let count: Int64
    public const init(count: Int64) { this.count = count }
}

@Scalars[empty: "", plain: "text", unicode: "仓颉", leading: "\u{0}tail",
    middle: "run\u{0}suffix", trailing: "head\u{0}", yes: true, no: false]
@Empty
@NonScalar[7]
public func subject(): Unit {}

main(): Unit { subject() }
