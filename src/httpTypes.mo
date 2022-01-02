module {
    public type Request = {
        body: Blob;
        headers: [HeaderField];
        method: Text;
        url: Text;
    };

    public type HeaderField = (Text, Text);

    public type Response = {
        body: Blob;
        headers: [HeaderField];
        status_code: Nat16;
        streaming_strategy: ?StreamingStrategy;
    };
    
    public type StreamingCallbackToken =  {
        content_encoding: Text;
        index: Nat;
        key: Text;
        sha256: ?Blob;
    };

    public type StreamingStrategy = {
        #Callback: {
            callback: query (StreamingCallbackToken) -> async (StreamingCallbackResponse);
            token: StreamingCallbackToken;
        };
    };

    public type StreamingCallbackResponse = {
        body: Blob;
        token: ?StreamingCallbackToken;
    };
}
