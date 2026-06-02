// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %compiler %cmp_opt %f -o %output
import define.*

@Annotation
public class LogWithLevel {
    public const init(level: Int64) {
        this.level = level
    }
    public let level: Int64
}

@Annotation
public class LogWithLevel2 {
    public const init(level: Int64) {
        this.level = level
    }
    public let level: Int64
}

@Annotation
public class LogWithLevel3 {
    public const init(level: String) {
        this.level = level
    }
    public let level: String
}

// Annotation nest macro, the same node
@LogWithLevel2[123]
@M0
class A1 {
    let a: Int64 = 123
}

// Macro nest annotation, the same nodes
@M0
@LogWithLevel2[123]
class B1 {
    let a: Int64 = 123
}

// Annotation nest macro, different nodes
@LogWithLevel2[123]
class A2 {
    @M0
    let a: Int64 = 123
}

// Macro nest annotation, different nodes
@M0
class B2 {
    @LogWithLevel2[123]
    let a: Int64 = 123
}

// Macro generate: annotation
@GenerateAnno
class C {
    let a: Int64 = 123
}

// Macro generate: macro
@GenerateMacro
class D {
    let a: Int64 = 123
}

// Macro generate: annotation nest macro
@GenerateAnnoMac
class E {
    let a: Int64 = 123
}

// Macro generate: macro nest annotation
@GenerateMacroAnno
class F {
    let a: Int64 = 123
}

// Annotation nest, Macro generate: annotation, the same node
@LogWithLevel2[123]
@GenerateAnno
class C2 {
    let a: Int64 = 123
}

// Annotation nest, Macro generate: macro, the same node
@LogWithLevel2[123]
@GenerateMacro
class D2 {
    let a: Int64 = 123
}

// Annotation nest, Macro generate: annotation nest macro, the same node
@LogWithLevel2[123]
@GenerateAnnoMac
class E2 {
    let a: Int64 = 123
}

// Annotation nest, Macro generate: macro nest annotation, the same node
@LogWithLevel2[123]
@GenerateMacroAnno
class F2 {
    let a: Int64 = 123
}

// Macro nest, Macro generate: annotation, the same node
@M0
@GenerateAnno
class C3 {
    let a: Int64 = 123
}

// Macro nest, Macro generate: macro, the same node
@M0
@GenerateMacro
class D3 {
    let a: Int64 = 123
}

// Macro nest, Macro generate: annotation nest macro, the same node
@M0
@GenerateAnnoMac
class E3 {
    let a: Int64 = 123
}

// Macro nest, Macro generate: macro nest annotation, the same node
@M0
@GenerateMacroAnno
class F3 {
    let a: Int64 = 123
}

// Annotation nest, Macro generate: annotation, different nodes
@LogWithLevel2[123]
class C4 {
    @GenerateAnno
    let a: Int64 = 123
}

// Annotation nest, Macro generate: macro, different nodes
@LogWithLevel2[123]
class D4 {
    @GenerateMacro
    let a: Int64 = 123
}

// Annotation nest, Macro generate: annotation nest macro, different nodes
@LogWithLevel2[123]
class E4 {
    @GenerateAnnoMac
    let a: Int64 = 123
}

// Annotation nest, Macro generate: macro nest annotation, different nodes
@LogWithLevel2[123]
class F4 {
    @GenerateMacroAnno
    let a: Int64 = 123
}

// Macro nest, Macro generate: annotation, different nodes
@M0
class C5 {
    @GenerateAnno
    let a: Int64 = 123
}

// Macro nest, Macro generate: macro, different nodes
@M0
class D5 {
    @GenerateMacro
    let a: Int64 = 123
}

// Macro nest, Macro generate: annotation nest macro, different nodes
@M0
class E5 {
    @GenerateAnnoMac
    let a: Int64 = 123
}

// Macro nest, Macro generate: macro nest annotation, different nodes
@M0
class F5 {
    @GenerateMacroAnno
    let a: Int64 = 123
}

main() {}