/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC: %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.database.sql.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestTransaction {
    @TestCase
    func TransactionIsoLevelTest(): Unit {
        @Expect(TransactionIsoLevel.Unspecified.toString(), "Unspecified")
        @Expect(ReadCommitted.toString(), "Read Committed")
        @Expect(ReadUncommitted.toString(), "Read Uncommitted")
        @Expect(RepeatableRead.toString(), "Repeatable Read")
        @Expect(Snapshot.toString(), "Snapshot")
        @Expect(Serializable.toString(), "Serializable")
        @Expect(Linearizable.toString(), "Linearizable")
        @Expect(Chaos.toString(), "Chaos")

        @Expect(TransactionIsoLevel.Unspecified, TransactionIsoLevel.Unspecified)
        @Expect(ReadCommitted, ReadCommitted)
        @Expect(ReadUncommitted, ReadUncommitted)
        @Expect(RepeatableRead, RepeatableRead)
        @Expect(Snapshot, Snapshot)
        @Expect(Serializable, Serializable)
        @Expect(Linearizable, Linearizable)
        @Expect(Chaos, Chaos)

        @Expect(TransactionIsoLevel.Unspecified != TransactionIsoLevel.Unspecified, false)
        @Expect(ReadCommitted != ReadCommitted, false)
        @Expect(ReadUncommitted != ReadUncommitted, false)
        @Expect(RepeatableRead != RepeatableRead, false)
        @Expect(Snapshot != Snapshot, false)
        @Expect(Serializable != Serializable, false)
        @Expect(Linearizable != Linearizable, false)
        @Expect(Chaos != Chaos, false)

        @Expect(TransactionIsoLevel.Unspecified != ReadCommitted, true)
        @Expect(TransactionIsoLevel.Unspecified != ReadUncommitted, true)
        @Expect(TransactionIsoLevel.Unspecified != RepeatableRead, true)
        @Expect(TransactionIsoLevel.Unspecified != Snapshot, true)
        @Expect(TransactionIsoLevel.Unspecified != Serializable, true)
        @Expect(TransactionIsoLevel.Unspecified != Linearizable, true)
        @Expect(TransactionIsoLevel.Unspecified != Chaos, true)

        @Expect(TransactionIsoLevel.Unspecified.hashCode(), "Unspecified".hashCode())
    }

    @TestCase
    func TransactionAccessModeTest(): Unit {
        @Expect(TransactionAccessMode.Unspecified.toString(), "Unspecified")
        @Expect(ReadWrite.toString(), "Read Write")
        @Expect(ReadOnly.toString(), "Read Only")

        @Expect(TransactionAccessMode.Unspecified, TransactionAccessMode.Unspecified)
        @Expect(ReadWrite, ReadWrite)
        @Expect(ReadOnly, ReadOnly)

        @Expect(TransactionAccessMode.Unspecified != TransactionAccessMode.Unspecified, false)
        @Expect(ReadWrite != ReadWrite, false)
        @Expect(ReadOnly != ReadOnly, false)

        @Expect(TransactionAccessMode.Unspecified != ReadWrite, true)
        @Expect(TransactionAccessMode.Unspecified != ReadOnly, true)
        @Expect(ReadWrite!= ReadOnly, true)

        @Expect(TransactionAccessMode.Unspecified.hashCode(), "Unspecified".hashCode())
    }

    @TestCase
    func TransactionDeferrableModeTest(): Unit {
        @Expect(TransactionDeferrableMode.Unspecified.toString(), "Unspecified")
        @Expect(Deferrable.toString(), "Deferrable")
        @Expect(NotDeferrable.toString(), "Not Deferrable")

        @Expect(TransactionDeferrableMode.Unspecified, TransactionDeferrableMode.Unspecified)
        @Expect(Deferrable, Deferrable)
        @Expect(NotDeferrable, NotDeferrable)

        @Expect(TransactionDeferrableMode.Unspecified != TransactionDeferrableMode.Unspecified, false)
        @Expect(Deferrable != Deferrable, false)
        @Expect(NotDeferrable != NotDeferrable, false)

        @Expect(TransactionDeferrableMode.Unspecified != Deferrable, true)
        @Expect(TransactionDeferrableMode.Unspecified != NotDeferrable, true)
        @Expect(Deferrable!= NotDeferrable, true)

        @Expect(TransactionDeferrableMode.Unspecified.hashCode(), "Unspecified".hashCode())
    }
}
