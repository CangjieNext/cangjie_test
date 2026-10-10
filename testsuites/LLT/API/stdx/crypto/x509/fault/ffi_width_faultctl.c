/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * Fault arming controls for the x509 FFI return-width test, compiled into the
 * test binary and reached from Cangjie through foreign func declarations. They
 * forward the arming request through the environment to the libcrypto shim
 * (fault/ffi_width_crypto_shim.c), which the stdx dynamicLoader loads through
 * the STDX_OPENSSL_CRYPTO_FILE environment variable set by the RUN-EXEC line.
 */
#include <stdlib.h>

void FFIWidthSetI2DX509Fault(int armed)
{
    setenv("FFI_WIDTH_FAULT_I2D_X509", armed ? "1" : "0", 1);
}

void FFIWidthSetI2DX509ReqFault(int armed)
{
    setenv("FFI_WIDTH_FAULT_I2D_X509_REQ", armed ? "1" : "0", 1);
}
