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
 * Built as a shared library that depends on the real libcrypto and is loaded
 * by the stdx dynamicLoader through the STDX_OPENSSL_CRYPTO_FILE environment
 * variable (see the EXEC/RUN-EXEC lines), so every OpenSSL symbol the stdx
 * native code resolves comes from this shim (and, through its dependency,
 * from the real libcrypto). The test binary links this library too, so the
 * fault arming controls below are reachable from Cangjie foreign function
 * declarations.
 *
 * The shim interposes the DER encoders i2d_X509 / i2d_X509_REQ. Default
 * behaviour is a full passthrough to the real libcrypto symbols. The test
 * arms each fault independently through the environment variables
 * FFI_WIDTH_FAULT_I2D_X509 / FFI_WIDTH_FAULT_I2D_X509_REQ (set via the
 * FFIWidthSetI2DX509* foreign functions); when armed, the interposer returns
 * -1, the OpenSSL-documented error return of the DER encoders, which is
 * exactly the state the stdx x509 code must surface as X509Exception.
 *
 * Portability: on POSIX (Linux/macOS/OHOS) the real encoders are found with
 * dlsym(RTLD_NEXT), with an explicit dlopen fallback for unversioned sonames;
 * on Windows they are found with LoadLibraryA/GetProcAddress on the common
 * OpenSSL 3 DLL names. Arming state is exchanged through the process
 * environment (setenv/_putenv) because the shim is a separate library that
 * cannot hold pointers into the test binary.
 */
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>

/* RTLD_NEXT (and the setenv declaration on glibc/musl) is a GNU extension
 * guarded by _GNU_SOURCE; toolchains that do not predefine it (e.g. system
 * clang used by the CI gate) need it before any system include. It is
 * ignored on macOS and not reached on Windows. */
#ifndef _GNU_SOURCE
#define _GNU_SOURCE
#endif

#if defined(_WIN32)
#include <windows.h>
#define FFI_WIDTH_EXPORT __declspec(dllexport)
#else
#include <dlfcn.h>
#define FFI_WIDTH_EXPORT __attribute__((visibility("default")))
#endif

typedef int (*i2d_fn)(void *, unsigned char **);

static i2d_fn real_i2d_x509 = NULL;
static i2d_fn real_i2d_x509_req = NULL;

static int fault_armed(const char *name)
{
    const char *v = getenv(name);
    return v != NULL && v[0] == '1';
}

static void arm_fault(const char *name, int armed)
{
#if defined(_WIN32)
    /* _putenv keeps the CRT environ (read by getenv) and the process env in
     * sync for the mingw/msvcrt runtime used by the LLT toolchain. */
    char buf[64];
    (void)snprintf(buf, sizeof(buf), "%s=%s", name, armed ? "1" : "0");
    (void)_putenv(buf);
#else
    setenv(name, armed ? "1" : "0", 1);
#endif
}

#if defined(_WIN32)
static HMODULE g_realCrypto = NULL;

static i2d_fn resolve_real(i2d_fn *cached, const char *symbol)
{
    if (*cached != NULL) {
        return *cached;
    }
    if (g_realCrypto == NULL) {
        /* Try the common OpenSSL 3 DLL names shipped with the stdx/windows
         * distribution. */
        const char *names[] = {"libcrypto-3-x64.dll", "libcrypto-3.dll", "libcrypto.dll"};
        size_t i;
        for (i = 0; i < sizeof(names) / sizeof(names[0]); i++) {
            g_realCrypto = LoadLibraryA(names[i]);
            if (g_realCrypto != NULL) {
                break;
            }
        }
    }
    if (g_realCrypto != NULL) {
        *cached = (i2d_fn)GetProcAddress(g_realCrypto, symbol);
    }
    return *cached;
}
#else
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
         * instance and no cross-instance ASN.1 objects are created. The
         * unversioned name preserves Android/OHOS compatibility. */
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
#endif

FFI_WIDTH_EXPORT int i2d_X509(void *x, unsigned char **out)
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

FFI_WIDTH_EXPORT int i2d_X509_REQ(void *x, unsigned char **out)
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

FFI_WIDTH_EXPORT void FFIWidthSetI2DX509Fault(int armed)
{
    arm_fault("FFI_WIDTH_FAULT_I2D_X509", armed);
}

FFI_WIDTH_EXPORT void FFIWidthSetI2DX509ReqFault(int armed)
{
    arm_fault("FFI_WIDTH_FAULT_I2D_X509_REQ", armed);
}
