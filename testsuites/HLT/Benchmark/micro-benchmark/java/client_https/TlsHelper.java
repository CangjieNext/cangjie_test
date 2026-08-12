/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package client_https;

import okhttp3.OkHttpClient;
import okhttp3.Protocol;

import javax.net.ssl.*;
import java.security.*;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.Arrays;

public class TlsHelper {

    public static OkHttpClient getUnsafeOkHttpClient() throws NoSuchAlgorithmException, KeyManagementException {
        return TlsClientHelper.getUnsafeOkHttpClient();
    }

    public static OkHttpClient getUnsafeOkHttp2Client() throws NoSuchAlgorithmException, KeyManagementException {
        return Http2ClientHelper.getUnsafeOkHttp2Client();
    }
}

class TlsClientHelper {
    public static OkHttpClient getUnsafeOkHttpClient() throws NoSuchAlgorithmException, KeyManagementException {

        // 构建不校验的 TrustManger
        X509TrustManager tm = new X509TrustManager() {
            @Override
            public void checkClientTrusted(X509Certificate[] x509Certificates, String s) throws CertificateException {
                // do nothing
            }

            @Override
            public void checkServerTrusted(X509Certificate[] x509Certificates, String s) throws CertificateException {
                // do nothing
            }

            @Override
            public X509Certificate[] getAcceptedIssuers() {
                return new X509Certificate[0];
            }
        };

        // 通过 SSLContext 构建 SSLSocketFactory
        SSLContext ssl = SSLContext.getInstance("TLS");
        ssl.init(null, new TrustManager[]{tm}, null);
        SSLSocketFactory sf = ssl.getSocketFactory();

        // 构建 OkHttpClient
        return new OkHttpClient.Builder()
                .hostnameVerifier((hostName, session) -> true) // 不校验 host name
                .sslSocketFactory(sf, tm) // 不校验证书
                .build();
    }
}

class Http2ClientHelper {
    public static OkHttpClient getUnsafeOkHttp2Client() throws NoSuchAlgorithmException, KeyManagementException {

        // 构建不校验的 TrustManger
        X509TrustManager tm = new X509TrustManager() {
            @Override
            public void checkClientTrusted(X509Certificate[] x509Certificates, String s) throws CertificateException {
                // do nothing
            }

            @Override
            public void checkServerTrusted(X509Certificate[] x509Certificates, String s) throws CertificateException {
                // do nothing
            }

            @Override
            public X509Certificate[] getAcceptedIssuers() {
                return new X509Certificate[0];
            }
        };

        // 通过 SSLContext 构建 SSLSocketFactory
        SSLContext ssl = SSLContext.getInstance("TLS");
        ssl.init(null, new TrustManager[]{tm}, null);
        SSLSocketFactory sf = ssl.getSocketFactory();

        // 构建 OkHttpClient
        return new OkHttpClient.Builder()
                .hostnameVerifier((hostName, session) -> true) // 不校验 host name
                .sslSocketFactory(sf, tm) // 不校验证书
                .followRedirects(false)
                .retryOnConnectionFailure(true)
                .protocols(Arrays.asList(Protocol.HTTP_2, Protocol.HTTP_1_1))
                .build();
    }
}
