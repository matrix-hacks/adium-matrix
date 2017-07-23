//
//  MXMatrixLibPurpleServicePlugin.m
//  AdiumMatrix
//
//  Based on microblog-purple created by jsippel on 1/7/09.
//  Based on skypeweb4adium created by Tobias Tangemann on 26.04.15.
//

#import <Adium/ESDebugAILog.h>

#import "MXMatrixLibPurpleServicePlugin.h"
#import "MXMatrixService.h"
#import "libmatrix.h"

extern void purple_init_matrix_plugin();

@implementation MXMatrixLibPurpleServicePlugin

- (void) installPlugin
{
    AILog(@"Installing Matrix Plugin");
    purple_init_matrix_plugin();
    [MXMatrixService registerService];
}

- (void)loadLibpurplePlugin
{
    AILog(@"Loading Matrix Plugin %s (purple-matrix: "DISPLAY_VERSION")",[[self pluginVersion] UTF8String]);
}

- (NSString *)pluginAuthor      { return @"Keyvan Fatehi"; }
- (NSString *)pluginDescription { return @"Matrix"; }
- (NSString *)pluginURL         { return @"https://github.com/matrix-org/purple-matrix"; }
- (NSString *)pluginVersion     { return [[[NSBundle bundleForClass:[self class]] infoDictionary] objectForKey:@"CFBundleVersion"]; }

- (void)uninstallPlugin {}
- (void)installLibpurplePlugin {}

@end
