//
//  MXMatrixService.m
//  AdiumMatrix
//
//  Based on microblog-purple created by jsippel on 1/7/09.
//  Based on skypeweb4adium created by Tobias Tangemann on 26.04.15.
//

#import "MXMatrixService.h"
#import "MXMatrixAccount.h"

#import <Adium/AIStatusControllerProtocol.h>
#import <AIUtilities/AIStringUtilities.h>
#import <AIUtilities/AIImageAdditions.h>
#import <Adium/AISharedAdium.h>
#import <Adium/AIStatusControllerProtocol.h>
#import "SteamSettingsViewController.h"


#import "libmatrix.h"


@implementation MXMatrixService

//Account Creation
- (Class)accountClass{
	return [MXMatrixAccount class];
}

// Service Description
- (AIServiceImportance)serviceImportance { return AIServicePrimary; }
- (NSString *) serviceCodeUniqueID       { return @"libpurple-matrix"; }
- (NSString *) serviceID                 { return @"Matrix"; }
- (NSString *) serviceClass              { return @"Matrix"; }
- (NSString *) shortDescription          { return @"Matrix"; }
- (NSString *) longDescription           { return @"Matrix"; }
- (NSUInteger) allowedLength             { return 64; }
- (BOOL) requiresPassword                { return YES; }
- (BOOL) supportsPassword                { return YES; }
- (BOOL) caseSensitive                   { return YES; }
- (BOOL) canRegisterNewAccounts          { return NO; }

//
//- (AIAccountViewController *) accountViewController {
//    return [[SteamSettingsViewController alloc] init];
//}

- (NSImage *)defaultServiceIconOfType:(AIServiceIconType)iconType
{
    
    if ((iconType == AIServiceIconSmall) || (iconType == AIServiceIconList)) {
        return [NSImage imageNamed:@"matrix-16px" forClass:[self class] loadLazily:YES];
    } else {
        return [NSImage imageNamed:@"matrix-48px" forClass:[self class] loadLazily:YES];
    }

}

- (NSString *)pathForDefaultServiceIconOfType:(AIServiceIconType)iconType
{
    if ((iconType == AIServiceIconSmall) || (iconType == AIServiceIconList)) {
        return [[NSBundle bundleForClass:[self class]] pathForImageResource:@"matrix-16px"];
    }
    return [[NSBundle bundleForClass:[self class]] pathForImageResource:@"matrix-48px"];
}

- (void)registerStatus:(NSString*) status_name ofType:(AIStatusType) status_type
{
    [adium.statusController registerStatus:status_name
                           withDescription:[adium.statusController localizedDescriptionForCoreStatusName:status_name]
                                    ofType:status_type forService:self];
}

- (void)registerStatuses{
    [self registerStatus: @"Online" ofType:AIAvailableStatusType];
    [self registerStatus: @"Offline"   ofType:AIOfflineStatusType];
}


@end


