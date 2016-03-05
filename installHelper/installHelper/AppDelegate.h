//
//  AppDelegate.h
//  installHelper
//
//  Created by Gavin on 05/03/2016.
//  Copyright © 2016 gpardoe.co.uk. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>


@property (unsafe_unretained) IBOutlet NSTextView *textBox;
@property (weak) IBOutlet NSProgressIndicator *spinningWheel;
@property (unsafe_unretained) IBOutlet NSTextView *textLabel;
@property (unsafe_unretained) IBOutlet NSTextView *infoText;

- (IBAction)help:(id)sender;

@property (weak) IBOutlet NSPanel *theSheet;

- (IBAction)closeSheet:(id)sender;

@end

