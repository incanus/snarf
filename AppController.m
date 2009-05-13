//
//  AppController.m
//  Snarf
//
//  Created by Justin R. Miller on 3/25/08.
//  Copyright 2008 Code Sorcery Workshop. All rights reserved.
//

#import "AppController.h"

@implementation AppController

- (void)awakeFromNib
{
    [_window setBackgroundColor:[NSColor whiteColor]];
    [_window center];
}

- (BOOL)application:(NSApplication *)theApplication openFile:(NSString *)filename
{
    if ([filename hasSuffix:@".icns"])
    {
        NSImage *icon = [[NSImage alloc] initByReferencingFile:filename];
        [NSApp setApplicationIconImage:icon];
        [_imageView setImage:icon];
        [icon release];

        return YES;
    }
    else
    {
        NSBeep();
        
        return NO;
    }
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication
{
    return YES;
}

@end