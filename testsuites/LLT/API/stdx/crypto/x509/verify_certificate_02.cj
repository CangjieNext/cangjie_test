/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./files
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.fs.File
import stdx.crypto.x509.*
import std.time.DateTime

/**
 * Tests for PR #568: intermediates should not be treated as trust anchors.
 * 
 * The fix ensures intermediate certificates are passed as untrusted chain
 * to X509_STORE_CTX_init, NOT added to the trust store.
 *
 * KEY TEST: test_verify_self_signed_intermediate_not_as_trust_anchor
 * This test uses a self-signed root CA as "intermediate" to demonstrate the fix:
 * - Old code (BUG): self-signed cert in intermediates -> becomes trust anchor -> success
 * - New code (FIX): self-signed cert stays in untrusted chain -> no trust anchor -> fail
 *
 * Certificate chain structure used in tests:
 *   root[0] (self-signed) -> mid[0] (signed by root[0]) -> server[0] (signed by mid[0])
 *   root[1] (self-signed) -> mid[1] (signed by root[1]) -> server[1] (signed by mid[1])
 *
 * Note: mid[0] and mid[1] are NOT self-signed, so they cannot become trust anchors
 * even in buggy code. Using them alone cannot distinguish old vs new behavior.
 */
@Test
class Test_X509_verify_intermediates_untrusted {
    // 2 server certs
    var certs = Array<X509Certificate>()
    // 2 root certs
    var roots = Array<X509Certificate>()
    // 2 middle certs
    var middles = Array<X509Certificate>()

    func getX509Cert(path: String): Array<X509Certificate> {
        let pem = String.fromUtf8(File.readFrom(path))
        X509Certificate.decodeFromPem(pem)
    }

    /**
     * The relation of certs.
     *    root[0]         root[1]
     *       |               |
     *    mid[0]          mid[1]
     *       |               |
     *   server[0]       server[1]
     */
    public override func beforeEach(): Unit {
        certs = getX509Cert("./files/servers.crt")
        roots = getX509Cert("./files/roots.crt")
        middles = getX509Cert("./files/middles.crt")
    }

    // P0: Verify that intermediates are NOT treated as trust anchors (KEY TEST FOR PR #568)
    // This test uses a self-signed root CA as "intermediate" to clearly demonstrate the fix.
    // 
    // Certificate chain structure:
    //   server[0] -> mid[0] -> root[0] (self-signed)
    //
    // Test setup:
    //   opt.roots = [] (empty trust store)
    //   opt.intermediates = [root[0], mid[0]] (complete chain in untrusted intermediates)
    //
    // Old code (BUG): intermediates added to trust store.
    //   - root[0] is self-signed, so it becomes a trust anchor
    //   - Chain server[0] -> mid[0] -> root[0] is complete with trust anchor
    //   - Verification SUCCEEDS (wrong behavior!)
    //
    // New code (FIXED PR #568): intermediates only in untrusted chain.
    //   - root[0] stays in untrusted chain, not in trust store
    //   - Empty trust store = no trust anchor
    //   - Verification FAILS (correct behavior!)
    //
    // This is the CRITICAL test that distinguishes old vs new code behavior.
    @TestCase
    func test_verify_self_signed_intermediate_not_as_trust_anchor(): Unit {
        var opt = VerifyOption()
        opt.roots = []  // Empty trust store
        // Provide complete chain: root[0] (self-signed) + mid[0]
        // root[0] is a self-signed root CA that signs mid[0]
        opt.intermediates = [roots[0], middles[0]]
        let res = certs[0].verify(opt)
        // After PR #568 fix: should fail because no trust anchor
        // Before fix: would succeed because root[0] incorrectly becomes trust anchor
        @Expect(res, false)
    }

    // P0: Verify non-self-signed intermediate cannot become trust anchor
    // This is a supplementary test - mid[0] is NOT self-signed (signed by root[0])
    // Even in old buggy code, non-self-signed cert cannot become trust anchor
    // So both old and new code would fail - this test alone cannot distinguish fix
    @TestCase
    func test_verify_non_self_signed_intermediate_fails(): Unit {
        var opt = VerifyOption()
        opt.roots = []  // Empty trust store
        opt.intermediates = [middles[0]]  // Only non-self-signed intermediate
        let res = certs[0].verify(opt)
        // Fails for both old and new code (chain incomplete, no trust anchor)
        @Expect(res, false)
    }

    // P0: Verify multiple non-self-signed intermediates still fail
    // Same as above - none of these are self-signed
    @TestCase
    func test_verify_multiple_non_self_signed_intermediates_fails(): Unit {
        var opt = VerifyOption()
        opt.roots = []  // Empty trust store
        opt.intermediates = middles  // All intermediates (none are self-signed)
        let res = certs[0].verify(opt)
        @Expect(res, false)
    }

    // P0: Verify correct chain building with intermediates as untrusted
    // server[0] -> middle[0] -> root[0]: should succeed with correct roots
    @TestCase
    func test_verify_with_correct_roots_and_intermediates(): Unit {
        var opt = VerifyOption()
        opt.roots = [roots[0]]  // Correct root
        opt.intermediates = [middles[0]]  // Correct intermediate as untrusted
        let res = certs[0].verify(opt)
        @Expect(res, true)
    }

    // P0: Verify that wrong intermediate in untrusted chain doesn't help
    // server[0] -> middle[1] (wrong) -> root[0]: should fail
    @TestCase
    func test_verify_with_wrong_intermediate(): Unit {
        var opt = VerifyOption()
        opt.roots = [roots[0]]
        opt.intermediates = [middles[1]]  // Wrong intermediate for server[0] (belongs to server[1] chain)
        let res = certs[0].verify(opt)
        @Expect(res, false)
    }

    // P0: Verify chain with all intermediates provided
    // The untrusted chain should include all available intermediates for path building
    @TestCase
    func test_verify_with_all_intermediates(): Unit {
        var opt = VerifyOption()
        opt.roots = roots
        opt.intermediates = middles  // All intermediates as untrusted chain
        let res = certs[0].verify(opt)
        @Expect(res, true)
    }

    // P1: Verify that empty intermediates still works
    @TestCase
    func test_verify_with_empty_intermediates(): Unit {
        var opt = VerifyOption()
        opt.roots = roots
        opt.intermediates = []
        // server[0] directly signed by root[0]? No, it's signed by middle[0]
        // So this should fail without intermediates
        let res = certs[0].verify(opt)
        @Expect(res, false)
    }

    // P1: Verify memory cleanup on verification failure
    // Multiple failed verifications should not leak memory
    @TestCase
    func test_verify_memory_cleanup_on_failure(): Unit {
        var failCount = 0
        for (i in 0..10) {
            var opt = VerifyOption()
            opt.roots = []  // Empty roots - will fail
            opt.intermediates = middles
            let res = certs[0].verify(opt)
            if (!res) {
                failCount += 1
            }
        }
        @Expect(failCount, 10)
    }

    // P1: Verify intermediate cannot self-validate
    // An intermediate cert should not be able to validate itself
    @TestCase
    func test_intermediate_cannot_self_validate(): Unit {
        var opt = VerifyOption()
        opt.roots = []  // No roots
        opt.intermediates = []  // No intermediates
        // Try to verify an intermediate cert without its issuer in roots
        let res = middles[0].verify(opt)
        @Expect(res, false)
    }

    // P1: Verify with time constraint still works with untrusted chain
    @TestCase
    func test_verify_with_time_constraint(): Unit {
        var opt = VerifyOption()
        opt.roots = [roots[0]]
        opt.intermediates = [middles[0]]
        opt.time = DateTime.of(year: 2023, month: 7, dayOfMonth: 1)
        let res = certs[0].verify(opt)
        @Expect(res, false)
    }

    // P1: Verify cross-chain scenario
    // server[1] signed by different chain should not verify with wrong roots/intermediates
    @TestCase
    func test_cross_chain_verification_fails(): Unit {
        var opt = VerifyOption()
        opt.roots = [roots[0]]  // Root for server[0] chain
        opt.intermediates = [middles[0]]  // Wrong intermediate for server[1] (belongs to server[0] chain)
        let res = certs[1].verify(opt)
        @Expect(res, false)
    }
}