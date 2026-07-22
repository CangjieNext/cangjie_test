/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.reflect.*

@Test
public class ModifierInfoTest {
    @TestCase
    func test_toString(): Unit {
        @Expect(ModifierInfo.Open.toString(), "open")
        @Expect(ModifierInfo.Override.toString(), "override")
        @Expect(ModifierInfo.Redef.toString(), "redef")
        @Expect(ModifierInfo.Abstract.toString(), "abstract")
        @Expect(ModifierInfo.Sealed.toString(), "sealed")
        @Expect(ModifierInfo.Mut.toString(), "mut")
        @Expect(ModifierInfo.Static.toString(), "static")
    }

    @TestCase
    func test_equality(): Unit {
        @Expect(ModifierInfo.Open == ModifierInfo.Open)
        @Expect(ModifierInfo.Open != ModifierInfo.Static)
        @Expect(ModifierInfo.Abstract == ModifierInfo.Abstract)
        @Expect(ModifierInfo.Mut != ModifierInfo.Open)
    }

    @TestCase
    func test_hashCode(): Unit {
        @Expect(ModifierInfo.Open.hashCode(), ModifierInfo.Open.hashCode())
        @Expect(ModifierInfo.Open.hashCode() != ModifierInfo.Static.hashCode())
    }

    @TestCase
    func test_all_variants_distinct(): Unit {
        let all = [
            ModifierInfo.Open, ModifierInfo.Override, ModifierInfo.Redef,
            ModifierInfo.Abstract, ModifierInfo.Sealed, ModifierInfo.Mut, ModifierInfo.Static
        ]
        // Verify all pairs are different
        for (i in 0..all.size) {
            for (j in 0..all.size) {
                if (i == j) {
                    @Expect(all[i] == all[j])
                } else {
                    @Expect(all[i] != all[j])
                }
            }
        }
    }

    @TestCase
    func test_toString_all_distinct(): Unit {
        let strs = [
            ModifierInfo.Open.toString(),
            ModifierInfo.Override.toString(),
            ModifierInfo.Redef.toString(),
            ModifierInfo.Abstract.toString(),
            ModifierInfo.Sealed.toString(),
            ModifierInfo.Mut.toString(),
            ModifierInfo.Static.toString()
        ]
        // All strings should be different
        for (i in 0..strs.size) {
            for (j in 0..strs.size) {
                if (i != j) {
                    @Expect(strs[i] != strs[j])
                }
            }
        }
    }

    @TestCase
    func test_hashCode_all_distinct(): Unit {
        let hashes = [
            ModifierInfo.Open.hashCode(),
            ModifierInfo.Override.hashCode(),
            ModifierInfo.Redef.hashCode(),
            ModifierInfo.Abstract.hashCode(),
            ModifierInfo.Sealed.hashCode(),
            ModifierInfo.Mut.hashCode(),
            ModifierInfo.Static.hashCode()
        ]
        // All hash codes should be different
        for (i in 0..hashes.size) {
            for (j in 0..hashes.size) {
                if (i != j) {
                    @Expect(hashes[i] != hashes[j])
                }
            }
        }
    }
}
