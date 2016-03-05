//
//  AppDelegate.m
//  installHelper
//
//  Created by Gavin on 2015.
//  Copyright © 2015 gpardoe.co.uk. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    self.window.backgroundColor = [NSColor whiteColor];
    [self.window makeKeyAndOrderFront:nil];
    [self.window setLevel:NSStatusWindowLevel];
    [self launchActions];
    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (void)launchActions

{
    [self.spinningWheel startAnimation:self];
    NSRect screenSize = [[NSScreen mainScreen] frame];
    CGFloat percent = 0.8;
    CGFloat offset = (1.0 - percent) / 2.0;
    [self.window setFrame:NSMakeRect(screenSize.size.width * offset, screenSize.size.height * offset, screenSize.size.width * percent, screenSize.size.height * percent) display:YES];
    self.textLabel.string = @"Please wait while software is being installed";
    self.textBox.string = @"Loading Data...";
    self.infoText.string = @"The Install Helper is designed to assist with in place software installations, upgrades and configurations by preventing accidental interference. It also provides some feed back to you about what it happening.Please refrain from using your Mac while this process is running. The application will exit upon completion.";
    
    [NSTimer scheduledTimerWithTimeInterval:10.0 // NSTimer with Looped Operation of 'runLogLoop' Method. Will Repeat Method Untill Exit
                                     target:self
                                   selector:@selector(runLogLoop)
                                   userInfo:nil
                                    repeats:YES];
}

- (void)runLogLoop

{
    self.textBox.string = @"";
    
    NSURL *jamfLog = [NSURL fileURLWithPath:@"/var/log/jamf.log"]; //Creates Oject with Path to Log File
    
    NSString *logContents = [NSString stringWithContentsOfURL:jamfLog encoding:NSUTF8StringEncoding error:nil]; //Creates Oject with Contents of 'Path File'
    
    self.textBox.string = [self.textBox.string stringByAppendingString:[NSString stringWithFormat:@"\n%@", logContents]]; //Outputs 'logContents' to 'textBox'
    
    [self.textBox scrollRangeToVisible: NSMakeRange(self.textBox.string.length, 0)]; //Scrolls the 'textBox' to the Bottom
    
}


- (IBAction)help:(id)sender

{
    [NSApp beginSheet:_theSheet modalForWindow:(NSWindow *)_window modalDelegate:self didEndSelector:nil contextInfo:nil];
}

- (IBAction)closeSheet:(id)sender

{
    [NSApp endSheet:_theSheet];
    [_theSheet orderOut:sender];
}



@end
