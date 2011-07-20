//LaunchNotifier by Fr0st
//Inspired by iStartupSound
//This was fun to make :)
//This took a while to figure out, so
//Please do not steal this…


#import <AVFoundation/AVFoundation.h>
#import <objc/runtime.h>

#define FILE_PATH @"/System/Library/CoreServices/SpringBoard.app/appsound.mp3"

%hook SBApplicationIcon

-(void)launch { 

    NSFileManager *soundFile=[NSFileManager defaultManager];

	NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:FILE_PATH];

		if([soundFile fileExistsAtPath:FILE_PATH]) {

        AVAudioPlayer *appSound = [[AVAudioPlayer alloc]initWithContentsOfURL:fileURL error:nil];
       
	 [appSound play];
	 [appSound release];
	
    }
	
	%orig;
}

%end