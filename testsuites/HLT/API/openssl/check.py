# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import os
import subprocess
import sys
import re
from typing import *

# OpenSSL存在一部分符号不被仓颉侧封装，该部分符号使用白名单来管理
# 未来仓颉可能新增封装OpenSSL符号，新增的符号将不存在于该白名单中，如果存在问题则将导致报错
white_list: Set[str] = {
    'BIO_clear_retry_flags',
    'BIO_eof',
    'BIO_get_mem_ptr',
    'BIO_new_mem',
    'BIO_set_retry_read',
    'BIO_set_retry_write',
    'BN_num_bytes',
    'CJAddName',
    'CJCertFree',
    'CJCheckKeyType',
    'CJCreateCert',
    'CJGetCertLen',
    'CJGetNameDer',
    'CJGetNamePtr',
    'CJGetPriKeyPtr',
    'CJGetPubKeyPtr',
    'CJGetX509CsrDnsNames',
    'CJGetX509CsrEmailAddresses',
    'CJGetX509CsrIpAddresses',
    'CJGetX509DnsNames',
    'CJGetX509EmailAddresses',
    'CJGetX509ExtKeyUsage',
    'CJGetX509IpAddresses',
    'CJGetX509KeyUsage',
    'CJGetX509ReqDer',
    'CJKeyFree',
    'CJNameFree',
    'CJNameNew',
    'CJNameStackFree',
    'CJNameStackNew',
    'CJReqAddExtension',
    'CJVerifyX509Cert',
    'CJX509DescribePrivateKey',
    'CJX509EncryptPrivateKey',
    'CJX509NameAddEntry',
    'CJX509ReqFree',
    'CJX509ReqNew',
    'CJX509ReqSetPubkey',
    'CJX509ReqSetSubject',
    'CJX509ReqSign',
    'CJ_KEYS_OAEPSetting',
    'CJ_TLS_InitEmbeddedKeylessProvider',
    'CJ_TLS_RegisterKeylessDecryptCallback',
    'CJ_TLS_RegisterKeylessSignCallback',
    'OPENSSL_memdup',
    'OPENSSL_secure_free',
    'OPENSSL_secure_malloc',
    'OPENSSL_strdup',
    'OPENSSL_strndup',
    'OPENSSL_zalloc',
    'SHA1',
    'SSL_CTX_add0_chain_cert',
    'SSL_CTX_set1_sigalgs_list',
    'SSL_CTX_set_dh_auto',
    'SSL_CTX_set_max_proto_version',
    'SSL_CTX_set_min_proto_version',
    'SSL_CTX_set_mode',
    'SSL_CTX_set_session_cache_mode',
    'SSL_CTX_set_tlsext_servername_callback',
    'SSL_set_tlsext_host_name',
}

windows_specific_white_list = [
    'DYN_BIO_pending',
    'DYN_CJ_SystemRootCerts',
]

class Symbol:
    def __init__(self, file_name: str, symbol_type: str, symbol_name: str):
        self.file_name = file_name
        self.symbol_type = symbol_type
        self.symbol_name = symbol_name

def main() -> None:
    target = sys.argv[1]
    library_file_path = sys.argv[2]
    if not os.path.exists(library_file_path):
        print('file does not exist: {}'.format(library_file_path))
        sys.exit(1)
    result = subprocess.run(['nm', '-A', library_file_path], capture_output=True, text=True, check=True)
    symbol_list: List[Symbol] = []
    for line in result.stdout.split('\n'):
        # 带有偏移量的情况
        m = re.match(r'^(.+?):\s+[0-9a-fA-F]+\s+([a-zA-Z?])\s+(.+)$', line)
        if m:
            symbol = Symbol(file_name=m.group(1).strip(), symbol_type=m.group(2).strip(), symbol_name=m.group(3).strip())
            symbol_list.append(symbol)
        # 不带有偏移量的情况
        m = re.match(r'^(.+?):\s+([a-zA-Z?])\s+(.+)$', line)
        if m:
            symbol = Symbol(file_name=m.group(1).strip(), symbol_type=m.group(2).strip(), symbol_name=m.group(3).strip())
            symbol_list.append(symbol)
    
    # 断言至少存在一个以上的符号
    if len(symbol_list) == 0:
        print(f'no symbol found in {library_file_path}')
        exit(1)
    
    # 开始检查算法
    check_pass = True
    l = {
        'darwin_aarch64_cjnative',
        'darwin_x86_64_cjnative',
        'ios_aarch64_cjnative',
        'ios_simulator_aarch64_cjnative',
        'ios_simulator_x86_64_cjnative',
    }
    prefix = '_DYN' if target in l else 'DYN_'
    global white_list
    white_list = {f'_DYN_{s}' if target in l else f'DYN_{s}' for s in white_list}
    for symbol in symbol_list:
        if symbol.symbol_type == 'U' and symbol.symbol_name.startswith(prefix):
            m = re.match(f'^{prefix}(.+)$', symbol.symbol_name)
            assert m
            name = m.group(1)
            # 查找是否存在对应U符号
            find_result = [s for s in symbol_list if s.symbol_type == 'U' and s.symbol_name == name]

            # 预期找到有且仅有一个对应符号
            if len(find_result) == 0:
                # 如果在白名单中，则不认为是问题
                if symbol.symbol_name in white_list:
                    print(f'in common white list: {symbol.symbol_name}')
                    continue
                # Windows有特殊用到的符号，需要单独维护一个白名单
                if target == 'windows_x86_64_cjnative' and symbol.symbol_name in windows_specific_white_list:
                    print(f'in Windows-specific white list: {symbol.symbol_name}')
                    continue
                print(f'no corresponding symbol: {symbol.symbol_name}')
                check_pass = False
            elif len(find_result) == 1:
                print(f'symbol check pass: {symbol.symbol_name}')
                continue
            else:
                print(f'more than one corresponding symbol: {symbol.symbol_name}')
                check_pass = False
    
    if check_pass:
        sys.exit(0)
    else:
        sys.exit(1)


if __name__ == '__main__':
    main()
