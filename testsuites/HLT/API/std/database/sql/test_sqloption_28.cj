/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt

import std.database.sql.*

@Test
class Test_sqloption_28 {
    /*
     * Test description:
     *     test parameter of the class SqlOption
     * Test API:
     *     public class SqlOption
     */
    @TestCase
    func test_sqloption_01(): Unit {
        @Expect(SqlOption.URL, "url")
        @Expect(SqlOption.Host, "host")
        @Expect(SqlOption.Username, "username")
        @Expect(SqlOption.Password, "password")
        @Expect(SqlOption.Driver, "driver")
        @Expect(SqlOption.Database, "database")
        @Expect(SqlOption.Encoding, "encoding")
        @Expect(SqlOption.ConnectionTimeout, "connection_timeout")
        @Expect(SqlOption.UpdateTimeout, "update_timeout")
        @Expect(SqlOption.QueryTimeout, "query_timeout")
        @Expect(SqlOption.FetchRows, "fetch_rows")
        @Expect(SqlOption.SSLMode, "ssl.mode")
        @Expect(SqlOption.SSLModePreferred, "ssl.mode.preferred")
        @Expect(SqlOption.SSLModeDisabled, "ssl.mode.disabled")
        @Expect(SqlOption.SSLModeRequired, "ssl.mode.required")
        @Expect(SqlOption.SSLModeVerifyCA, "ssl.mode.verify_ca")
        @Expect(SqlOption.SSLModeVerifyFull, "ssl.mode.verify_full")
        @Expect(SqlOption.SSLCA, "ssl.ca")
        @Expect(SqlOption.SSLCert, "ssl.cert")
        @Expect(SqlOption.SSLKey, "ssl.key")
        @Expect(SqlOption.SSLKeyPassword, "ssl.key.password")
        @Expect(SqlOption.SSLSni, "ssl.sni")
        @Expect(SqlOption.Tls12Ciphersuites, "tls1.2.ciphersuites")
        @Expect(SqlOption.Tls13Ciphersuites, "tls1.3.ciphersuites")
        @Expect(SqlOption.TlsVersion, "tls.version")
    }
}
