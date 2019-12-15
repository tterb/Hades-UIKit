//
//  ReddiftTextView.h
//  Hades
//
//  Created by Brett Stevenson on 12/14/19.
//  Copyright © 2019 Brett Stevenson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UZTextView/UZTextView.h>

@class ReddiftTextView;

@protocol ReddiftTextViewDelegate <UZTextViewDelegate>
@end

@interface ReddiftTextView : UZTextView {
    BOOL _isPushedUIMenuController;
}
@property (nonatomic, assign) id <ReddiftTextViewDelegate> UZDelegate;
@end
