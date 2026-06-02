/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#include <openssl/crypto.h>
#include <openssl/ec.h>
#include <openssl/err.h>
#include <openssl/evp.h>
#include <openssl/pem.h>
#include <openssl/rsa.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
enum cj_sig_scheme
{
    CJ_SCHEME_AUTO = 0,
    CJ_SCHEME_RSA_PSS = 1,
    CJ_SCHEME_RSA_PKCS1 = 2,
    CJ_SCHEME_ECDSA = 3
};

int mock_sign(const EVP_PKEY* pkey, const unsigned char* data, size_t dataLen, unsigned char* sig, size_t sigcap, size_t* siglen)
{
    if (!pkey || !data || !sig || !siglen) {
        fprintf(stdout, "[mock_sign] invalid args\n");
        return 0;
    }

    int type = EVP_PKEY_base_id(pkey);

    /* =========================
   * RSA 分支：原始私钥幂模运算（RSASP1）
   * ========================= */
    if (type == EVP_PKEY_RSA) {
        fprintf(stdout, "[mock_sign] Key type: RSA\n");
        const RSA* rsa = EVP_PKEY_get0_RSA((EVP_PKEY*)pkey);
        if (!rsa) {
            fprintf(stdout, "[mock_sign][RSA] get0_RSA failed\n");
            return 0;
        }
        size_t modlen = (size_t)RSA_size(rsa);
        if (sigcap < modlen) {
            fprintf(stdout, "[mock_sign][RSA] sigcap(%zu) < modlen(%zu)\n", sigcap, modlen);
            return 0;
        }

        unsigned char* em = OPENSSL_malloc(modlen);
        if (!em) {
            fprintf(stdout, "[mock_sign][RSA] OPENSSL_malloc failed\n");
            return 0;
        }
        if (dataLen >= modlen) {
            memcpy(em, data + (dataLen - modlen), modlen);
        } else {
            size_t pad = modlen - dataLen;
            memset(em, 0, pad);
            memcpy(em + pad, data, dataLen);
        }

        int ret = RSA_private_encrypt((int)modlen, em, sig, (RSA*)rsa, RSA_NO_PADDING);
        OPENSSL_cleanse(em, modlen);
        OPENSSL_free(em);
        if (ret <= 0) {
            fprintf(stdout, "[mock_sign][RSA] RSA_private_encrypt failed\n");
            return 0;
        }
        if ((size_t)ret != modlen) {
            fprintf(stdout, "[mock_sign][RSA] unexpected ret=%d (modlen=%zu)\n", ret, modlen);
            return 0;
        }
        *siglen = modlen;
        ERR_clear_error();
        return 1;
    }

    /* =========================
   * ECDSA 分支：digest → DER(ECDSA_SIG)
   * ========================= */
    if (type == EVP_PKEY_EC) {
        fprintf(stdout, "[mock_sign] Key type: EC\n");
        const EC_KEY* ec = EVP_PKEY_get0_EC_KEY((EVP_PKEY*)pkey);
        if (!ec) {
            fprintf(stdout, "[mock_sign][EC] get0_EC_KEY failed\n");
            return 0;
        }

        const EC_GROUP* grp = EC_KEY_get0_group((EC_KEY*)ec);
        if (!grp) {
            fprintf(stdout, "[mock_sign][EC] no group\n");
            return 0;
        }
        int nid = EC_GROUP_get_curve_name(grp);

        const EVP_MD* md = NULL;
        size_t mdlen = 0;
        switch (nid) {
            case NID_X9_62_prime256v1:
                md = EVP_sha256();
                mdlen = 32;
                break; // P-256
            case NID_secp384r1:
                md = EVP_sha384();
                mdlen = 48;
                break; // P-384
            case NID_secp521r1:
                md = EVP_sha512();
                mdlen = 64;
                break; // P-521（按常规用 SHA-512）
            default:
                // 不认识的曲线：保守用 SHA-256
                md = EVP_sha256();
                mdlen = 32;
                break;
        }

        unsigned char H[64]; // 最大 64
        if (dataLen == mdlen) {
            // 上层已传来哈希
            memcpy(H, data, mdlen);
        } else {
            // 传来的是原文：本地先哈希成 mdlen
            EVP_MD_CTX* mctx = EVP_MD_CTX_new();
            if (!mctx) {
                fprintf(stdout, "[mock_sign][EC] EVP_MD_CTX_new failed\n");
                return 0;
            }
            if (EVP_DigestInit_ex(mctx, md, NULL) != 1 || EVP_DigestUpdate(mctx, data, dataLen) != 1 || EVP_DigestFinal_ex(mctx, H, NULL) != 1) {
                EVP_MD_CTX_free(mctx);
                fprintf(stdout, "[mock_sign][EC] Digest failed\n");
                return 0;
            }
            EVP_MD_CTX_free(mctx);
        }

        ECDSA_SIG* esig = ECDSA_do_sign(H, (int)mdlen, (EC_KEY*)ec);
        if (!esig) {
            fprintf(stdout, "[mock_sign][EC] ECDSA_do_sign failed\n");
            return 0;
        }

        int need = i2d_ECDSA_SIG(esig, NULL);
        if (need <= 0 || (size_t)need > sigcap) {
            fprintf(stdout, "[mock_sign][EC] DER len=%d cap=%zu\n", need, sigcap);
            ECDSA_SIG_free(esig);
            return 0;
        }
        unsigned char* p = sig;
        int wrote = i2d_ECDSA_SIG(esig, &p);
        ECDSA_SIG_free(esig);
        if (wrote <= 0) {
            fprintf(stdout, "[mock_sign][EC] i2d_ECDSA_SIG failed\n");
            return 0;
        }

        *siglen = (size_t)wrote;
        ERR_clear_error();
        return 1;
    }

    fprintf(stdout, "[mock_sign] unsupported key type: %d\n", type);
    return 0;
}

int mock_decrypt(const EVP_PKEY* pkey, const unsigned char* enc_data, int64_t enc_data_len, unsigned char* out, size_t out_max, size_t* out_len)
{
    fprintf(stdout, "[Mock Decryptor] Entered\n");
    if (EVP_PKEY_base_id(pkey) != EVP_PKEY_RSA) {
        fprintf(stdout, "[Mock Decryptor] Unsupported key type for decryption\n");
        return 0;
    }

    RSA* rsa = EVP_PKEY_get1_RSA((EVP_PKEY*)pkey);
    if (!rsa) {
        fprintf(stdout, "[Mock Decryptor] Failed to get RSA key\n");
        ERR_print_errors_fp(stdout);
        return 0;
    }

    // int len = RSA_private_decrypt((int)enc_data_len, enc_data, out, rsa, RSA_PKCS1_OAEP_PADDING);
    int len = RSA_private_decrypt((int)enc_data_len, enc_data, out, rsa, RSA_PKCS1_PADDING);
    if (len < 0) {
        fprintf(stdout, "[Mock Decryptor] RSA decryption failed\n");
        ERR_print_errors_fp(stdout);
        RSA_free(rsa);
        return 0;
    }

    if ((size_t)len > out_max) {
        fprintf(stdout, "[Mock Decryptor] Output buffer too small: need %d, have %zu\n", len, out_max);
        RSA_free(rsa);
        return 0;
    }

    *out_len = (size_t)len;
    RSA_free(rsa);
    return 1;
}

extern EVP_PKEY* der_blob_to_pkey(const char* derBlob, size_t derLen)
{
    const unsigned char* p = (const unsigned char*)derBlob;
    EVP_PKEY* pkey = d2i_PrivateKey(EVP_PKEY_RSA, NULL, &p, derLen);
    if (!pkey) {
        p = (const unsigned char*)derBlob;
        pkey = d2i_PrivateKey(EVP_PKEY_EC, NULL, &p, derLen);
    }
    if (!pkey) {
        fprintf(stdout, "[DER to PKEY] Failed to parse DER blob\n");
        ERR_print_errors_fp(stdout);
    }
    return pkey;
}

extern char* CJ_TLS_MockDecrypt(const unsigned char* data, const int64_t dataLen, const EVP_PKEY* pkey, int64_t* written)
{
    fprintf(stdout, "[CJ_TLS_MockDecrypt] Entered\n");
    size_t siglen = 0;
    unsigned char sig[512];
    if (!pkey) {
        fprintf(stdout, "[CJ_TLS_MockDecrypt] NULL pkey\n");
        return NULL;
    }
    if (!data || dataLen <= 0) {
        fprintf(stdout, "[CJ_TLS_MockDecrypt] invalid digest\n");
        return NULL;
    }
    if (!mock_decrypt(pkey, data, dataLen, sig, sizeof(sig), &siglen) || siglen == 0) {
        return NULL;
    }
    *written = (int64_t)siglen;
    unsigned char* result = malloc(siglen);
    if (!result) {
        return NULL;
    }
    memcpy(result, sig, siglen);
    return (char*)result;
}

extern char* CJ_TLS_MockSign(const unsigned char* data, const int64_t dataLen, const EVP_PKEY* pkey, int64_t* written)
{
    size_t siglen = 0;
    unsigned char sig[512];
    if (!pkey) {
        fprintf(stdout, "[CJ_TLS_MockSign] NULL pkey\n");
        return NULL;
    }
    if (!data || dataLen <= 0) {
        fprintf(stdout, "[CJ_TLS_MockSign] invalid digest\n");
        return NULL;
    }
    if (!mock_sign(pkey, data, dataLen, sig, sizeof(sig), &siglen) || siglen == 0) {
        return NULL;
    }
    *written = (int64_t)siglen;
    unsigned char* result = malloc(siglen);
    if (!result) {
        return NULL;
    }
    memcpy(result, sig, siglen);
    return (char*)result;
}
