/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package diagnosticsTest.dts_error

public struct DomainAccountInfo {
    public DomainAccountInfo(
        public let domain: String,
        public let accountName: String
    ) {}
}

@C
struct CDomainAccountInfo {
    CDomainAccountInfo(
        public let domain: CString,
        public let accountName: CString
    ) {}

    init(domainInfo: DomainAccountInfo) {
        this.domain = unsafe { LibC.mallocCString(domainInfo.domain) }
        this.accountName = unsafe { LibC.mallocCString(domainInfo.accountName) }
    }

    func toDomainAccountInfo(): DomainAccountInfo {
        return DomainAccountInfo(domain.toString(), accountName.toString())
    }

    func free() {
        unsafe {
            LibC.free(domain)
            LibC.free(accountName)
        }
    }
}

func foo() {
    CDomainAccountInfo
}
