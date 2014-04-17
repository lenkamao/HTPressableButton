//
//  ViewController.m
//  NSPressableButton
//
//  Created by He Rin Kim on 4/14/14.
//  Copyright (c) 2014 He Rin Kim & Thanakron Tandavas. All rights reserved.
//

#import "ViewController.h"
#import "NSPressableButton.h"
#import "UIImageCustom.h"
#import "UIFlatColor.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.title=@"NSPressableButtons";
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"Show View" forState:UIControlStateNormal];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    button.layer.borderWidth = 1;
    [self.view addSubview:button];
    
    
    
    NSPressableButton *rectButton = [NSPressableButton buttonWithType:UIButtonTypeCustom];
    rectButton.frame = CGRectMake(40, 100, 160, 40);
    rectButton.buttonColor = [UIColor cyanColor];
    //rectButton.shadowHeight = 20.0;
    [rectButton setTitle:@"Rect" forState:UIControlStateNormal];
    [self.view addSubview:rectButton];
    
    NSPressableButton *roundedRectButton = [NSPressableButton buttonWithType:UIButtonTypeCustom];
    roundedRectButton.frame = CGRectMake(40, 150, 160, 40);
    roundedRectButton.style = @"rounded";
    roundedRectButton.buttonColor = [UIColor purpleColor];
    roundedRectButton.shadowHeight = 20.0;
    [roundedRectButton setTitle:@"Rounded" forState:UIControlStateNormal];
    [self.view addSubview:roundedRectButton];

    
    NSLog(@"in VIEW");

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
