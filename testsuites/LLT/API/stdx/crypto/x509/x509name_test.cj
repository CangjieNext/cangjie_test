/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./files
// EXEC: %compiler  %import-cangjie-stdx  %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_utest_opt %run_args
import std.fs.File
import stdx.crypto.x509.*

@Test
class Test_X509name {
    @TestCase
    func test_init_01(): Unit {
        var x509Name = X509Name(
            countryName: "CN",
            provinceName: "beijing",
            localityName: "haidian",
            organizationName: "organization",
            organizationalUnitName: "organization unit",
            commonName: "x509",
            email: "test@email.com"
        )
        @Assert(x509Name.countryName == Some("CN"), true)
        @Assert(x509Name.provinceName == Some("beijing"), true)
        @Assert(x509Name.localityName == Some("haidian"), true)
        @Assert(x509Name.organizationName == Some("organization"), true)
        @Assert(x509Name.organizationalUnitName == Some("organization unit"), true)
        @Assert(x509Name.commonName == Some("x509"), true)
        @Assert(x509Name.email == Some("test@email.com"), true)
    }

    @TestCase
    func test_prop_01(): Unit {
        let readPath = "./files/root_rsa.cer"
        let pem = String.fromUtf8(File.readFrom(readPath))
        let certificates = X509Certificate.decodeFromPem(pem)
        var x509Name = certificates[0].subject
        @Assert(x509Name.countryName == Some("CN"), true)
        @Assert(x509Name.provinceName == Some("GuangDong"), true)
        @Assert(x509Name.localityName == Some("ShenZhen"), true)
        @Assert(x509Name.organizationName == Some("PMS Technologies Co., Ltd"), true)
        @Assert(x509Name.organizationalUnitName == Some("OSS & Service Tools Dept"), true)
        @Assert(x509Name.commonName == Some("OSS3.0 CA"), true)
        @Assert(x509Name.email == None, true)
    }
}
