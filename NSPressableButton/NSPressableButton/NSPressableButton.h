//
//  NSPressableButton.h
//  NSPressableButton
//
//  Created by He Rin Kim on 4/14/14.
//  Copyright (c) 2014 He Rin Kim & Thanakron Tandavas. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, UIButtonStyle) {
    square,
    rounded,
    circle
};

@interface NSPressableButton : UIButton

@property(nonatomic, strong, readwrite) UIColor *buttonColor UI_APPEARANCE_SELECTOR;
@property(nonatomic, readwrite) CGFloat shadowHeight UI_APPEARANCE_SELECTOR;
@property(nonatomic, readwrite) CGFloat cornerRadius UI_APPEARANCE_SELECTOR;

/**
 * Set button style
 *
 * @param style Choose between: square, rounded, or circle
 */
@property(nonatomic, readwrite) UIButtonStyle style;

@end
