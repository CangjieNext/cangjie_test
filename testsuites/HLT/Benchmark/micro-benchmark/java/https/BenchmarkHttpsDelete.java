/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package https;

import com.sun.net.httpserver.*;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import javax.net.ssl.SSLContext;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.security.KeyManagementException;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.UnrecoverableKeyException;
import java.security.cert.CertificateException;
import java.security.spec.InvalidKeySpecException;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkHttpsDelete {
    static int port;
    static HttpsServer httpsServer;
    static OkHttpClient client;
    static Request request;
    @Setup(Level.Iteration)
    public void startServerAndClient() throws IOException, UnrecoverableKeyException, CertificateException, NoSuchAlgorithmException, InvalidKeySpecException, KeyStoreException, KeyManagementException {
        // 配置SSL
        String certPath = "/usr/local/nginx/data/end_rsa.cer";
        String keyPath = "/usr/local/nginx/data/end_rsa_private_key.pem";
        SSLContext sslContext = TlsHelper.getServerSSlContextFromRsaPem(certPath, keyPath);

        // start SSL Server
        httpsServer = HttpsServer.create(new InetSocketAddress(0), 0);
        httpsServer.setHttpsConfigurator(new HttpsConfigurator(sslContext));

        httpsServer.createContext("/dd", new TestHandler());
        httpsServer.start();
        port = httpsServer.getAddress().getPort();

        // startClient
        client = TlsHelper.getUnsafeOkHttpClient();
        request = new Request.Builder()
                .url("https://127.0.0.1:" + port + "/dd")
                .delete()
                .build();
    }

    static class TestHandler implements HttpHandler {
        @Override
        public void handle(HttpExchange exchange) throws IOException {
            exchange.sendResponseHeaders(200, -1);
        }
    }

    @TearDown(Level.Iteration)
    public void closeServerAndClient() {
        client.dispatcher().cancelAll();
        client.connectionPool().evictAll();
        client.dispatcher().executorService().shutdown();
        httpsServer.stop(0);
    }

    @Benchmark
    public Response BenchmarkHttpsDelete() throws IOException {
        return client.newCall(request).execute();
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkHttpsDelete.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
