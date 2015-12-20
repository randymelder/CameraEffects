//
//  ViewController.h
//  CameraEffects
//
//  Created by Randy Melder on 12/20/15.
//  Copyright © 2015 RCM Software, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
    
}

@property (nonatomic) UIImage *overlayImage;

@end

