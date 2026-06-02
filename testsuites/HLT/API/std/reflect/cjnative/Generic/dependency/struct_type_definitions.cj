/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package dependency

public struct NonGenericStruct <: Equatable<NonGenericStruct> {
    public operator func ==(i: NonGenericStruct): Bool {
        true
    }

    public operator func !=(i: NonGenericStruct): Bool {
        false
    }
}

public struct GenericStructWith1TypeParameters<TypeGeneric_0> <: Equatable<GenericStructWith1TypeParameters<TypeGeneric_0>> {
    public operator func ==(i: GenericStructWith1TypeParameters<TypeGeneric_0>): Bool {
        true
    }

    public operator func !=(i: GenericStructWith1TypeParameters<TypeGeneric_0>): Bool {
        false
    }
}

public struct GenericStructWith2TypeParameters<TypeGeneric_0, TypeGeneric_1> <: Equatable<GenericStructWith2TypeParameters<TypeGeneric_0,
    TypeGeneric_1>> {
    public operator func ==(i: GenericStructWith2TypeParameters<TypeGeneric_0, TypeGeneric_1>): Bool {
        true
    }

    public operator func !=(i: GenericStructWith2TypeParameters<TypeGeneric_0, TypeGeneric_1>): Bool {
        false
    }
}

public struct StandardStructType<TypeGeneric_0, TypeGeneric_1, TypeGeneric_2> where TypeGeneric_0 <: Constructable<TypeGeneric_0>,
    TypeGeneric_1 <: Constructable<TypeGeneric_1>, TypeGeneric_2 <: Constructable<TypeGeneric_2> {
    public func classInstanceMemberFunction_110(): Unit {
    }

    public func classInstanceMemberFunction_111<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(): Unit where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
    }

    public func classInstanceMemberFunction_112(parameter_1: GenericClassWith1TypeParameters<TypeGeneric_1>,
        parameter_2: GenericClassWith1TypeParameters<Unit>, parameter_3: GenericClassWith1TypeParameters<TypeGeneric_0>): Unit {
    }

    public func classInstanceMemberFunction_113<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        parameter_1: TypeGeneric_1, parameter_2: GenericClassWith1TypeParameters<FuncGeneric_1>,
        parameter_3: NonGenericClass): Unit where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
    }

    public func classInstanceMemberFunction_114(p: Int64): Int64 {
        p
    }

    public func classInstanceMemberFunction_115(p: Bool): Bool {
        p
    }

    public func classInstanceMemberFunction_116(p: Unit): Unit {
        p
    }

    public func classInstanceMemberFunction_117(p: TypeGeneric_0): TypeGeneric_0 {
        p
    }

    public func classInstanceMemberFunction_118(p: TypeGeneric_1): TypeGeneric_1 {
        p
    }

    public func classInstanceMemberFunction_119(p: TypeGeneric_2): TypeGeneric_2 {
        p
    }

    public func classInstanceMemberFunction_120(p: NonGenericClass): NonGenericClass {
        p
    }

    public func classInstanceMemberFunction_121(p: NonGenericClass): NonGenericClass {
        p
    }

    public func classInstanceMemberFunction_122(p: NonGenericClass): NonGenericClass {
        p
    }

    public func classInstanceMemberFunction_123(p: NonGenericClass): NonGenericClass {
        p
    }

    public func classInstanceMemberFunction_124(p: NonGenericClass): NonGenericClass {
        p
    }

    public func classInstanceMemberFunction_125(p: NonGenericClass): NonGenericClass {
        p
    }

    public func classInstanceMemberFunction_126(p: GenericClassWith1TypeParameters<Int64>): GenericClassWith1TypeParameters<Int64> {
        p
    }

    public func classInstanceMemberFunction_127(p: GenericClassWith1TypeParameters<Bool>): GenericClassWith1TypeParameters<Bool> {
        p
    }

    public func classInstanceMemberFunction_128(p: GenericClassWith1TypeParameters<Unit>): GenericClassWith1TypeParameters<Unit> {
        p
    }

    public func classInstanceMemberFunction_129(p: GenericClassWith1TypeParameters<TypeGeneric_0>): GenericClassWith1TypeParameters<TypeGeneric_0> {
        p
    }

    public func classInstanceMemberFunction_130(p: GenericClassWith1TypeParameters<TypeGeneric_1>): GenericClassWith1TypeParameters<TypeGeneric_1> {
        p
    }

    public func classInstanceMemberFunction_131(p: GenericClassWith1TypeParameters<TypeGeneric_2>): GenericClassWith1TypeParameters<TypeGeneric_2> {
        p
    }

    public func classInstanceMemberFunction_132(p: GenericClassWith2TypeParameters<Int64, Int64>): GenericClassWith2TypeParameters<Int64,
        Int64> {
        p
    }

    public func classInstanceMemberFunction_133(p: GenericClassWith2TypeParameters<Bool, Bool>): GenericClassWith2TypeParameters<Bool,
        Bool> {
        p
    }

    public func classInstanceMemberFunction_134(p: GenericClassWith2TypeParameters<Unit, Unit>): GenericClassWith2TypeParameters<Unit,
        Unit> {
        p
    }

    public func classInstanceMemberFunction_135(p: GenericClassWith2TypeParameters<TypeGeneric_0, TypeGeneric_0>): GenericClassWith2TypeParameters<TypeGeneric_0,
        TypeGeneric_0> {
        p
    }

    public func classInstanceMemberFunction_136(p: GenericClassWith2TypeParameters<TypeGeneric_1, TypeGeneric_1>): GenericClassWith2TypeParameters<TypeGeneric_1,
        TypeGeneric_1> {
        p
    }

    public func classInstanceMemberFunction_137(p: GenericClassWith2TypeParameters<TypeGeneric_2, TypeGeneric_2>): GenericClassWith2TypeParameters<TypeGeneric_2,
        TypeGeneric_2> {
        p
    }

    public func classInstanceMemberFunction_138(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public func classInstanceMemberFunction_139(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public func classInstanceMemberFunction_140(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public func classInstanceMemberFunction_141(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public func classInstanceMemberFunction_142(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public func classInstanceMemberFunction_143(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public func classInstanceMemberFunction_144(p: GenericStructWith1TypeParameters<Int64>): GenericStructWith1TypeParameters<Int64> {
        p
    }

    public func classInstanceMemberFunction_145(p: GenericStructWith1TypeParameters<Bool>): GenericStructWith1TypeParameters<Bool> {
        p
    }

    public func classInstanceMemberFunction_146(p: GenericStructWith1TypeParameters<Unit>): GenericStructWith1TypeParameters<Unit> {
        p
    }

    public func classInstanceMemberFunction_147(p: GenericStructWith1TypeParameters<TypeGeneric_0>): GenericStructWith1TypeParameters<TypeGeneric_0> {
        p
    }

    public func classInstanceMemberFunction_148(p: GenericStructWith1TypeParameters<TypeGeneric_1>): GenericStructWith1TypeParameters<TypeGeneric_1> {
        p
    }

    public func classInstanceMemberFunction_149(p: GenericStructWith1TypeParameters<TypeGeneric_2>): GenericStructWith1TypeParameters<TypeGeneric_2> {
        p
    }

    public func classInstanceMemberFunction_150(p: GenericStructWith2TypeParameters<Int64, Int64>): GenericStructWith2TypeParameters<Int64,
        Int64> {
        p
    }

    public func classInstanceMemberFunction_151(p: GenericStructWith2TypeParameters<Bool, Bool>): GenericStructWith2TypeParameters<Bool,
        Bool> {
        p
    }

    public func classInstanceMemberFunction_152(p: GenericStructWith2TypeParameters<Unit, Unit>): GenericStructWith2TypeParameters<Unit,
        Unit> {
        p
    }

    public func classInstanceMemberFunction_153(p: GenericStructWith2TypeParameters<TypeGeneric_0, TypeGeneric_0>): GenericStructWith2TypeParameters<TypeGeneric_0,
        TypeGeneric_0> {
        p
    }

    public func classInstanceMemberFunction_154(p: GenericStructWith2TypeParameters<TypeGeneric_1, TypeGeneric_1>): GenericStructWith2TypeParameters<TypeGeneric_1,
        TypeGeneric_1> {
        p
    }

    public func classInstanceMemberFunction_155(p: GenericStructWith2TypeParameters<TypeGeneric_2, TypeGeneric_2>): GenericStructWith2TypeParameters<TypeGeneric_2,
        TypeGeneric_2> {
        p
    }

    public func classInstanceMemberFunction_156<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: Int64): Int64 {
        p
    }

    public func classInstanceMemberFunction_157<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: Bool): Bool {
        p
    }

    public func classInstanceMemberFunction_158<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: Unit): Unit {
        p
    }

    public func classInstanceMemberFunction_159<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: TypeGeneric_0): TypeGeneric_0 {
        p
    }

    public func classInstanceMemberFunction_160<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: TypeGeneric_1): TypeGeneric_1 {
        p
    }

    public func classInstanceMemberFunction_161<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: TypeGeneric_2): TypeGeneric_2 {
        p
    }

    public func classInstanceMemberFunction_162<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: FuncGeneric_0): FuncGeneric_0 {
        p
    }

    public func classInstanceMemberFunction_163<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: FuncGeneric_1): FuncGeneric_1 {
        p
    }

    public func classInstanceMemberFunction_164<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: FuncGeneric_2): FuncGeneric_2 {
        p
    }

    public func classInstanceMemberFunction_165<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass {
        p
    }

    public func classInstanceMemberFunction_166<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass {
        p
    }

    public func classInstanceMemberFunction_167<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass {
        p
    }

    public func classInstanceMemberFunction_168<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass {
        p
    }

    public func classInstanceMemberFunction_169<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass {
        p
    }

    public func classInstanceMemberFunction_170<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass {
        p
    }

    public func classInstanceMemberFunction_171<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass {
        p
    }

    public func classInstanceMemberFunction_172<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass {
        p
    }

    public func classInstanceMemberFunction_173<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass {
        p
    }

    public func classInstanceMemberFunction_174<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<Int64>): GenericClassWith1TypeParameters<Int64> {
        p
    }

    public func classInstanceMemberFunction_175<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<Bool>): GenericClassWith1TypeParameters<Bool> {
        p
    }

    public func classInstanceMemberFunction_176<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<Unit>): GenericClassWith1TypeParameters<Unit> {
        p
    }

    public func classInstanceMemberFunction_177<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<TypeGeneric_0>): GenericClassWith1TypeParameters<TypeGeneric_0> {
        p
    }

    public func classInstanceMemberFunction_178<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<TypeGeneric_1>): GenericClassWith1TypeParameters<TypeGeneric_1> {
        p
    }

    public func classInstanceMemberFunction_179<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<TypeGeneric_2>): GenericClassWith1TypeParameters<TypeGeneric_2> {
        p
    }

    public func classInstanceMemberFunction_180<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<FuncGeneric_0>): GenericClassWith1TypeParameters<FuncGeneric_0> {
        p
    }

    public func classInstanceMemberFunction_181<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<FuncGeneric_1>): GenericClassWith1TypeParameters<FuncGeneric_1> {
        p
    }

    public func classInstanceMemberFunction_182<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<FuncGeneric_2>): GenericClassWith1TypeParameters<FuncGeneric_2> {
        p
    }

    public func classInstanceMemberFunction_183<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<Int64, Int64>): GenericClassWith2TypeParameters<Int64, Int64> {
        p
    }

    public func classInstanceMemberFunction_184<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<Bool, Bool>): GenericClassWith2TypeParameters<Bool, Bool> {
        p
    }

    public func classInstanceMemberFunction_185<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<Unit, Unit>): GenericClassWith2TypeParameters<Unit, Unit> {
        p
    }

    public func classInstanceMemberFunction_186<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<TypeGeneric_0, TypeGeneric_0>): GenericClassWith2TypeParameters<TypeGeneric_0,
        TypeGeneric_0> {
        p
    }

    public func classInstanceMemberFunction_187<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<TypeGeneric_1, TypeGeneric_1>): GenericClassWith2TypeParameters<TypeGeneric_1,
        TypeGeneric_1> {
        p
    }

    public func classInstanceMemberFunction_188<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<TypeGeneric_2, TypeGeneric_2>): GenericClassWith2TypeParameters<TypeGeneric_2,
        TypeGeneric_2> {
        p
    }

    public func classInstanceMemberFunction_189<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<FuncGeneric_0, FuncGeneric_0>): GenericClassWith2TypeParameters<FuncGeneric_0,
        FuncGeneric_0> {
        p
    }

    public func classInstanceMemberFunction_190<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<FuncGeneric_1, FuncGeneric_1>): GenericClassWith2TypeParameters<FuncGeneric_1,
        FuncGeneric_1> {
        p
    }

    public func classInstanceMemberFunction_191<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<FuncGeneric_2, FuncGeneric_2>): GenericClassWith2TypeParameters<FuncGeneric_2,
        FuncGeneric_2> {
        p
    }

    public func classInstanceMemberFunction_192<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public func classInstanceMemberFunction_193<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public func classInstanceMemberFunction_194<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public func classInstanceMemberFunction_195<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public func classInstanceMemberFunction_196<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public func classInstanceMemberFunction_197<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public func classInstanceMemberFunction_198<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public func classInstanceMemberFunction_199<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public func classInstanceMemberFunction_200<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public func classInstanceMemberFunction_201<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<Int64>): GenericStructWith1TypeParameters<Int64> {
        p
    }

    public func classInstanceMemberFunction_202<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<Bool>): GenericStructWith1TypeParameters<Bool> {
        p
    }

    public func classInstanceMemberFunction_203<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<Unit>): GenericStructWith1TypeParameters<Unit> {
        p
    }

    public func classInstanceMemberFunction_204<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<TypeGeneric_0>): GenericStructWith1TypeParameters<TypeGeneric_0> {
        p
    }

    public func classInstanceMemberFunction_205<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<TypeGeneric_1>): GenericStructWith1TypeParameters<TypeGeneric_1> {
        p
    }

    public func classInstanceMemberFunction_206<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<TypeGeneric_2>): GenericStructWith1TypeParameters<TypeGeneric_2> {
        p
    }

    public func classInstanceMemberFunction_207<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<FuncGeneric_0>): GenericStructWith1TypeParameters<FuncGeneric_0> {
        p
    }

    public func classInstanceMemberFunction_208<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<FuncGeneric_1>): GenericStructWith1TypeParameters<FuncGeneric_1> {
        p
    }

    public func classInstanceMemberFunction_209<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<FuncGeneric_2>): GenericStructWith1TypeParameters<FuncGeneric_2> {
        p
    }

    public func classInstanceMemberFunction_210<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<Int64, Int64>): GenericStructWith2TypeParameters<Int64, Int64> {
        p
    }

    public func classInstanceMemberFunction_211<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<Bool, Bool>): GenericStructWith2TypeParameters<Bool, Bool> {
        p
    }

    public func classInstanceMemberFunction_212<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<Unit, Unit>): GenericStructWith2TypeParameters<Unit, Unit> {
        p
    }

    public func classInstanceMemberFunction_213<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<TypeGeneric_0, TypeGeneric_0>): GenericStructWith2TypeParameters<TypeGeneric_0,
        TypeGeneric_0> {
        p
    }

    public func classInstanceMemberFunction_214<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<TypeGeneric_1, TypeGeneric_1>): GenericStructWith2TypeParameters<TypeGeneric_1,
        TypeGeneric_1> {
        p
    }

    public func classInstanceMemberFunction_215<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<TypeGeneric_2, TypeGeneric_2>): GenericStructWith2TypeParameters<TypeGeneric_2,
        TypeGeneric_2> {
        p
    }

    public func classInstanceMemberFunction_216<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<FuncGeneric_0, FuncGeneric_0>): GenericStructWith2TypeParameters<FuncGeneric_0,
        FuncGeneric_0> {
        p
    }

    public func classInstanceMemberFunction_217<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<FuncGeneric_1, FuncGeneric_1>): GenericStructWith2TypeParameters<FuncGeneric_1,
        FuncGeneric_1> {
        p
    }

    public func classInstanceMemberFunction_218<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<FuncGeneric_2, FuncGeneric_2>): GenericStructWith2TypeParameters<FuncGeneric_2,
        FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_110(): Unit {
    }

    public static func classStaticMemberFunction_111<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(): Unit where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
    }

    public static func classStaticMemberFunction_112(parameter_1: TypeGeneric_2, parameter_2: NonGenericClass,
        parameter_3: GenericClassWith1TypeParameters<Int64>): Unit {
    }

    public static func classStaticMemberFunction_113<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        parameter_1: GenericStructWith1TypeParameters<TypeGeneric_2>, parameter_2: NonGenericClass,
        parameter_3: NonGenericClass): Unit where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
    }

    public static func classStaticMemberFunction_114(p: Int64): Int64 {
        p
    }

    public static func classStaticMemberFunction_115(p: Bool): Bool {
        p
    }

    public static func classStaticMemberFunction_116(p: Unit): Unit {
        p
    }

    public static func classStaticMemberFunction_117(p: TypeGeneric_0): TypeGeneric_0 {
        p
    }

    public static func classStaticMemberFunction_118(p: TypeGeneric_1): TypeGeneric_1 {
        p
    }

    public static func classStaticMemberFunction_119(p: TypeGeneric_2): TypeGeneric_2 {
        p
    }

    public static func classStaticMemberFunction_120(p: NonGenericClass): NonGenericClass {
        p
    }

    public static func classStaticMemberFunction_121(p: NonGenericClass): NonGenericClass {
        p
    }

    public static func classStaticMemberFunction_122(p: NonGenericClass): NonGenericClass {
        p
    }

    public static func classStaticMemberFunction_123(p: NonGenericClass): NonGenericClass {
        p
    }

    public static func classStaticMemberFunction_124(p: NonGenericClass): NonGenericClass {
        p
    }

    public static func classStaticMemberFunction_125(p: NonGenericClass): NonGenericClass {
        p
    }

    public static func classStaticMemberFunction_126(p: GenericClassWith1TypeParameters<Int64>): GenericClassWith1TypeParameters<Int64> {
        p
    }

    public static func classStaticMemberFunction_127(p: GenericClassWith1TypeParameters<Bool>): GenericClassWith1TypeParameters<Bool> {
        p
    }

    public static func classStaticMemberFunction_128(p: GenericClassWith1TypeParameters<Unit>): GenericClassWith1TypeParameters<Unit> {
        p
    }

    public static func classStaticMemberFunction_129(p: GenericClassWith1TypeParameters<TypeGeneric_0>): GenericClassWith1TypeParameters<TypeGeneric_0> {
        p
    }

    public static func classStaticMemberFunction_130(p: GenericClassWith1TypeParameters<TypeGeneric_1>): GenericClassWith1TypeParameters<TypeGeneric_1> {
        p
    }

    public static func classStaticMemberFunction_131(p: GenericClassWith1TypeParameters<TypeGeneric_2>): GenericClassWith1TypeParameters<TypeGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_132(p: GenericClassWith2TypeParameters<Int64, Int64>): GenericClassWith2TypeParameters<Int64,
        Int64> {
        p
    }

    public static func classStaticMemberFunction_133(p: GenericClassWith2TypeParameters<Bool, Bool>): GenericClassWith2TypeParameters<Bool,
        Bool> {
        p
    }

    public static func classStaticMemberFunction_134(p: GenericClassWith2TypeParameters<Unit, Unit>): GenericClassWith2TypeParameters<Unit,
        Unit> {
        p
    }

    public static func classStaticMemberFunction_135(p: GenericClassWith2TypeParameters<TypeGeneric_0, TypeGeneric_0>): GenericClassWith2TypeParameters<TypeGeneric_0,
        TypeGeneric_0> {
        p
    }

    public static func classStaticMemberFunction_136(p: GenericClassWith2TypeParameters<TypeGeneric_1, TypeGeneric_1>): GenericClassWith2TypeParameters<TypeGeneric_1,
        TypeGeneric_1> {
        p
    }

    public static func classStaticMemberFunction_137(p: GenericClassWith2TypeParameters<TypeGeneric_2, TypeGeneric_2>): GenericClassWith2TypeParameters<TypeGeneric_2,
        TypeGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_138(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public static func classStaticMemberFunction_139(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public static func classStaticMemberFunction_140(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public static func classStaticMemberFunction_141(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public static func classStaticMemberFunction_142(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public static func classStaticMemberFunction_143(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public static func classStaticMemberFunction_144(p: GenericStructWith1TypeParameters<Int64>): GenericStructWith1TypeParameters<Int64> {
        p
    }

    public static func classStaticMemberFunction_145(p: GenericStructWith1TypeParameters<Bool>): GenericStructWith1TypeParameters<Bool> {
        p
    }

    public static func classStaticMemberFunction_146(p: GenericStructWith1TypeParameters<Unit>): GenericStructWith1TypeParameters<Unit> {
        p
    }

    public static func classStaticMemberFunction_147(p: GenericStructWith1TypeParameters<TypeGeneric_0>): GenericStructWith1TypeParameters<TypeGeneric_0> {
        p
    }

    public static func classStaticMemberFunction_148(p: GenericStructWith1TypeParameters<TypeGeneric_1>): GenericStructWith1TypeParameters<TypeGeneric_1> {
        p
    }

    public static func classStaticMemberFunction_149(p: GenericStructWith1TypeParameters<TypeGeneric_2>): GenericStructWith1TypeParameters<TypeGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_150(p: GenericStructWith2TypeParameters<Int64, Int64>): GenericStructWith2TypeParameters<Int64,
        Int64> {
        p
    }

    public static func classStaticMemberFunction_151(p: GenericStructWith2TypeParameters<Bool, Bool>): GenericStructWith2TypeParameters<Bool,
        Bool> {
        p
    }

    public static func classStaticMemberFunction_152(p: GenericStructWith2TypeParameters<Unit, Unit>): GenericStructWith2TypeParameters<Unit,
        Unit> {
        p
    }

    public static func classStaticMemberFunction_153(p: GenericStructWith2TypeParameters<TypeGeneric_0, TypeGeneric_0>): GenericStructWith2TypeParameters<TypeGeneric_0,
        TypeGeneric_0> {
        p
    }

    public static func classStaticMemberFunction_154(p: GenericStructWith2TypeParameters<TypeGeneric_1, TypeGeneric_1>): GenericStructWith2TypeParameters<TypeGeneric_1,
        TypeGeneric_1> {
        p
    }

    public static func classStaticMemberFunction_155(p: GenericStructWith2TypeParameters<TypeGeneric_2, TypeGeneric_2>): GenericStructWith2TypeParameters<TypeGeneric_2,
        TypeGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_156<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: Int64): Int64 where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_157<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: Bool): Bool where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_158<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: Unit): Unit where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_159<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: TypeGeneric_0): TypeGeneric_0 where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_160<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: TypeGeneric_1): TypeGeneric_1 where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_161<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: TypeGeneric_2): TypeGeneric_2 where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_162<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: FuncGeneric_0): FuncGeneric_0 where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_163<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: FuncGeneric_1): FuncGeneric_1 where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_164<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: FuncGeneric_2): FuncGeneric_2 where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_165<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_166<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_167<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_168<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_169<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_170<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_171<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_172<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_173<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_174<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<Int64>): GenericClassWith1TypeParameters<Int64> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_175<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<Bool>): GenericClassWith1TypeParameters<Bool> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_176<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<Unit>): GenericClassWith1TypeParameters<Unit> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_177<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<TypeGeneric_0>): GenericClassWith1TypeParameters<TypeGeneric_0> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_178<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<TypeGeneric_1>): GenericClassWith1TypeParameters<TypeGeneric_1> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_179<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<TypeGeneric_2>): GenericClassWith1TypeParameters<TypeGeneric_2> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_180<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<FuncGeneric_0>): GenericClassWith1TypeParameters<FuncGeneric_0> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_181<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<FuncGeneric_1>): GenericClassWith1TypeParameters<FuncGeneric_1> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_182<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<FuncGeneric_2>): GenericClassWith1TypeParameters<FuncGeneric_2> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_183<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<Int64, Int64>): GenericClassWith2TypeParameters<Int64, Int64> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_184<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<Bool, Bool>): GenericClassWith2TypeParameters<Bool, Bool> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_185<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<Unit, Unit>): GenericClassWith2TypeParameters<Unit, Unit> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_186<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<TypeGeneric_0, TypeGeneric_0>): GenericClassWith2TypeParameters<TypeGeneric_0,
        TypeGeneric_0> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_187<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<TypeGeneric_1, TypeGeneric_1>): GenericClassWith2TypeParameters<TypeGeneric_1,
        TypeGeneric_1> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_188<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<TypeGeneric_2, TypeGeneric_2>): GenericClassWith2TypeParameters<TypeGeneric_2,
        TypeGeneric_2> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_189<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<FuncGeneric_0, FuncGeneric_0>): GenericClassWith2TypeParameters<FuncGeneric_0,
        FuncGeneric_0> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_190<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<FuncGeneric_1, FuncGeneric_1>): GenericClassWith2TypeParameters<FuncGeneric_1,
        FuncGeneric_1> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_191<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<FuncGeneric_2, FuncGeneric_2>): GenericClassWith2TypeParameters<FuncGeneric_2,
        FuncGeneric_2> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_192<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_193<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_194<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_195<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_196<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_197<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_198<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_199<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_200<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_201<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<Int64>): GenericStructWith1TypeParameters<Int64> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_202<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<Bool>): GenericStructWith1TypeParameters<Bool> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_203<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<Unit>): GenericStructWith1TypeParameters<Unit> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_204<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<TypeGeneric_0>): GenericStructWith1TypeParameters<TypeGeneric_0> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_205<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<TypeGeneric_1>): GenericStructWith1TypeParameters<TypeGeneric_1> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_206<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<TypeGeneric_2>): GenericStructWith1TypeParameters<TypeGeneric_2> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_207<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<FuncGeneric_0>): GenericStructWith1TypeParameters<FuncGeneric_0> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_208<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<FuncGeneric_1>): GenericStructWith1TypeParameters<FuncGeneric_1> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_209<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<FuncGeneric_2>): GenericStructWith1TypeParameters<FuncGeneric_2> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_210<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<Int64, Int64>): GenericStructWith2TypeParameters<Int64, Int64> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_211<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<Bool, Bool>): GenericStructWith2TypeParameters<Bool, Bool> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_212<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<Unit, Unit>): GenericStructWith2TypeParameters<Unit, Unit> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_213<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<TypeGeneric_0, TypeGeneric_0>): GenericStructWith2TypeParameters<TypeGeneric_0,
        TypeGeneric_0> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_214<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<TypeGeneric_1, TypeGeneric_1>): GenericStructWith2TypeParameters<TypeGeneric_1,
        TypeGeneric_1> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_215<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<TypeGeneric_2, TypeGeneric_2>): GenericStructWith2TypeParameters<TypeGeneric_2,
        TypeGeneric_2> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_216<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<FuncGeneric_0, FuncGeneric_0>): GenericStructWith2TypeParameters<FuncGeneric_0,
        FuncGeneric_0> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_217<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<FuncGeneric_1, FuncGeneric_1>): GenericStructWith2TypeParameters<FuncGeneric_1,
        FuncGeneric_1> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_218<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<FuncGeneric_2, FuncGeneric_2>): GenericStructWith2TypeParameters<FuncGeneric_2,
        FuncGeneric_2> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }
}
