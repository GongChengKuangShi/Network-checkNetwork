//
//  NetworkConnect.h
//  CheckOutNetwork
//
//  Created by xiangronghua on 2017/2/6.
//  Copyright © 2017年 xiangronghua. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface NetworkConnect : NSObject

+ (void)canConnectNetworkWithViewController:(UIViewController *)viewController completion:(void (^)(BOOL))completion;

@end
