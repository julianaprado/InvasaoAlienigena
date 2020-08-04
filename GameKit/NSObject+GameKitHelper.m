//
//  NSObject+GameKitHelper.m
//  Aliens
//
//  Created by Juliana Prado on 04/08/20.
//  Copyright © 2020 Juliana Prado. All rights reserved.
//

#import "NSObject+GameKitHelper.h"

@implementation NSObject (GameKitHelper)

+ (instancetype)sharedGameKitHelper
{
    static GameKitHelper *sharedGameKitHelper;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      sharedGameKitHelper = [[GameKitHelper alloc] init];
    });
    return sharedGameKitHelper;
    
 
}


@end

@implementation GameKitHelper {
    BOOL _enableGameCenter;
    
   
}
- (id)init
    {
        self = [super init];
        if (self) {
          _enableGameCenter = YES;
        }
        return self;
    }
- (void)authenticateLocalPlayer
{
    //1
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    
    //2
    localPlayer.authenticateHandler  =
    ^(UIViewController *viewController, NSError *error) {
        //3
        [self setLastError:error];
        
        if(viewController != nil) {
            //4
            [self setAuthenticationViewController:viewController];
        } else if([GKLocalPlayer localPlayer].isAuthenticated) {
            //5
            self->_enableGameCenter = YES;
        } else {
            //6
            self->_enableGameCenter = NO;
        }
    };
}

- (void)setAuthenticationViewController:(UIViewController *)authenticationViewController
{
}

- (void)setLastError:(NSError *)error
{
}
@end

