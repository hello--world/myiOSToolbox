//
//  ViewController.m
//  iOSToolbox
//
//  Created by HeFengyang on 2017/1/3.
//  Copyright © 2017年 HeFengyang. All rights reserved.
//

#import "ViewController.h"
#import "UIView+FYFindView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
//    [self findSuberViews:nil];
    NSURL *url = [NSURL URLWithString:@"hfy://safemode"];
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
        NSLog(@"完成啦");
    }];

}

- (void)findSuberViews:(UIView *)superView {

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"哈哈" message:@"呵呵" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *alertAction1 = [UIAlertAction actionWithTitle:@"测试1" style:UIAlertActionStyleDefault handler:NULL];
    UIAlertAction *alertAction2 = [UIAlertAction actionWithTitle:@"测试2" style:UIAlertActionStyleDefault handler:NULL];
    UIAlertAction *alertAction3 = [UIAlertAction actionWithTitle:@"测试3" style:UIAlertActionStyleDefault handler:NULL];
    
    [alert addAction:alertAction1];
    [alert addAction:alertAction2];
    [alert addAction:alertAction3];

    [self presentViewController:alert animated:YES completion:^{

        [alert.view fy_findSuberViewWithSuperView:@"_UIVisualEffectFilterView" callBackBlock:^(UIView *needView) {
            NSLog(@"view -- >> %@",needView );
        } allView:YES];
//
//        [alert.view fy_findSuberViewWithSuperView:@"UIView" callBackBlock:^(UIView *needView) {
//            NSLog(@"view -- >> %@",needView );
//        } allView:YES];
//        [alert.view fy_findSuberViewWithSuperView:@"UIView" callBackBlock:^(UIView *needView) {
//            NSLog(@"view -- >> %@",needView );
//        } allView:NO];
      
        [alert.view fy_findSuberViewWithSuperView:^(UIView *view) {
            NSLog(@"view1 -- >> %@",view );

        } conditionBlock:^BOOL(UIView *view) {
            return [view isKindOfClass:[UIView class]];
        } allView:NO];
        
        [alert.view fy_findSuberViewWithSuperView:^(UIView *view) {
            NSLog(@"view2 -- >> %@",view );
            
        } conditionBlock:^BOOL(UIView *view) {
            return [view isKindOfClass:[UIView class]];
        } allView:YES];
        
    }];
    
}

- (void)dealloc {
    NSLog(@"哈哈哈%@",self);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
