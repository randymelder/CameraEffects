//
//  ViewController.m
//  CameraEffects
//
//  Created by Randy Melder on 12/20/15.
//  Copyright © 2015 RCM Software, LLC. All rights reserved.
//

#import "ViewController.h"
#import "CrossHairsViewController.h"
#import "LandscapeImagePickerControllerViewController.h"

#import <MobileCoreServices/UTCoreTypes.h>

@interface ViewController ()

@property (nonatomic) CrossHairsViewController *crosshairs;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.overlayImage   = [UIImage imageNamed:@"photoCenterFrame.png"];
    self.crosshairs     = [[CrossHairsViewController alloc] initWithNibName:@"CrossHairsViewController" bundle:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)doOpenCamera01Button:(id)sender {
    // make sure this device has a camera
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        LandscapeImagePickerControllerViewController *picker = [[LandscapeImagePickerControllerViewController alloc] init];
        picker.mediaTypes           = [NSArray arrayWithObject:(NSString *)kUTTypeImage];
        picker.sourceType           = UIImagePickerControllerSourceTypeCamera;
        picker.allowsEditing        = NO;
        picker.showsCameraControls  = YES;
        picker.view.center          = self.view.center;
        picker.edgesForExtendedLayout = UIRectEdgeNone;
        picker.delegate             = self;
        picker.modalPresentationStyle = UIModalPresentationFormSheet;
        
        
        // set up the overlay if user wants it
        if (self.overlayImage != nil) {
            
            
            CrossHairsViewController *overlay = self.crosshairs;
            overlay.view.center         = picker.view.center;
            overlay.crossHairsImageView.translatesAutoresizingMaskIntoConstraints = NO;
            picker.cameraOverlayView    = overlay.view;
            
            
        }
        
        [self presentViewController:picker animated:YES completion:nil];
        
    } else {
        UIAlertController *alert    = [UIAlertController alertControllerWithTitle:@"Camera not available"
                                                                       message:@"Your device does not support a cameral. #SadPanda"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action       = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    //self.overlayImage = [info objectForKey:UIImagePickerControllerOriginalImage];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)deviceOrientationDidChange:(NSNotification *)notification {
    //Obtain current device orientation
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    
    //Do my thing
    NSLog(@"%s\n%ld", __FUNCTION__, (long)orientation);
}

@end
