// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myType

@Annotation
@A0
@A1[12]
@A2[true, "a"]
@A3[false, "b"]
@A4[1.2, "q", p2: "hello", p3: 14]
@Configure[explicitGC: ExplicitGcType . Heavy]
@TestCase[rune in [r',', r'!', r'"', r'#', r'$', r'%', r'\'', r'(', r')', r'*', r'+', r'-', r'.', r'-', r'/']]
public class A0 {
    @A0
    @A1[12]
    @A2[true, "a"]
    @A3[false, "b"]
    @A4[1.2, "q", p2: "hello", p3: 14]
    @A4[S4(), (), p2: true, p3: 2.4]
    public const init() {}
}
