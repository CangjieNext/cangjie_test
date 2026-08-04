/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package https;

import okhttp3.OkHttpClient;

import javax.net.ssl.*;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.security.*;
import java.security.cert.Certificate;
import java.security.cert.CertificateException;
import java.security.cert.CertificateFactory;
import java.security.cert.X509Certificate;
import java.security.interfaces.RSAPrivateKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.util.Base64;

public class TlsHelper {
    public static SSLContext getServerSSlContextFromRsaPem(String certPath, String keyPath) throws IOException, CertificateException, NoSuchAlgorithmException, InvalidKeySpecException, KeyStoreException, UnrecoverableKeyException, KeyManagementException {
        return TlsServerHelper.getSSlContextFromRsaPem(certPath, keyPath);
    }

    public static OkHttpClient getUnsafeOkHttpClient() throws NoSuchAlgorithmException, KeyManagementException {
        return TlsClientHelper.getUnsafeOkHttpClient();
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

class TlsServerHelper {
    private static String CERT_BEG = "-----BEGIN CERTIFICATE-----";
    private static String CERT_END = "-----END CERTIFICATE-----";
    private static String KEY_BEG = "-----BEGIN PRIVATE KEY-----";
    private static String KEY_END = "-----END PRIVATE KEY-----";

    public static SSLContext getSSlContextFromRsaPem(String certPath, String keyPath) throws IOException, CertificateException, NoSuchAlgorithmException, InvalidKeySpecException, KeyStoreException, UnrecoverableKeyException, KeyManagementException {
        // 读取证书 & 密钥数据
        byte[] certData = decodingBase64FromFile(certPath, CERT_BEG, CERT_END);
        byte[] keyData = decodingBase64FromFile(keyPath, KEY_BEG, KEY_END);

        // 转换成证书类
        X509Certificate cert = X509Cert(certData);
        RSAPrivateKey key = rsaPrivateKey(keyData);

        // jks 需要设置密码
        char[] passwd = getVariable("SRYPTO_PASSWORD").getOrThrow().toCharArray();

        // 构建 KeyStore, 用于构建 KeyManager -- SSLContext 必须
        KeyStore ks = KeyStore.getInstance("JKS");
        ks.load(null);
        ks.setCertificateEntry("cert-alias", cert);
        ks.setKeyEntry("key-alias", key, passwd, new Certificate[]{cert});

        // KeyManager 列表由 KeyManagerFactory 创建， -- SSLContext 必须
        KeyManagerFactory kmf = KeyManagerFactory.getInstance("SunX509");
        kmf.init(ks, passwd);

        SSLContext ssl = SSLContext.getInstance("TLS");
        ssl.init(kmf.getKeyManagers(), null, null);
        return ssl;
    }

    private static X509Certificate X509Cert(byte[] cert) throws CertificateException {
        return (X509Certificate) CertificateFactory.getInstance("X.509").generateCertificate(new ByteArrayInputStream(cert));
    }

    private static RSAPrivateKey rsaPrivateKey(byte[] key) throws NoSuchAlgorithmException, InvalidKeySpecException {
        return (RSAPrivateKey) KeyFactory.getInstance("RSA").generatePrivate(new PKCS8EncodedKeySpec(key));
    }

    private static byte[] decodingBase64FromFile(String path, String beg, String end) throws IOException {
        byte[] fileData = Files.readAllBytes(Paths.get(path));
        String base64EncodedData = new String(fileData).split(beg)[1].split(end)[0].trim();
//        System.out.println("base64: " + base64EncodedData);
        return Base64.getMimeDecoder().decode(base64EncodedData.getBytes(StandardCharsets.UTF_8));
//        return DatatypeConverter.parseBase64Binary(base64EncodedData);
    }
}