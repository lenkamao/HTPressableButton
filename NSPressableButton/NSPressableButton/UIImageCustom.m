//
//  UIImageCustom.m
//  NSPressableButton
//
//  Created by He Rin Kim on 4/14/14.
//  Copyright (c) 2014 He Rin Kim & Thanakron Tandavas. All rights reserved.
//

#import "UIImageCustom.h"

@implementation UIImage (NSPressableButton)

+ (UIImage *) buttonWithColor: (UIColor *) color
                      andSize: (CGSize) size
              andShadowHeight: (CGFloat) shadowHeight
              andCornerRadius:(CGFloat) cornerRadius
{
    UIImage *frontImage = [UIImage imageWithColor:color andSize:CGSizeMake(size.width, size.height)];
    UIImage *frontImage2 = [UIImage imageWithRoundedCorners:cornerRadius usingImage:frontImage];
    
    UIImage *backImage = [UIImage imageWithColor:[UIColor redColor] andSize:CGSizeMake(size.width, size.height+shadowHeight)];
    UIImage *backImage2 = [UIImage imageWithRoundedCorners:cornerRadius usingImage:backImage];

    
    UIImage *buttonImage;
    CGRect rect = CGRectMake(0, 0, backImage.size.width, backImage.size.height);
    
    // Begin context
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    
    // draw images
    [backImage2 drawAtPoint:CGPointMake(0, 0)];
    [frontImage2 drawAtPoint:CGPointMake(0, 0)];
    
    // grab context
    buttonImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // end context
    UIGraphicsEndImageContext();

    return buttonImage;
}

+ (UIImage *) buttonWithHighlightedColor: (UIColor *) color
                                 andSize: (CGSize) size
                         andShadowHeight: (CGFloat) shadowHeight
                         andCornerRadius:(CGFloat) cornerRadius
{
    UIImage *buttonImage = [UIImage imageWithHighlightedColor:color andSize:size andShadowHeight:shadowHeight andCornerRadius:cornerRadius];
    UIImage *buttonImage2 = [UIImage imageWithRoundedCorners:cornerRadius usingImage:buttonImage];
    
    CGRect rect = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height+shadowHeight);
    
    // Begin context
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    
    // draw images
    [buttonImage2 drawInRect:rect];
    
    // grab context
    UIGraphicsGetImageFromCurrentImageContext();
    
    // end context
    UIGraphicsEndImageContext();
    
    return buttonImage2;

}

+ (UIImage *) imageWithHighlightedColor: (UIColor *) color
                                andSize: (CGSize) size
                        andShadowHeight: (CGFloat) shadowHeight
                        andCornerRadius:(CGFloat) cornerRadius
{
    CGRect rect = CGRectMake(0, shadowHeight, size.width, size.height+shadowHeight);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSLog(@"in UIImage");
    
    return image;
}


+ (UIImage *) imageWithColor: (UIColor *) color
                     andSize: (CGSize) size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSLog(@"in UIImage");
    
    return image;
}

+ (UIImage *)imageWithRoundedCorners:(float)cornerRadius
                          usingImage:(UIImage *)original
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:original];
    
    // Begin a new image that will be the new image with the rounded corners
    // (here with the size of an UIImageView)
    UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, NO, 1.0);
    
    // Add a clip before drawing anything, in the shape of an rounded rect
    [[UIBezierPath bezierPathWithRoundedRect:imageView.bounds
                                cornerRadius:cornerRadius] addClip];
    // Draw your image
    [original drawInRect:imageView.bounds];
    
    // Get the image, here setting the UIImageView image
    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    
    // Lets forget about that we were drawing
    UIGraphicsEndImageContext();
    
    return imageView.image;
}

@end
