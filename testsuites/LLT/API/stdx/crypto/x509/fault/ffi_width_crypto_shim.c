/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * Crypto shim for the x509 FFI return-width LLT test (ffi_int_width_test.cj).
 *
 * Built as a shared library that depends on the real libcrypto and is fed to
 * the stdx dynamicLoader through the STDX_OPENSSL_CRYPTO_FILE environment
 * variable, so every OpenSSL symbol the stdx native code resolves comes from
 * this shim (and, through its dependency, from the real libcrypto).
 *
 * The shim interposes the DER encoders i2d_X509 / i2d_X509_REQ. Default
 * behaviour is a full passthrough to the real libcrypto symbols. The test
 * arms each fault independently through the environment variables
 * FFI_WIDTH_FAULT_I2D_X509 / FFI_WIDTH_FAULT_I2D_X509_REQ (set via the
 * FFIWidthSetI2DX509* foreign functions); when armed, the interposer returns
 * -1, the OpenSSL-documented error return of the DER encoders, which is
 * exactly the state the stdx x509 code must surface as X509Exception.
 */
#include <dlfcn.h>
#include <stddef.h>
#include <stdlib.h>

typedef int (*i2d_fn)(void *, unsigned char **);

static i2d_fn real_i2d_x509 = NULL;
static i2d_fn real_i2d_x509_req = NULL;

static int fault_armed(const char *name)
{
    const char *v = getenv(name);
    return v != NULL && v[0] == '1';
}

static i2d_fn resolve_real(i2d_fn *cached, const char *symbol)
{
    if (*cached != NULL) {
        return *cached;
    }
    /* The real libcrypto is a DT_NEEDED dependency of this shim, so it is in
     * the shim's own dependency scope: RTLD_NEXT finds the real encoder. */
    *cached = (i2d_fn)dlsym(RTLD_NEXT, symbol);
    if (*cached == NULL) {
        /* Fallback: load libcrypto explicitly. "libcrypto.so.3" is the soname
         * recorded in the shim's DT_NEEDED, so dlopen returns the very same
         * instance and no cross-instance ASN.1 objects are created. */
        void *handle = dlopen("libcrypto.so.3", RTLD_LAZY | RTLD_LOCAL);
        if (handle == NULL) {
            handle = dlopen("libcrypto.so", RTLD_LAZY | RTLD_LOCAL);
        }
        if (handle != NULL) {
            *cached = (i2d_fn)dlsym(handle, symbol);
        }
    }
    return *cached;
}

int i2d_X509(void *x, unsigned char **out)
{
    i2d_fn real = resolve_real(&real_i2d_x509, "i2d_X509");
    if (fault_armed("FFI_WIDTH_FAULT_I2D_X509")) {
        return -1;
    }
    if (real == NULL) {
        return -1;
    }
    return real(x, out);
}

int i2d_X509_REQ(void *x, unsigned char **out)
{
    i2d_fn real = resolve_real(&real_i2d_x509_req, "i2d_X509_REQ");
    if (fault_armed("FFI_WIDTH_FAULT_I2D_X509_REQ")) {
        return -1;
    }
    if (real == NULL) {
        return -1;
    }
    return real(x, out);
}
