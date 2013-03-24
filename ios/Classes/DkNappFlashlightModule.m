/**
 * Module developed by Napp CMS
 * Mads Møller
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "DkNappFlashlightModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation DkNappFlashlightModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"9428441d-ad49-455d-bf6f-c31cb17f0945";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"dk.napp.flashlight";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
    if (NSClassFromString(@"AVCaptureDevice") != nil) {
        device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    } else {
        NSLog(@"NappFlashlight init error: AVCaptureDevice not found");
    }
    
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
    if([self isFlashLightOn:NULL]){
        //switch off the light
        [self turnFlashLightOff:NULL];
    }
    
	// you *must* call the superclass
	[super shutdown:sender];
}

-(void)suspend:(id)sender
{
    if([self isFlashLightOn:NULL]){
        //switch off the light
        [self turnFlashLightOff:NULL];
    }
    [super suspend:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
    RELEASE_TO_NIL(device);
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(NSNumber *)isFlashLightSupported:(id)args
{
    if ([device hasTorch]) {
        return NUMBOOL(YES);
    } else {
        return NUMBOOL(NO);
    }
    
}

-(NSNumber *)isFlashLightOn:(id)args
{
    return [device isTorchActive] ? NUMBOOL(YES) : NUMBOOL(NO);
}

-(void)turnFlashLightOn:(id)args
{
    if ([device hasTorch]) {
        [device lockForConfiguration:nil];
        [device setTorchMode:AVCaptureTorchModeOn]; 
        [device unlockForConfiguration];
    }
}

-(void)turnFlashLightOff:(id)args
{
    if ([device hasTorch]) {
        [device lockForConfiguration:nil];
        [device setTorchMode:AVCaptureTorchModeOff];  
        [device unlockForConfiguration];
    }
}

-(void)toggleFlashLight:(id)args
{
    [device isTorchActive] ? [self turnFlashLightOff:NULL] : [self turnFlashLightOn:NULL];
}

@end
