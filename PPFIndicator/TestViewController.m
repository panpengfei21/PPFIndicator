//
//  TestViewController.m
//  PPFIndicator
//
//  Created by 潘鹏飞 on 2019/6/10.
//  Copyright © 2019 JianDePu. All rights reserved.
//

#import "TestViewController.h"
#import "PPFIndicator-Swift.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    PPFIndicator * indicator = [[PPFIndicator alloc] initWithItemWidth:100 height:30];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
