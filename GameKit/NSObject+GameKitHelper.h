//
//  NSObject+GameKitHelper.h
//  Aliens
//
//  Created by Juliana Prado on 04/08/20.
//  Copyright © 2020 Juliana Prado. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@import GameKit;
extern NSString *const PresentAuthenticationViewController;

@interface GameKitHelper : NSObject
- (void)authenticateLocalPlayer;
@property (nonatomic, readonly) UIViewController *authenticationViewController;
@property (nonatomic, readonly) NSError *lastError;

+ (instancetype)sharedGameKitHelper;

@end

NS_ASSUME_NONNULL_END
