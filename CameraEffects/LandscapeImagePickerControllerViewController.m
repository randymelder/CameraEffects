//
//  LandscapeImagePickerControllerViewController.m
//  CameraEffects
//
//  Created by Randy Melder on 12/20/15.
//  Copyright © 2015 RCM Software, LLC. All rights reserved.
//

#import "LandscapeImagePickerControllerViewController.h"

@interface LandscapeImagePickerControllerViewController ()

@end

@implementation LandscapeImagePickerControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(deviceOrientationDidChange:)
                                                 name:UIDeviceOrientationDidChangeNotification object: nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - 
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return (UIInterfaceOrientationMaskLandscape|UIInterfaceOrientationMaskPortrait);
}

-(BOOL)shouldAutorotate {
    return YES;
}

- (void)deviceOrientationDidChange:(NSNotification *)notification {
    //Obtain current device orientation
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    
    //Do my thing
    NSLog(@"%s\n%ld", __FUNCTION__, (long)orientation);
}


@end
