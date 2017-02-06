//
//  ViewController.m
//  CheckOutNetwork
//
//  Created by xiangronghua on 2017/2/6.
//  Copyright © 2017年 xiangronghua. All rights reserved.
//

#import "ViewController.h"
#import "NetworkConnect.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [NetworkConnect canConnectNetworkWithViewController:self completion:^(BOOL ok) {
        if (ok) {
            self.title = @"ok";
        } else {
            NSLog(@"fail");
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
