//
//  socket.h
//  Hammerspoon
//
//  Copyright (c) 2016 Michael Bujol
//

static int refTable = LUA_NOREF;

typedef struct _asyncSocketUserData {
    int selfRef;
    void *asyncSocket;
} asyncSocketUserData;

// These constants are used to set CocoaAsyncSocket's built-in userData to distinguish socket types.
// Foreign client sockets (from netcat for example) connecting to our listening sockets are of type
// GCDAsyncSocket/GCDAsyncUdpSocket and attempting to place our subclass's new properties on them will fail
static const NSString *DEFAULT = @"DEFAULT";
static const NSString *SERVER = @"SERVER";
static const NSString *CLIENT = @"CLIENT";
