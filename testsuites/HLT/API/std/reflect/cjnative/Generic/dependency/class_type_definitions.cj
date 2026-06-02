/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package dependency

public class NonGenericClass <: Equatable<NonGenericClass> {
    public operator func ==(i: NonGenericClass): Bool {
        true
    }

    public operator func !=(i: NonGenericClass): Bool {
        false
    }
}

public class GenericClassWith1TypeParameters<TypeGeneric_0> <: Equatable<GenericClassWith1TypeParameters<TypeGeneric_0>> {
    public operator func ==(i: GenericClassWith1TypeParameters<TypeGeneric_0>): Bool {
        true
    }

    public operator func !=(i: GenericClassWith1TypeParameters<TypeGeneric_0>): Bool {
        false
    }
}

public class GenericClassWith2TypeParameters<TypeGeneric_0, TypeGeneric_1> <: Equatable<GenericClassWith2TypeParameters<TypeGeneric_0,
    TypeGeneric_1>> {
    public operator func ==(i: GenericClassWith2TypeParameters<TypeGeneric_0, TypeGeneric_1>): Bool {
        true
    }

    public operator func !=(i: GenericClassWith2TypeParameters<TypeGeneric_0, TypeGeneric_1>): Bool {
        false
    }
}

public class StandardClassType<TypeGeneric_0, TypeGeneric_1, TypeGeneric_2> where TypeGeneric_0 <: Constructable<TypeGeneric_0>,
    TypeGeneric_1 <: Constructable<TypeGeneric_1>, TypeGeneric_2 <: Constructable<TypeGeneric_2> {
    public func classInstanceMemberFunction_1(): Unit {
    }

    public func classInstanceMemberFunction_2<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(): Unit where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
    }

    public func classInstanceMemberFunction_3(
        parameter_1: GenericClassWith2TypeParameters<TypeGeneric_0, TypeGeneric_0>,
        parameter_2: GenericStructWith1TypeParameters<Int64>, parameter_3: TypeGeneric_1): Unit {
    }

    public func classInstanceMemberFunction_4<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        parameter_1: NonGenericClass, parameter_2: FuncGeneric_1, parameter_3: GenericStructWith1TypeParameters<Bool>): Unit where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
    }

    public func classInstanceMemberFunction_5(p: Int64): Int64 {
        p
    }

    public func classInstanceMemberFunction_6(p: Bool): Bool {
        p
    }

    public func classInstanceMemberFunction_7(p: Unit): Unit {
        p
    }

    public func classInstanceMemberFunction_8(p: TypeGeneric_0): TypeGeneric_0 {
        p
    }

    public func classInstanceMemberFunction_9(p: TypeGeneric_1): TypeGeneric_1 {
        p
    }

    public func classInstanceMemberFunction_10(p: TypeGeneric_2): TypeGeneric_2 {
        p
    }

    public func classInstanceMemberFunction_11(p: NonGenericClass): NonGenericClass {
        p
    }

    public func classInstanceMemberFunction_12(p: NonGenericClass): NonGenericClass {
        p
    }

    public func classInstanceMemberFunction_13(p: NonGenericClass): NonGenericClass {
        p
    }

    public func classInstanceMemberFunction_14(p: NonGenericClass): NonGenericClass {
        p
    }

    public func classInstanceMemberFunction_15(p: NonGenericClass): NonGenericClass {
        p
    }

    public func classInstanceMemberFunction_16(p: NonGenericClass): NonGenericClass {
        p
    }

    public func classInstanceMemberFunction_17(p: GenericClassWith1TypeParameters<Int64>): GenericClassWith1TypeParameters<Int64> {
        p
    }

    public func classInstanceMemberFunction_18(p: GenericClassWith1TypeParameters<Bool>): GenericClassWith1TypeParameters<Bool> {
        p
    }

    public func classInstanceMemberFunction_19(p: GenericClassWith1TypeParameters<Unit>): GenericClassWith1TypeParameters<Unit> {
        p
    }

    public func classInstanceMemberFunction_20(p: GenericClassWith1TypeParameters<TypeGeneric_0>): GenericClassWith1TypeParameters<TypeGeneric_0> {
        p
    }

    public func classInstanceMemberFunction_21(p: GenericClassWith1TypeParameters<TypeGeneric_1>): GenericClassWith1TypeParameters<TypeGeneric_1> {
        p
    }

    public func classInstanceMemberFunction_22(p: GenericClassWith1TypeParameters<TypeGeneric_2>): GenericClassWith1TypeParameters<TypeGeneric_2> {
        p
    }

    public func classInstanceMemberFunction_23(p: GenericClassWith2TypeParameters<Int64, Int64>): GenericClassWith2TypeParameters<Int64,
        Int64> {
        p
    }

    public func classInstanceMemberFunction_24(p: GenericClassWith2TypeParameters<Bool, Bool>): GenericClassWith2TypeParameters<Bool,
        Bool> {
        p
    }

    public func classInstanceMemberFunction_25(p: GenericClassWith2TypeParameters<Unit, Unit>): GenericClassWith2TypeParameters<Unit,
        Unit> {
        p
    }

    public func classInstanceMemberFunction_26(p: GenericClassWith2TypeParameters<TypeGeneric_0, TypeGeneric_0>): GenericClassWith2TypeParameters<TypeGeneric_0,
        TypeGeneric_0> {
        p
    }

    public func classInstanceMemberFunction_27(p: GenericClassWith2TypeParameters<TypeGeneric_1, TypeGeneric_1>): GenericClassWith2TypeParameters<TypeGeneric_1,
        TypeGeneric_1> {
        p
    }

    public func classInstanceMemberFunction_28(p: GenericClassWith2TypeParameters<TypeGeneric_2, TypeGeneric_2>): GenericClassWith2TypeParameters<TypeGeneric_2,
        TypeGeneric_2> {
        p
    }

    public func classInstanceMemberFunction_29(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public func classInstanceMemberFunction_30(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public func classInstanceMemberFunction_31(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public func classInstanceMemberFunction_32(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public func classInstanceMemberFunction_33(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public func classInstanceMemberFunction_34(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public func classInstanceMemberFunction_35(p: GenericStructWith1TypeParameters<Int64>): GenericStructWith1TypeParameters<Int64> {
        p
    }

    public func classInstanceMemberFunction_36(p: GenericStructWith1TypeParameters<Bool>): GenericStructWith1TypeParameters<Bool> {
        p
    }

    public func classInstanceMemberFunction_37(p: GenericStructWith1TypeParameters<Unit>): GenericStructWith1TypeParameters<Unit> {
        p
    }

    public func classInstanceMemberFunction_38(p: GenericStructWith1TypeParameters<TypeGeneric_0>): GenericStructWith1TypeParameters<TypeGeneric_0> {
        p
    }

    public func classInstanceMemberFunction_39(p: GenericStructWith1TypeParameters<TypeGeneric_1>): GenericStructWith1TypeParameters<TypeGeneric_1> {
        p
    }

    public func classInstanceMemberFunction_40(p: GenericStructWith1TypeParameters<TypeGeneric_2>): GenericStructWith1TypeParameters<TypeGeneric_2> {
        p
    }

    public func classInstanceMemberFunction_41(p: GenericStructWith2TypeParameters<Int64, Int64>): GenericStructWith2TypeParameters<Int64,
        Int64> {
        p
    }

    public func classInstanceMemberFunction_42(p: GenericStructWith2TypeParameters<Bool, Bool>): GenericStructWith2TypeParameters<Bool,
        Bool> {
        p
    }

    public func classInstanceMemberFunction_43(p: GenericStructWith2TypeParameters<Unit, Unit>): GenericStructWith2TypeParameters<Unit,
        Unit> {
        p
    }

    public func classInstanceMemberFunction_44(p: GenericStructWith2TypeParameters<TypeGeneric_0, TypeGeneric_0>): GenericStructWith2TypeParameters<TypeGeneric_0,
        TypeGeneric_0> {
        p
    }

    public func classInstanceMemberFunction_45(p: GenericStructWith2TypeParameters<TypeGeneric_1, TypeGeneric_1>): GenericStructWith2TypeParameters<TypeGeneric_1,
        TypeGeneric_1> {
        p
    }

    public func classInstanceMemberFunction_46(p: GenericStructWith2TypeParameters<TypeGeneric_2, TypeGeneric_2>): GenericStructWith2TypeParameters<TypeGeneric_2,
        TypeGeneric_2> {
        p
    }

    public func classInstanceMemberFunction_47<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: Int64): Int64 {
        p
    }

    public func classInstanceMemberFunction_48<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: Bool): Bool {
        p
    }

    public func classInstanceMemberFunction_49<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: Unit): Unit {
        p
    }

    public func classInstanceMemberFunction_50<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: TypeGeneric_0): TypeGeneric_0 {
        p
    }

    public func classInstanceMemberFunction_51<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: TypeGeneric_1): TypeGeneric_1 {
        p
    }

    public func classInstanceMemberFunction_52<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: TypeGeneric_2): TypeGeneric_2 {
        p
    }

    public func classInstanceMemberFunction_53<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: FuncGeneric_0): FuncGeneric_0 {
        p
    }

    public func classInstanceMemberFunction_54<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: FuncGeneric_1): FuncGeneric_1 {
        p
    }

    public func classInstanceMemberFunction_55<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: FuncGeneric_2): FuncGeneric_2 {
        p
    }

    public func classInstanceMemberFunction_56<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass {
        p
    }

    public func classInstanceMemberFunction_57<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass {
        p
    }

    public func classInstanceMemberFunction_58<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass {
        p
    }

    public func classInstanceMemberFunction_59<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass {
        p
    }

    public func classInstanceMemberFunction_60<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass {
        p
    }

    public func classInstanceMemberFunction_61<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass {
        p
    }

    public func classInstanceMemberFunction_62<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass {
        p
    }

    public func classInstanceMemberFunction_63<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass {
        p
    }

    public func classInstanceMemberFunction_64<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass {
        p
    }

    public func classInstanceMemberFunction_65<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<Int64>): GenericClassWith1TypeParameters<Int64> {
        p
    }

    public func classInstanceMemberFunction_66<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<Bool>): GenericClassWith1TypeParameters<Bool> {
        p
    }

    public func classInstanceMemberFunction_67<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<Unit>): GenericClassWith1TypeParameters<Unit> {
        p
    }

    public func classInstanceMemberFunction_68<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<TypeGeneric_0>): GenericClassWith1TypeParameters<TypeGeneric_0> {
        p
    }

    public func classInstanceMemberFunction_69<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<TypeGeneric_1>): GenericClassWith1TypeParameters<TypeGeneric_1> {
        p
    }

    public func classInstanceMemberFunction_70<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<TypeGeneric_2>): GenericClassWith1TypeParameters<TypeGeneric_2> {
        p
    }

    public func classInstanceMemberFunction_71<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<FuncGeneric_0>): GenericClassWith1TypeParameters<FuncGeneric_0> {
        p
    }

    public func classInstanceMemberFunction_72<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<FuncGeneric_1>): GenericClassWith1TypeParameters<FuncGeneric_1> {
        p
    }

    public func classInstanceMemberFunction_73<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<FuncGeneric_2>): GenericClassWith1TypeParameters<FuncGeneric_2> {
        p
    }

    public func classInstanceMemberFunction_74<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<Int64, Int64>): GenericClassWith2TypeParameters<Int64, Int64> {
        p
    }

    public func classInstanceMemberFunction_75<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<Bool, Bool>): GenericClassWith2TypeParameters<Bool, Bool> {
        p
    }

    public func classInstanceMemberFunction_76<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<Unit, Unit>): GenericClassWith2TypeParameters<Unit, Unit> {
        p
    }

    public func classInstanceMemberFunction_77<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<TypeGeneric_0, TypeGeneric_0>): GenericClassWith2TypeParameters<TypeGeneric_0,
        TypeGeneric_0> {
        p
    }

    public func classInstanceMemberFunction_78<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<TypeGeneric_1, TypeGeneric_1>): GenericClassWith2TypeParameters<TypeGeneric_1,
        TypeGeneric_1> {
        p
    }

    public func classInstanceMemberFunction_79<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<TypeGeneric_2, TypeGeneric_2>): GenericClassWith2TypeParameters<TypeGeneric_2,
        TypeGeneric_2> {
        p
    }

    public func classInstanceMemberFunction_80<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<FuncGeneric_0, FuncGeneric_0>): GenericClassWith2TypeParameters<FuncGeneric_0,
        FuncGeneric_0> {
        p
    }

    public func classInstanceMemberFunction_81<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<FuncGeneric_1, FuncGeneric_1>): GenericClassWith2TypeParameters<FuncGeneric_1,
        FuncGeneric_1> {
        p
    }

    public func classInstanceMemberFunction_82<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<FuncGeneric_2, FuncGeneric_2>): GenericClassWith2TypeParameters<FuncGeneric_2,
        FuncGeneric_2> {
        p
    }

    public func classInstanceMemberFunction_83<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public func classInstanceMemberFunction_84<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public func classInstanceMemberFunction_85<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public func classInstanceMemberFunction_86<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public func classInstanceMemberFunction_87<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public func classInstanceMemberFunction_88<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public func classInstanceMemberFunction_89<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public func classInstanceMemberFunction_90<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public func classInstanceMemberFunction_91<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public func classInstanceMemberFunction_92<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<Int64>): GenericStructWith1TypeParameters<Int64> {
        p
    }

    public func classInstanceMemberFunction_93<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<Bool>): GenericStructWith1TypeParameters<Bool> {
        p
    }

    public func classInstanceMemberFunction_94<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<Unit>): GenericStructWith1TypeParameters<Unit> {
        p
    }

    public func classInstanceMemberFunction_95<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<TypeGeneric_0>): GenericStructWith1TypeParameters<TypeGeneric_0> {
        p
    }

    public func classInstanceMemberFunction_96<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<TypeGeneric_1>): GenericStructWith1TypeParameters<TypeGeneric_1> {
        p
    }

    public func classInstanceMemberFunction_97<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<TypeGeneric_2>): GenericStructWith1TypeParameters<TypeGeneric_2> {
        p
    }

    public func classInstanceMemberFunction_98<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<FuncGeneric_0>): GenericStructWith1TypeParameters<FuncGeneric_0> {
        p
    }

    public func classInstanceMemberFunction_99<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<FuncGeneric_1>): GenericStructWith1TypeParameters<FuncGeneric_1> {
        p
    }

    public func classInstanceMemberFunction_100<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<FuncGeneric_2>): GenericStructWith1TypeParameters<FuncGeneric_2> {
        p
    }

    public func classInstanceMemberFunction_101<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<Int64, Int64>): GenericStructWith2TypeParameters<Int64, Int64> {
        p
    }

    public func classInstanceMemberFunction_102<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<Bool, Bool>): GenericStructWith2TypeParameters<Bool, Bool> {
        p
    }

    public func classInstanceMemberFunction_103<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<Unit, Unit>): GenericStructWith2TypeParameters<Unit, Unit> {
        p
    }

    public func classInstanceMemberFunction_104<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<TypeGeneric_0, TypeGeneric_0>): GenericStructWith2TypeParameters<TypeGeneric_0,
        TypeGeneric_0> {
        p
    }

    public func classInstanceMemberFunction_105<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<TypeGeneric_1, TypeGeneric_1>): GenericStructWith2TypeParameters<TypeGeneric_1,
        TypeGeneric_1> {
        p
    }

    public func classInstanceMemberFunction_106<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<TypeGeneric_2, TypeGeneric_2>): GenericStructWith2TypeParameters<TypeGeneric_2,
        TypeGeneric_2> {
        p
    }

    public func classInstanceMemberFunction_107<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<FuncGeneric_0, FuncGeneric_0>): GenericStructWith2TypeParameters<FuncGeneric_0,
        FuncGeneric_0> {
        p
    }

    public func classInstanceMemberFunction_108<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<FuncGeneric_1, FuncGeneric_1>): GenericStructWith2TypeParameters<FuncGeneric_1,
        FuncGeneric_1> {
        p
    }

    public func classInstanceMemberFunction_109<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<FuncGeneric_2, FuncGeneric_2>): GenericStructWith2TypeParameters<FuncGeneric_2,
        FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_1(): Unit {
    }

    public static func classStaticMemberFunction_2<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(): Unit where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
    }

    public static func classStaticMemberFunction_3(parameter_1: GenericClassWith1TypeParameters<Int64>,
        parameter_2: GenericClassWith2TypeParameters<TypeGeneric_0, TypeGeneric_0>,
        parameter_3: GenericClassWith2TypeParameters<Unit, Unit>): Unit {
    }

    public static func classStaticMemberFunction_4<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        parameter_1: FuncGeneric_2, parameter_2: GenericStructWith2TypeParameters<TypeGeneric_2, TypeGeneric_2>,
        parameter_3: GenericStructWith1TypeParameters<TypeGeneric_2>): Unit where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
    }

    public static func classStaticMemberFunction_5(p: Int64): Int64 {
        p
    }

    public static func classStaticMemberFunction_6(p: Bool): Bool {
        p
    }

    public static func classStaticMemberFunction_7(p: Unit): Unit {
        p
    }

    public static func classStaticMemberFunction_8(p: TypeGeneric_0): TypeGeneric_0 {
        p
    }

    public static func classStaticMemberFunction_9(p: TypeGeneric_1): TypeGeneric_1 {
        p
    }

    public static func classStaticMemberFunction_10(p: TypeGeneric_2): TypeGeneric_2 {
        p
    }

    public static func classStaticMemberFunction_11(p: NonGenericClass): NonGenericClass {
        p
    }

    public static func classStaticMemberFunction_12(p: NonGenericClass): NonGenericClass {
        p
    }

    public static func classStaticMemberFunction_13(p: NonGenericClass): NonGenericClass {
        p
    }

    public static func classStaticMemberFunction_14(p: NonGenericClass): NonGenericClass {
        p
    }

    public static func classStaticMemberFunction_15(p: NonGenericClass): NonGenericClass {
        p
    }

    public static func classStaticMemberFunction_16(p: NonGenericClass): NonGenericClass {
        p
    }

    public static func classStaticMemberFunction_17(p: GenericClassWith1TypeParameters<Int64>): GenericClassWith1TypeParameters<Int64> {
        p
    }

    public static func classStaticMemberFunction_18(p: GenericClassWith1TypeParameters<Bool>): GenericClassWith1TypeParameters<Bool> {
        p
    }

    public static func classStaticMemberFunction_19(p: GenericClassWith1TypeParameters<Unit>): GenericClassWith1TypeParameters<Unit> {
        p
    }

    public static func classStaticMemberFunction_20(p: GenericClassWith1TypeParameters<TypeGeneric_0>): GenericClassWith1TypeParameters<TypeGeneric_0> {
        p
    }

    public static func classStaticMemberFunction_21(p: GenericClassWith1TypeParameters<TypeGeneric_1>): GenericClassWith1TypeParameters<TypeGeneric_1> {
        p
    }

    public static func classStaticMemberFunction_22(p: GenericClassWith1TypeParameters<TypeGeneric_2>): GenericClassWith1TypeParameters<TypeGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_23(p: GenericClassWith2TypeParameters<Int64, Int64>): GenericClassWith2TypeParameters<Int64,
        Int64> {
        p
    }

    public static func classStaticMemberFunction_24(p: GenericClassWith2TypeParameters<Bool, Bool>): GenericClassWith2TypeParameters<Bool,
        Bool> {
        p
    }

    public static func classStaticMemberFunction_25(p: GenericClassWith2TypeParameters<Unit, Unit>): GenericClassWith2TypeParameters<Unit,
        Unit> {
        p
    }

    public static func classStaticMemberFunction_26(p: GenericClassWith2TypeParameters<TypeGeneric_0, TypeGeneric_0>): GenericClassWith2TypeParameters<TypeGeneric_0,
        TypeGeneric_0> {
        p
    }

    public static func classStaticMemberFunction_27(p: GenericClassWith2TypeParameters<TypeGeneric_1, TypeGeneric_1>): GenericClassWith2TypeParameters<TypeGeneric_1,
        TypeGeneric_1> {
        p
    }

    public static func classStaticMemberFunction_28(p: GenericClassWith2TypeParameters<TypeGeneric_2, TypeGeneric_2>): GenericClassWith2TypeParameters<TypeGeneric_2,
        TypeGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_29(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public static func classStaticMemberFunction_30(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public static func classStaticMemberFunction_31(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public static func classStaticMemberFunction_32(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public static func classStaticMemberFunction_33(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public static func classStaticMemberFunction_34(p: NonGenericStruct): NonGenericStruct {
        p
    }

    public static func classStaticMemberFunction_35(p: GenericStructWith1TypeParameters<Int64>): GenericStructWith1TypeParameters<Int64> {
        p
    }

    public static func classStaticMemberFunction_36(p: GenericStructWith1TypeParameters<Bool>): GenericStructWith1TypeParameters<Bool> {
        p
    }

    public static func classStaticMemberFunction_37(p: GenericStructWith1TypeParameters<Unit>): GenericStructWith1TypeParameters<Unit> {
        p
    }

    public static func classStaticMemberFunction_38(p: GenericStructWith1TypeParameters<TypeGeneric_0>): GenericStructWith1TypeParameters<TypeGeneric_0> {
        p
    }

    public static func classStaticMemberFunction_39(p: GenericStructWith1TypeParameters<TypeGeneric_1>): GenericStructWith1TypeParameters<TypeGeneric_1> {
        p
    }

    public static func classStaticMemberFunction_40(p: GenericStructWith1TypeParameters<TypeGeneric_2>): GenericStructWith1TypeParameters<TypeGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_41(p: GenericStructWith2TypeParameters<Int64, Int64>): GenericStructWith2TypeParameters<Int64,
        Int64> {
        p
    }

    public static func classStaticMemberFunction_42(p: GenericStructWith2TypeParameters<Bool, Bool>): GenericStructWith2TypeParameters<Bool,
        Bool> {
        p
    }

    public static func classStaticMemberFunction_43(p: GenericStructWith2TypeParameters<Unit, Unit>): GenericStructWith2TypeParameters<Unit,
        Unit> {
        p
    }

    public static func classStaticMemberFunction_44(p: GenericStructWith2TypeParameters<TypeGeneric_0, TypeGeneric_0>): GenericStructWith2TypeParameters<TypeGeneric_0,
        TypeGeneric_0> {
        p
    }

    public static func classStaticMemberFunction_45(p: GenericStructWith2TypeParameters<TypeGeneric_1, TypeGeneric_1>): GenericStructWith2TypeParameters<TypeGeneric_1,
        TypeGeneric_1> {
        p
    }

    public static func classStaticMemberFunction_46(p: GenericStructWith2TypeParameters<TypeGeneric_2, TypeGeneric_2>): GenericStructWith2TypeParameters<TypeGeneric_2,
        TypeGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_47<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: Int64): Int64 where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_48<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: Bool): Bool where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_49<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: Unit): Unit where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_50<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: TypeGeneric_0): TypeGeneric_0 where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_51<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: TypeGeneric_1): TypeGeneric_1 where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_52<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: TypeGeneric_2): TypeGeneric_2 where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_53<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: FuncGeneric_0): FuncGeneric_0 where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_54<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: FuncGeneric_1): FuncGeneric_1 where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_55<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: FuncGeneric_2): FuncGeneric_2 where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_56<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_57<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_58<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_59<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_60<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_61<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_62<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_63<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_64<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericClass): NonGenericClass where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_65<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<Int64>): GenericClassWith1TypeParameters<Int64> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_66<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<Bool>): GenericClassWith1TypeParameters<Bool> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_67<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<Unit>): GenericClassWith1TypeParameters<Unit> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_68<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<TypeGeneric_0>): GenericClassWith1TypeParameters<TypeGeneric_0> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_69<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<TypeGeneric_1>): GenericClassWith1TypeParameters<TypeGeneric_1> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_70<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<TypeGeneric_2>): GenericClassWith1TypeParameters<TypeGeneric_2> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_71<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<FuncGeneric_0>): GenericClassWith1TypeParameters<FuncGeneric_0> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_72<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<FuncGeneric_1>): GenericClassWith1TypeParameters<FuncGeneric_1> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_73<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith1TypeParameters<FuncGeneric_2>): GenericClassWith1TypeParameters<FuncGeneric_2> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_74<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<Int64, Int64>): GenericClassWith2TypeParameters<Int64, Int64> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_75<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<Bool, Bool>): GenericClassWith2TypeParameters<Bool, Bool> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_76<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<Unit, Unit>): GenericClassWith2TypeParameters<Unit, Unit> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_77<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<TypeGeneric_0, TypeGeneric_0>): GenericClassWith2TypeParameters<TypeGeneric_0,
        TypeGeneric_0> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_78<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<TypeGeneric_1, TypeGeneric_1>): GenericClassWith2TypeParameters<TypeGeneric_1,
        TypeGeneric_1> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_79<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<TypeGeneric_2, TypeGeneric_2>): GenericClassWith2TypeParameters<TypeGeneric_2,
        TypeGeneric_2> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_80<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<FuncGeneric_0, FuncGeneric_0>): GenericClassWith2TypeParameters<FuncGeneric_0,
        FuncGeneric_0> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_81<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<FuncGeneric_1, FuncGeneric_1>): GenericClassWith2TypeParameters<FuncGeneric_1,
        FuncGeneric_1> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_82<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericClassWith2TypeParameters<FuncGeneric_2, FuncGeneric_2>): GenericClassWith2TypeParameters<FuncGeneric_2,
        FuncGeneric_2> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_83<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_84<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_85<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_86<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_87<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_88<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_89<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_90<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_91<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(p: NonGenericStruct): NonGenericStruct where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_92<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<Int64>): GenericStructWith1TypeParameters<Int64> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_93<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<Bool>): GenericStructWith1TypeParameters<Bool> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_94<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<Unit>): GenericStructWith1TypeParameters<Unit> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_95<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<TypeGeneric_0>): GenericStructWith1TypeParameters<TypeGeneric_0> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_96<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<TypeGeneric_1>): GenericStructWith1TypeParameters<TypeGeneric_1> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_97<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<TypeGeneric_2>): GenericStructWith1TypeParameters<TypeGeneric_2> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_98<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<FuncGeneric_0>): GenericStructWith1TypeParameters<FuncGeneric_0> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_99<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<FuncGeneric_1>): GenericStructWith1TypeParameters<FuncGeneric_1> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_100<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith1TypeParameters<FuncGeneric_2>): GenericStructWith1TypeParameters<FuncGeneric_2> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_101<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<Int64, Int64>): GenericStructWith2TypeParameters<Int64, Int64> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_102<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<Bool, Bool>): GenericStructWith2TypeParameters<Bool, Bool> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_103<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<Unit, Unit>): GenericStructWith2TypeParameters<Unit, Unit> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_104<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<TypeGeneric_0, TypeGeneric_0>): GenericStructWith2TypeParameters<TypeGeneric_0,
        TypeGeneric_0> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_105<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<TypeGeneric_1, TypeGeneric_1>): GenericStructWith2TypeParameters<TypeGeneric_1,
        TypeGeneric_1> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_106<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<TypeGeneric_2, TypeGeneric_2>): GenericStructWith2TypeParameters<TypeGeneric_2,
        TypeGeneric_2> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_107<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<FuncGeneric_0, FuncGeneric_0>): GenericStructWith2TypeParameters<FuncGeneric_0,
        FuncGeneric_0> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_108<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<FuncGeneric_1, FuncGeneric_1>): GenericStructWith2TypeParameters<FuncGeneric_1,
        FuncGeneric_1> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }

    public static func classStaticMemberFunction_109<FuncGeneric_0, FuncGeneric_1, FuncGeneric_2>(
        p: GenericStructWith2TypeParameters<FuncGeneric_2, FuncGeneric_2>): GenericStructWith2TypeParameters<FuncGeneric_2,
        FuncGeneric_2> where FuncGeneric_0 <: Constructable<FuncGeneric_0>,
        FuncGeneric_1 <: Constructable<FuncGeneric_1>, FuncGeneric_2 <: Constructable<FuncGeneric_2> {
        p
    }
}
