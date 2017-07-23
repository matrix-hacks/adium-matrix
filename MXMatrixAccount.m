//
//  MXMatrixAccount.m
//  AdiumMatrix
//
//  Based on microblog-purple created by jsippel on 1/7/09.
//

#import "MXMatrixAccount.h"
#import "libmatrix.h"
#import <Adium/AIStatus.h>
#import <Adium/ESDebugAILog.h>


@implementation MXMatrixAccount

- (const char *)protocolPlugin
{
    return PRPL_ID;
}

- (PurpleAccount *)getPurpleAccount {
    return account;
}

// Bridge Adium settings over to the libpurple side
- (void) configurePurpleAccount
{
    
    AILog(@"Configuring Matrix Plugin");
    [super configurePurpleAccount];
//    
//    NSString* steam_guard_code;
//    
//    //Default encoding
//    if ((steam_guard_code = [self preferenceForKey:@"steam_guard_code" group:GROUP_ACCOUNT_STATUS])) {
//        purple_account_set_string(account, "steam_guard_code", [steam_guard_code UTF8String]);
//    }
//    
//    NSString* identifyAs;
//    if ((identifyAs = [self preferenceForKey:@"ui_mode" group:GROUP_ACCOUNT_STATUS])) {
//        purple_account_set_string(account, "ui_mode", [identifyAs UTF8String]);
//    }
//    
//    purple_account_set_bool(account, "always_use_https", [[self preferenceForKey:@"always_use_https" group:GROUP_ACCOUNT_STATUS] boolValue]);
//    purple_account_set_bool(account, "change_status_to_game", [[self preferenceForKey:@"change_status_to_game" group:GROUP_ACCOUNT_STATUS] boolValue]);
//    purple_account_set_bool(account, "download_offline_history", [[self preferenceForKey:@"download_offline_history" group:GROUP_ACCOUNT_STATUS] boolValue]);
}


- (NSString *)host
{
    return @"matrix.org";
}

- (const char *)purpleStatusIDForStatus:(AIStatus *)statusState
                              arguments:(NSMutableDictionary *)arguments
{
    char *statusID = NULL;
    
    switch (statusState.statusType) {
        case AIAvailableStatusType:
            statusID = "Online";
            break;
            
        case AIOfflineStatusType:
            statusID = "Offline";
            break;
    }
    
    return statusID;
}


@end
