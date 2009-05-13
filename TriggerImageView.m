//
//  TriggerImageView.m
//  Snarf
//
//  Created by Justin R. Miller on 6/13/07.
//  Copyright 2007 Code Sorcery Workshop. All rights reserved.
//

#import "TriggerImageView.h"

@implementation TriggerImageView

- (id)init
{
    self = [super init];
    
    if (self != nil)
    {
        [self registerForDraggedTypes:[NSArray arrayWithObject:NSFilenamesPboardType]];
    }
    
    return self;
}

- (NSDragOperation)draggingEntered:(id <NSDraggingInfo>)sender
{
    //
    // Handle dragging entry and validate if an application or not.
    //
    
    NSString *path = [[[sender draggingPasteboard] propertyListForType:NSFilenamesPboardType] objectAtIndex:0];
        
    if ([[[sender draggingPasteboard] propertyListForType:NSFilenamesPboardType] count] == 1 && [path hasSuffix:@".icns"])
    {
        return NSDragOperationCopy;
    }
    else
    {
        return NSDragOperationNone;
    }
}

- (BOOL)performDragOperation:(id <NSDraggingInfo>)sender
{
    //
    // Handle drag release and process if an application.
    //
    
    NSString *path = [[[sender draggingPasteboard] propertyListForType:NSFilenamesPboardType] objectAtIndex:0];
    [[NSApp delegate] application:NSApp openFile:path];
        
    return YES;
}

@end