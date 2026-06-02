/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt

import std.database.sql.*

@Test
class Test_enum_28 {
    /*
     * Test description:
     *     test parameter of the enum ConnectionState
     * Test API:
     *     public enum ConnectionState
     */
    @TestCase
    func test_connectionstate_01(): Unit {
        @Expect(ConnectionState.Broken == Broken, true)
        @Expect(ConnectionState.Closed == Closed, true)
        @Expect(ConnectionState.Connecting == Connecting, true)
        @Expect(ConnectionState.Connected == Connected, true)
        @Expect(ConnectionState.Broken != Closed, true)
        @Expect(ConnectionState.Closed != Connecting, true)
        @Expect(ConnectionState.Connecting != Connected, true)
        @Expect(ConnectionState.Connected != Broken, true)
    }

    /*
     * Test description:
     *     test parameter of the enum TransactionIsoLevel
     * Test API:
     *     public enum TransactionIsoLevel
     */
    @TestCase
    func test_transactionisolevel_02(): Unit {
        @Expect(TransactionIsoLevel.Unspecified == TransactionIsoLevel.Unspecified, true)
        @Expect(TransactionIsoLevel.ReadCommitted == ReadCommitted, true)
        @Expect(TransactionIsoLevel.ReadUncommitted == ReadUncommitted, true)
        @Expect(TransactionIsoLevel.RepeatableRead == RepeatableRead, true)
        @Expect(TransactionIsoLevel.Snapshot == Snapshot, true)
        @Expect(TransactionIsoLevel.Serializable == Serializable, true)
        @Expect(TransactionIsoLevel.Linearizable == Linearizable, true)
        @Expect(TransactionIsoLevel.Chaos == Chaos, true)

        @Expect(TransactionIsoLevel.Unspecified != ReadCommitted, true)
        @Expect(TransactionIsoLevel.ReadCommitted != ReadUncommitted, true)
        @Expect(TransactionIsoLevel.ReadUncommitted != RepeatableRead, true)
        @Expect(TransactionIsoLevel.RepeatableRead != Snapshot, true)
        @Expect(TransactionIsoLevel.Snapshot != Serializable, true)
        @Expect(TransactionIsoLevel.Serializable != Linearizable, true)
        @Expect(TransactionIsoLevel.Linearizable != Chaos, true)
        @Expect(TransactionIsoLevel.Chaos != TransactionIsoLevel.Unspecified, true)

        @Expect(TransactionIsoLevel.Unspecified.toString(), "Unspecified")
        @Expect(TransactionIsoLevel.ReadCommitted.toString(), "Read Committed")
        @Expect(TransactionIsoLevel.Chaos.hashCode(), "Chaos".hashCode())
    }

    /*
     * Test description:
     *     test parameter of the enum TransactionAccessMode
     * Test API:
     *     public enum TransactionAccessMode
     */
    @TestCase
    func test_transactionaccessmode_03(): Unit {
        @Expect(TransactionAccessMode.Unspecified == TransactionAccessMode.Unspecified, true)
        @Expect(TransactionAccessMode.ReadWrite == ReadWrite, true)
        @Expect(TransactionAccessMode.ReadOnly == ReadOnly, true)

        @Expect(TransactionAccessMode.Unspecified != ReadWrite, true)
        @Expect(TransactionAccessMode.ReadWrite != ReadOnly, true)
        @Expect(TransactionAccessMode.ReadOnly != TransactionAccessMode.Unspecified, true)

        @Expect(TransactionAccessMode.Unspecified.toString(),"Unspecified")
        @Expect(TransactionAccessMode.ReadWrite.toString(),"Read Write")
        @Expect(TransactionAccessMode.ReadOnly.toString(),"Read Only")
        @Expect(TransactionAccessMode.ReadWrite.hashCode(),"Read Write".hashCode())
    }

    /*
     * Test description:
     *     test parameter of the enum TransactionDeferrableMode
     * Test API:
     *     public enum TransactionDeferrableMode
     */
    @TestCase
    func test_transactiondeferrablemode_04(): Unit {
        @Expect(TransactionDeferrableMode.Unspecified == TransactionDeferrableMode.Unspecified, true)
        @Expect(TransactionDeferrableMode.Deferrable == Deferrable, true)
        @Expect(TransactionDeferrableMode.NotDeferrable == NotDeferrable, true)

        @Expect(TransactionDeferrableMode.Unspecified != Deferrable, true)
        @Expect(TransactionDeferrableMode.Deferrable != NotDeferrable, true)
        @Expect(TransactionDeferrableMode.NotDeferrable != TransactionDeferrableMode.Unspecified, true)

        @Expect(TransactionDeferrableMode.Unspecified.toString(),"Unspecified")
        @Expect(TransactionDeferrableMode.Deferrable.toString(),"Deferrable")
        @Expect(TransactionDeferrableMode.NotDeferrable.toString(),"Not Deferrable")
        @Expect(TransactionDeferrableMode.Deferrable.hashCode(),"Deferrable".hashCode())
    }
}
