/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import java.util.ArrayList;
import java.util.concurrent.*;
class Page{
    public String address;
    public String expectedDigest;
    public int expectedStatus;
    public byte[] contents;
}
class RequestParameter{
    public int pageSize;
    public int pageNum;
}
class RequestHeader{
    public String accept;
    public String acceptEncoding;
    public String acceptLanguage;
    public String connection;
    public String cookie;
    public String host;
    public String Referer;
    public String secChUa;
    public String SecChUaMobile;
    public String SecChUaPlatform;
    public String SecFetchDest;
    public String SecFetchMode;
    public String SecFetchSite;
    public String UpgradeInsecureRequests;
    public String UserAgent;
}
class Request{
    public static String BASIC_AUTH;
    public static String FORM_AUTH;
    public static String CLIENT_CERT_AUTH;
    public static String DIGEST_AUTH;
    public RequestParameter requestParameter;
    public String requestUrl;
    public String requestMethod;
    public RequestHeader requestHeader;
}
class ResponseHeader{
    public int Bdpagetype;
    public String Bdqid;
    public String CacheControl;
    public int Ckpacknum;
    public String Ckrndstr;
    public String Connection;
    public String ContentEncoding;
    public String ContentSecurity_Policy;
    public String ContentType;
    public String Date;
    public String Server;
    public String SetCookie;
    public String StrictTransportSecurity;
    public long Traceid;
    public String TransferEncoding;
    public String Vary;
    public String XUaCompatible;
}
class ResponseBody{
    public Page[] pages;
}
class Response{
    public int statusCode;
    public ResponseHeader responseHeader;
    public ResponseBody responseBody;
}

public class websmall {
    public static void service(Request request, Response response){
        int pageNum = getRequestPageNum(request);
        int pageSize = getRequestPageSize(request);
        response = new Response();
        ResponseHeader responseHeader = new ResponseHeader();
        ResponseBody responseBody = new ResponseBody();
        initResponseBody(responseBody, pageNum, pageSize);
        response.responseHeader = responseHeader;
        response.responseBody = responseBody;
    }
    public static void initResponseBody(ResponseBody responseBody, int pageNum, int pageSize){
        Page[] pages = new Page[pageNum];
        for(int i = 0; i < pageNum; i += 1){
            pages[i] = new Page();
            byte[] contents = new byte[pageSize];
            pages[i].contents = contents;
        }
        responseBody.pages = pages;
    }
    public static void batchRun(int totalThreadNum, int pageNum, int pageSize){
        ArrayList<Thread> ScopeLocalThreadsPool = new ArrayList<>();

        for(int i = 0; i < totalThreadNum; i += 1){
            Request request = ConstructRequest(pageNum, pageSize);
            Response response = null;
            ScopeLocalThreadsPool.add(new Thread(() -> service(request, response)));
            ScopeLocalThreadsPool.get(ScopeLocalThreadsPool.size()-1).start();
        }
        ScopeLocalThreadsPool.forEach(thread -> {
            try {
                thread.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        });

    }
    public static void main(String[] args){
        int totalThreadNum = 9;
        int pageNum = 8000;
        int pageSize = 4096;
        int batchSize = 300;
        for(int i = 0; i < batchSize; i += 1){
            batchRun(totalThreadNum, pageNum, pageSize);
        }
    }
    public static Request ConstructRequest(int pageNum, int pageSize){
        Request request = new Request();
        initRequest(request, pageNum, pageSize);
        return request;
    }
    public static void initRequest(Request request, int pageNum, int pageSize){
        RequestParameter requestParameter = new RequestParameter();
        initRequestParameter(requestParameter, pageNum, pageSize);
        RequestHeader requestHeader = new RequestHeader();
        request.requestParameter = requestParameter;
        request.requestHeader = requestHeader;
    }
    public static void initRequestParameter(RequestParameter requestParameter, int pageNum, int pageSize){
        requestParameter.pageNum = pageNum;
        requestParameter.pageSize = pageSize;
    }
    public static int getRequestPageNum(Request request){
        RequestParameter requestParameter = request.requestParameter;
        int pageNum = requestParameter.pageNum;
        return pageNum;
    }
    public static int getRequestPageSize(Request request){
        RequestParameter requestParameter = request.requestParameter;
        int pageSize = requestParameter.pageSize;
        return pageSize;
    }
}


