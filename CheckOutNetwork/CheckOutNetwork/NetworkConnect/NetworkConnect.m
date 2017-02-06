//
//  NetworkConnect.m
//  CheckOutNetwork
//
//  Created by xiangronghua on 2017/2/6.
//  Copyright © 2017年 xiangronghua. All rights reserved.
//

#import "NetworkConnect.h"
#import "AFNetworking.h"

@implementation NetworkConnect

+ (void)canConnectNetworkWithViewController:(UIViewController *)viewController completion:(void (^)(BOOL))completion {
    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        if (status == -1 || status == 0) {
            completion(NO);
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"无网络，前往设置打开网络" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction = [UIAlertAction  actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
               NSLog(@"cancelAction");
            }];
            UIAlertAction *ensureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                NSLog(@"ensureAction");
                NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                UIApplication *application = [UIApplication sharedApplication];
                if ([application canOpenURL:url]){
                    [application openURL:url options:@{} completionHandler:^(BOOL success) {
                        
                    }];
                }
            }];
            
            [alertController addAction:cancelAction];
            [alertController addAction:ensureAction];
            [viewController presentViewController:alertController animated:YES completion:nil];
        } else {
            completion(YES);
        }
    }];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

@end
